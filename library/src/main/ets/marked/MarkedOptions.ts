import type { Token, Tokens, TokensList } from './Tokens';
import type { _Lexer } from './Lexer';
import type { _Tokenizer } from './Tokenizer';
import type { _Hooks } from './Hooks';

export interface TokenizerThis {
  lexer: _Lexer;
}

export type TokenizerExtensionFunction = (this: TokenizerThis, src: string,
  tokens: Token[] | TokensList) => Tokens.Generic | undefined;

export type TokenizerStartFunction = (this: TokenizerThis, src: string) => number | void;

export interface TokenizerExtension {
  name: string;
  level: 'block' | 'inline';
  start?: TokenizerStartFunction | undefined;
  tokenizer: TokenizerExtensionFunction;
  childTokens?: string[] | undefined;
}

type HooksApi = Omit<_Hooks, 'constructor' | 'options'>;
type HooksObject = {
  [K in keyof HooksApi]?: (this: _Hooks,
    ...args: Parameters<HooksApi[K]>) => ReturnType<HooksApi[K]> | Promise<ReturnType<HooksApi[K]>>
};


type TokenizerApi = Omit<_Tokenizer, 'constructor' | 'options' | 'rules' | 'lexer'>;
type TokenizerObject = {
  [K in keyof TokenizerApi]?: (this: _Tokenizer,
    ...args: Parameters<TokenizerApi[K]>) => ReturnType<TokenizerApi[K]> | false
};

export interface MarkedExtension {
  /**
   * Enable GFM line breaks. This option requires the gfm option to be true.
   */
  breaks?: boolean | undefined;

  /**
   * Add tokenizers and renderers to marked
   */
  extensions?:
    | TokenizerExtension[]
    | undefined | null;

  /**
   * Enable GitHub flavored markdown.
   */
  gfm?: boolean | undefined;

  /**
   * Hooks are methods that hook into some part of marked.
   * preprocess is called to process markdown before sending it to marked.
   * processAllTokens is called with the TokensList before walkTokens.
   * postprocess is called to process html after marked has finished parsing.
   */
  hooks?: HooksObject | undefined | null;

  /**
   * Conform to obscure parts of markdown.pl as much as possible. Don't fix any of the original markdown bugs or poor behavior.
   */
  pedantic?: boolean | undefined;

  /**
   * The tokenizer defines how to turn markdown text into tokens.
   */
  tokenizer?: TokenizerObject | undefined | null;

  /**
   * The walkTokens function gets called with every token.
   * Child tokens are called before moving on to sibling tokens.
   * Each token is passed by reference so updates are persisted when passed to the parser.
   * The return value of the function is ignored.
   */
  walkTokens?: ((token: Token) => void | Promise<void>) | undefined | null;
}

export interface MarkedOptions extends Omit<MarkedExtension, 'hooks' | 'tokenizer' | 'extensions' | 'walkTokens'> {
  /**
   * Hooks are methods that hook into some part of marked.
   */
  hooks?: _Hooks | undefined | null;

  /**
   * The tokenizer defines how to turn markdown text into tokens.
   */
  tokenizer?: _Tokenizer | undefined | null;

  /**
   * Custom extensions
   */
  extensions?: null | {
    childTokens: {
      [name: string]: string[];
    };
    inline?: TokenizerExtensionFunction[];
    block?: TokenizerExtensionFunction[];
    startInline?: TokenizerStartFunction[];
    startBlock?: TokenizerStartFunction[];
  };

  /**
   * walkTokens function returns array of values for Promise.all
   */
  walkTokens?: null | ((token: Token) => void | Promise<void> | (void | Promise<void>)[]);
}
