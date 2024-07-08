export type LanguageRules = Partial<Record<TokenType,ParseRule>>


export enum TokenType {
  Keyword = "keyword",
  Comment = "comment",
  String = "string",
  Boolean = "boolean",
  Method = "method",
  Number = "number",
  Operator = "operator",
  Block = "block",
  Identifier = "identifier",
  Default = "default"
}

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