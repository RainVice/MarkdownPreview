import { LanguageParse } from '.';
import { LanguageRules } from './Rules';

export class DefaultParse extends LanguageParse {
  public language: string = "default";
  protected rules: LanguageRules = {
    keyword: undefined,
    comment: undefined,
    string: {
      regex: /^(["']).*?\1/,
      operation: (value: RegExpExecArray) => value[0],
    },
    boolean: {
      regex: /^\b(?:false|true)\b/,
      operation: (value: RegExpExecArray) => value[0],
    },
    method: undefined,
    number: {
      regex: /^\b0x[\da-f]+\b|^\b0b[01]+\b|^\b0o[0-7]+\b|^(?:\b\d+(?:\.\d*)?[dfl]?|^\B\.\d+)(?:e[+-]?\d+)?/i,
      operation: (value: RegExpExecArray) => value[0],
    },
    operator: {
      regex: /^[<>]=?|^[!=]=?=?|^--?|^\+\+?|^&&?|^\|\|?|^[?*/~^%]/,
      operation: (value: RegExpExecArray) => value[0],
    },
    block: {
      regex: /^[\{\}\[\]\(\)]/,
      operation: (value: RegExpExecArray) => value[0],
    },
    identifier: {
      regex: /^\b.*?\b/,
      operation: (value: RegExpExecArray) => value[0],
    },
    default: {
      regex: /^\b.+?\b|^ +|^\n+|^\W/,
      operation: (value: RegExpExecArray) => value[0],
    }
  };

}