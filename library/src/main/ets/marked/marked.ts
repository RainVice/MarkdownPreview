import { _Lexer } from './Lexer';
import { _Tokenizer } from './Tokenizer';
import { _Hooks } from './Hooks';
import { Marked } from './Instance';
import { _getDefaults, changeDefaults, _defaults } from './defaults';
import type { MarkedExtension, MarkedOptions } from './MarkedOptions';
import type { Token, TokensList } from './Tokens';
import type { MaybePromise } from './Instance';

const markedInstance = new Marked();

export function marked() {
}

/**
 * Sets the default options.
 *
 * @param options Hash of options
 */
marked.options =
  marked.setOptions = function (options: MarkedOptions) {
    markedInstance.setOptions(options);
    marked.defaults = markedInstance.defaults;
    changeDefaults(marked.defaults);
    return marked;
  };

/**
 * Gets the original marked default options.
 */
marked.getDefaults = _getDefaults;

marked.defaults = _defaults;

/**
 * Use Extension
 */

marked.use = function (...args: MarkedExtension[]) {
  markedInstance.use(...args);
  marked.defaults = markedInstance.defaults;
  changeDefaults(marked.defaults);
  return marked;
};

/**
 * Run callback for every token
 */

marked.walkTokens = function (tokens: Token[] | TokensList, callback: (token: Token) => MaybePromise | MaybePromise[]) {
  return markedInstance.walkTokens(tokens, callback);
};


/**
 * Expose
 */
marked.Lexer = _Lexer;
marked.lexer = _Lexer.lex;
marked.Tokenizer = _Tokenizer;
marked.Hooks = _Hooks;
marked.parse = marked;

export const options = marked.options;

export const setOptions = marked.setOptions;

export const use = marked.use;

export const walkTokens = marked.walkTokens;

export const parse = marked;

export const lexer = _Lexer.lex;

export { _defaults as defaults, _getDefaults as getDefaults } from './defaults';

export { _Lexer as Lexer } from './Lexer';

export { _Tokenizer as Tokenizer } from './Tokenizer';

export { _Hooks as Hooks } from './Hooks';

export { Marked } from './Instance';

export * from './MarkedOptions';

export * from './rules';

export * from './Tokens';
