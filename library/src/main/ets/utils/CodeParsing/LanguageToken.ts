export class LanguageToken {
  public value: string
  public type: TokenType

  constructor(value: string, type: TokenType) {
    this.value = value;
    this.type = type;

  }
}

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