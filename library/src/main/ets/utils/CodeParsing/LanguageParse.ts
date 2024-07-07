import { LanguageToken, TokenType } from './LanguageToken'

export abstract class LanguageParse {
  // 优化
  protected rules: Record<TokenType, ParseRule | undefined> = {
    keyword: undefined,
    string: undefined,
    number: undefined,
    boolean: undefined,
    comment: undefined,
    method: undefined,
    operator: undefined,
    block: undefined,
    identifier: undefined,
    default: undefined
  }
  private code: string;
  private tokens: LanguageToken[][]

  constructor(code: string) {
    this.code = code;
    this.parseCode();
  }

  private parseCode() {
    const lines = this.code.split("\n");
    for (const line of lines) {
      this.tokens.push(this.parseLine(line));
    }
  }

  private parseLine(line: string): LanguageToken[] {
    const tokens: LanguageToken[] = [];
    while (line.length > 0) {
      let token: string | null | undefined;
      if (this.rules.keyword && (token = this.rules.keyword.operation(this.rules.keyword.regex.exec(line)))) {
        tokens.push(new LanguageToken(token, 'keyword'));
        line.substring(token.length)
      } else {
        line.substring(line.length)
      }
    }
    return tokens;
  }
}


export interface ParseRule {
  regex: RegExp
  operation: (match: RegExpExecArray | undefined) => string | undefined
}

