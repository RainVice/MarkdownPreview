import { _getDefaults } from './defaults';
import { _Lexer } from './Lexer';
import { _Hooks } from './Hooks';
import { _Tokenizer } from './Tokenizer';
import { escape, unescape } from './helpers';
import type { MarkedExtension, MarkedOptions } from './MarkedOptions';
import type { Token, Tokens, TokensList } from './Tokens';

export type MaybePromise = void | Promise<void>;

type UnknownFunction = (...args: unknown[]) => unknown;

export class Marked {
  defaults = _getDefaults();
  options = this.setOptions;
  Lexer = _Lexer;
  Tokenizer = _Tokenizer;
  Hooks = _Hooks;

  constructor(...args: MarkedExtension[]) {
    this.use(...args);
  }

  /**
   * Run callback for every token
   */
  walkTokens(tokens: Token[] | TokensList, callback: (token: Token) => MaybePromise | MaybePromise[]) {
    let values: MaybePromise[] = [];
    for (const token of tokens) {
      values = values.concat(callback.call(this, token));
      switch (token.type) {
        case 'table': {
          const tableToken = token as Tokens.Table;
          for (const cell of tableToken.header) {
            values = values.concat(this.walkTokens(cell.tokens, callback));
          }
          for (const row of tableToken.rows) {
            for (const cell of row) {
              values = values.concat(this.walkTokens(cell.tokens, callback));
            }
          }
          break;
        }
        case 'list': {
          const listToken = token as Tokens.List;
          values = values.concat(this.walkTokens(listToken.items, callback));
          break;
        }
        default: {
          const genericToken = token as Tokens.Generic;
          if (this.defaults.extensions?.childTokens?.[genericToken.type]) {
            this.defaults.extensions.childTokens[genericToken.type].forEach((childTokens) => {
              const tokens = genericToken[childTokens].flat(Infinity) as Token[] | TokensList;
              values = values.concat(this.walkTokens(tokens, callback));
            });
          } else if (genericToken.tokens) {
            values = values.concat(this.walkTokens(genericToken.tokens, callback));
          }
        }
      }
    }
    return values;
  }

  use(...args: MarkedExtension[]) {
    const extensions: MarkedOptions['extensions'] = this.defaults.extensions || { childTokens: {} };

    args.forEach((pack) => {
      // copy options to new object
      const opts = { ...pack } as unknown as MarkedOptions;

      // ==-- Parse "addon" extensions --== //
      if (pack.extensions) {
        pack.extensions.forEach((ext) => {
          if (!ext.name) {
            throw new Error('extension name required');
          }
          if ('tokenizer' in ext) { // Tokenizer Extensions
            if (!ext.level || (ext.level !== 'block' && ext.level !== 'inline')) {
              throw new Error("extension level must be 'block' or 'inline'");
            }
            const extLevel = extensions[ext.level];
            if (extLevel) {
              extLevel.unshift(ext.tokenizer);
            } else {
              extensions[ext.level] = [ext.tokenizer];
            }
            if (ext.start) { // Function to check for start of token
              if (ext.level === 'block') {
                if (extensions.startBlock) {
                  extensions.startBlock.push(ext.start);
                } else {
                  extensions.startBlock = [ext.start];
                }
              } else if (ext.level === 'inline') {
                if (extensions.startInline) {
                  extensions.startInline.push(ext.start);
                } else {
                  extensions.startInline = [ext.start];
                }
              }
            }
          }
          if ('childTokens' in ext && ext.childTokens) { // Child tokens to be visited by walkTokens
            extensions.childTokens[ext.name] = ext.childTokens;
          }
        });
        opts.extensions = extensions;
      }

      // ==-- Parse "overwrite" extensions --== //
      if (pack.tokenizer) {
        const tokenizer = this.defaults.tokenizer || new _Tokenizer(this.defaults);
        for (const prop in pack.tokenizer) {
          if (!(prop in tokenizer)) {
            throw new Error(`tokenizer '${prop}' does not exist`);
          }
          if (['options', 'rules', 'lexer'].includes(prop)) {
            // ignore options, rules, and lexer properties
            continue;
          }
          const tokenizerProp = prop as Exclude<keyof _Tokenizer, 'options' | 'rules' | 'lexer'>;
          const tokenizerFunc = pack.tokenizer[tokenizerProp] as UnknownFunction;
          const prevTokenizer = tokenizer[tokenizerProp] as UnknownFunction;
          // Replace tokenizer with func to run extension, but fall back if false
          tokenizer[tokenizerProp] = (...args: unknown[]) => {
            let ret = tokenizerFunc.apply(tokenizer, args);
            if (ret === false) {
              ret = prevTokenizer.apply(tokenizer, args);
            }
            return ret;
          };
        }
        opts.tokenizer = tokenizer;
      }

      // ==-- Parse Hooks extensions --== //
      if (pack.hooks) {
        const hooks = this.defaults.hooks || new _Hooks();
        for (const prop in pack.hooks) {
          if (!(prop in hooks)) {
            throw new Error(`hook '${prop}' does not exist`);
          }
          if (prop === 'options') {
            // ignore options property
            continue;
          }
          const hooksProp = prop as Exclude<keyof _Hooks, 'options'>;
          const hooksFunc = pack.hooks[hooksProp] as UnknownFunction;
          const prevHook = hooks[hooksProp] as UnknownFunction;
          if (_Hooks.passThroughHooks.has(prop)) {
            hooks[hooksProp] = (arg: unknown) => {

              const ret = hooksFunc.call(hooks, arg);
              return prevHook.call(hooks, ret);
            };
          } else {
            hooks[hooksProp] = (...args: unknown[]) => {
              let ret = hooksFunc.apply(hooks, args);
              if (ret === false) {
                ret = prevHook.apply(hooks, args);
              }
              return ret;
            };
          }
        }
        opts.hooks = hooks;
      }

      // ==-- Parse WalkTokens extensions --== //
      if (pack.walkTokens) {
        const walkTokens = this.defaults.walkTokens;
        const packWalktokens = pack.walkTokens;
        opts.walkTokens = function (token) {
          let values: MaybePromise[] = [];
          values.push(packWalktokens.call(this, token));
          if (walkTokens) {
            values = values.concat(walkTokens.call(this, token));
          }
          return values;
        };
      }

      this.defaults = { ...this.defaults, ...opts };
    });

    return this;
  }


  setOptions(opt: MarkedOptions) {
    this.defaults = { ...this.defaults, ...opt };
    return this;
  }

  lexer(src: string, options?: MarkedOptions) {
    return _Lexer.lex(src, options ?? this.defaults);
  }
}
