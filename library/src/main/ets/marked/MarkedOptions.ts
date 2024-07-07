import type { Token, Tokens, TokensList } from './Tokens';
import type { _Lexer } from './Lexer';
import type { _Tokenizer } from './Tokenizer';

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


export interface MarkedExtension {
  /**
   * Enable GFM line breaks. This option requires the gfm option to be true.
   */
  breaks?: boolean | undefined;

  /**
   * Enable GitHub flavored markdown.
   */
  gfm?: boolean | undefined;

  /**
   * Conform to obscure parts of markdown.pl as much as possible. Don't fix any of the original markdown bugs or poor behavior.
   */
  pedantic?: boolean | undefined;

  /**
   * Shows an HTML error message when rendering fails.
   */
  silent?: boolean | undefined;
}

export interface MarkedOptions extends Omit<MarkedExtension, 'tokenizer' | 'extensions'> {


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

}
