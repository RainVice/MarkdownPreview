import { LanguageToken, TokenType } from './LanguageToken'

export abstract class LanguageParse {
  protected abstract rules: Partial<Record<TokenType, ParseRule>>
  private code: string;
  private tokens: LanguageToken[][] = []

  constructor(code: string) {
    this.code = code;
  }


  public parseCode(): LanguageToken[][] {
    const lines = this.code.split("\n");
    for (const line of lines) {
      this.tokens.push(this.parseLine(line));
    }
    return this.tokens
  }

  private parseLine(line: string): LanguageToken[] {
    const tokens: LanguageToken[] = [];
    while (line.length > 0) {
      let token: string;
      for (const tokenType of Object.values(TokenType)) {
        if (token = this.matchResults(this.rules[tokenType], line)) {
          tokens.push(new LanguageToken(token, tokenType));
          line = line.substring(token.length)
        }
      }

      if (line.length > 0) {
        tokens.push(new LanguageToken(line[0], TokenType.Default));
        line = line.substring(1)
      }


    }
    return tokens;
  }

  /**
   * 匹配结果
   */
  private matchResults(rule: ParseRule, line: string): string {
    if (!rule) {
      return undefined;
    }
    const regexResult = rule.regex.exec(line)
    if (regexResult) {
      return rule.operation(regexResult)
    }
  }
}


export interface ParseRule {
  regex: RegExp
  operation: (match: RegExpExecArray) => string
}

