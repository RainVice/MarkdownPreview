import { LanguageParse, ParseRule } from './LanguageParse';
import { TokenType } from './LanguageToken';

export class JavaParse extends LanguageParse {
  protected rules: Record<TokenType, ParseRule | undefined> = {
    string: {
      regex: /^(["']).*?\1/,
      operation: (value: RegExpExecArray) => value[0]
    },
    number: undefined,
    boolean: undefined,
    keyword: undefined,
    comment: undefined,
    method: undefined,
    operator: undefined,
    block: undefined,
    identifier: undefined,
    default: undefined
  }
  // private patterns: {
  //   regex: RegExp,
  //   type: TokenType
  // }[] = [
  //   {
  //     regex: /^\b(?:abstract|assert|boolean|break|byte|case|catch|char|class|const|continue|default|do|double|else|enum|exports|extends|final|finally|float|for|goto|if|implements|import|instanceof|int|interface|long|module|native|new|non-sealed|null|open|opens|package|permits|private|protected|provides|public|record(?!\s*[(){}[\]<>=%~.:,;?+\-*/&|^])|requires|return|sealed|short|static|strictfp|super|switch|synchronized|this|throw|throws|to|transient|transitive|try|uses|var|void|volatile|while|with|yield)\b/,
  //     type: "keyword"
  //   },
  //   {
  //     regex: /^\/\/.*|^\/\*\*?[\s\S]*?\*\//,
  //     type: "comment"
  //   },
  //   {
  //     regex: /^(["']).*?\1/,
  //     type: "string"
  //   },
  //   {
  //     regex: /^\b(?:false|true)\b/,
  //     type: "boolean"
  //   },
  //   {
  //     regex: /^\b([\S]+) *\([\s\S]*\) *\{[\s\S]*\}/,
  //     type: "method"
  //   },
  //   {
  //     regex: /^\b0x[\da-f]+\b|^\b0b[01]+\b|^\b0o[0-7]+\b|^(?:\b\d+(?:\.\d*)?[dfl]?|^\B\.\d+)(?:e[+-]?\d+)?/i,
  //     type: "number"
  //   },
  //   {
  //     regex: /^[<>]=?|[!=]=?=?|--?|\+\+?|&&?|\|\|?|[?*/~^%]/,
  //     type: "operator"
  //   },
  //   {
  //     regex: /^[\{\}\[\]\(\)]/,
  //     type: "block"
  //   },
  //   {
  //     regex: /^\b.*?\b/,
  //     type: "identifier"
  //   }
  //
  // ];


}