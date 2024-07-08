import { LanguageParse } from '.';
import { LanguageRules } from './Rules';

export class JavaParse extends LanguageParse {
  public readonly language: string = "java";
  protected rules: LanguageRules = {
    keyword: {
      regex: /^\b(?:abstract|assert|boolean|break|byte|case|catch|char|class|const|continue|default|do|double|else|enum|exports|extends|final|finally|float|for|goto|if|implements|import|instanceof|int|interface|long|module|native|new|non-sealed|null|open|opens|package|permits|private|protected|provides|public|record(?!\s*[(){}[\]<>=%~.:,;?+\-*/&|^])|requires|return|sealed|short|static|strictfp|super|switch|synchronized|this|throw|throws|to|transient|transitive|try|uses|var|void|volatile|while|with|yield)\b/,
      operation: (value: RegExpExecArray) => value[0],
    },
    comment: {
      regex: /^ *\/\/.*|^\/\*\*?[\s\S]*?\*\//,
      operation: (value: RegExpExecArray) => value[0],
    },
    string: {
      regex: /^(["']).*?\1/,
      operation: (value: RegExpExecArray) => value[0],
    },
    boolean: {
      regex: /^\b(?:false|true)\b/,
      operation: (value: RegExpExecArray) => value[0],
    },
    method: {
      regex: /^\b([\S]+) *\([\s\S]*\) *\{[\s\S]*/,
      operation: (value: RegExpExecArray) => value[1],
    },
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
  }
}