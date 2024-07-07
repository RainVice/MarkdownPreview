export class LanguageToken {
  public value: string
  public type: TokenType

  constructor(value: string, type: TokenType) {
    this.value = value;
    this.type = type;

  }
}

export type TokenType = "keyword" | "comment" | "string" | "boolean" | "method" | "number" | "operator" | "block"
  | "identifier" | "default"

