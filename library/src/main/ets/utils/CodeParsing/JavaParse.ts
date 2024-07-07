import { LanguageParse, ParseRule } from './LanguageParse';
import { TokenType } from './LanguageToken';
import { mediaquery } from '@kit.ArkUI';

export class JavaParse extends LanguageParse {
  protected rules: Partial<Record<TokenType, ParseRule>> = {
    keyword: {
      regex: /^\b(?:abstract|assert|boolean|break|byte|case|catch|char|class|const|continue|default|do|double|else|enum|exports|extends|final|finally|float|for|goto|if|implements|import|instanceof|int|interface|long|module|native|new|non-sealed|null|open|opens|package|permits|private|protected|provides|public|record(?!\s*[(){}[\]<>=%~.:,;?+\-*/&|^])|requires|return|sealed|short|static|strictfp|super|switch|synchronized|this|throw|throws|to|transient|transitive|try|uses|var|void|volatile|while|with|yield)\b/,
      operation: this.keyword,
    },
    comment: {
      regex: /^\/\/.*|^\/\*\*?[\s\S]*?\*\//,
      operation: this.comment,
    },
    string: {
      regex: /^(["']).*?\1/,
      operation: this.string,
    },
    boolean: {
      regex: /^\b(?:false|true)\b/,
      operation: this.boolean,
    },
    method: {
      regex: /^\b([\S]+) *\([\s\S]*\) *\{[\s\S]*\}/,
      operation: this.method,
    },
    number: {
      regex: /^\b0x[\da-f]+\b|^\b0b[01]+\b|^\b0o[0-7]+\b|^(?:\b\d+(?:\.\d*)?[dfl]?|^\B\.\d+)(?:e[+-]?\d+)?/i,
      operation: this.number,
    },
    operator: {
      regex: /^[<>]=?|[!=]=?=?|--?|\+\+?|&&?|\|\|?|[?*/~^%]/,
      operation: this.operator,
    },
    block: {
      regex: /^[\{\}\[\]\(\)]/,
      operation: this.block,
    },
    identifier: {
      regex: /^\b.*?\b/,
      operation: this.identifier,
    }
  }

  // "keyword" | "comment" | "string" | "boolean" | "method" | "number" | "operator" | "block"| "identifier" | "default"


  keyword(value: RegExpExecArray) {
    return value ? value[0] : undefined
  }

  comment(value: RegExpExecArray) {
    return value ? value[0] : undefined
  }

  string(value: RegExpExecArray) {
    return value ? value[0] : undefined
  }

  boolean(value: RegExpExecArray) {
    return value ? value[0] : undefined
  }

  method(value: RegExpExecArray) {
    return value ? value[1] : undefined
  }

  number(value: RegExpExecArray) {
    return value ? value[0] : undefined
  }

  operator(value: RegExpExecArray) {
    return value ? value[0] : undefined
  }

  block(value: RegExpExecArray) {
    return value ? value[0] : undefined
  }
  identifier(value: RegExpExecArray) {
    return value ? value[0] : undefined
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