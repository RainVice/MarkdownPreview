export type TokenType = "keyword" | "comment" | "string" | "boolean" | "method" | "number" | "operator" | "block"
  | "identifier" | "default"


export type LanguageRules = {
  [key in TokenType]: ParseRule | undefined
}

/**
 * 文本token
 */
export class LanguageToken {
  public value: string
  public type: TokenType

  constructor(value: string, type: TokenType) {
    this.value = value;
    this.type = type;
  }
}


/**
 * 解析规则
 */
export interface ParseRule {
  regex: RegExp
  operation: (match: RegExpExecArray) => string
}