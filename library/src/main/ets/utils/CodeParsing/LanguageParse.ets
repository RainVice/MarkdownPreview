
import { languageParses } from './decorator'
import { LanguageToken, ParseRule, TokenType } from './Rules'


export abstract class LanguageParse {
  protected abstract rules: Partial<LanguageRules>
  /**
   * 默认配色
   */
  public color: Partial<ColorScheme> = {
    keyword: "#E1D984",
    comment: "#808080",
    string: "#A96989",
    boolean: "#E1D984",
    method: "#619061",
    number: "#7FDD44",
    operator: "#C18135",
    block: "#AA7D88",
    identifier: "#DAF2F8",
    default: "#DAF2F8"
  }
  private tokens: LanguageToken[][] = []

  public parseCode(code: string): LanguageToken[][] {
    const lines = code.split("\n");
    for (const line of lines) {
      this.tokens.push(this.parseLine(line));
    }
    return this.tokens
  }

  private parseLine(line: string): LanguageToken[] {
    const tokens: LanguageToken[] = [];
    while (line.length > 0) {
      let token: string | undefined;
      for (const rule of Object.entries(this.rules)) {
        if (token = this.matchResults(rule[1], line)) {
          tokens.push(new LanguageToken(token, rule[0] as TokenType));
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
  private matchResults(rule: ParseRule, line: string): string | undefined {
    if (!rule) {
      return undefined;
    }
    const regexResult = rule.regex.exec(line)
    if (regexResult) {
      return rule.operation(regexResult)
    } else {
      return undefined
    }
  }

  static getLanguageParse(language: string = ''): LanguageParse {
    return (languageParses[language.toUpperCase()] as LanguageParse)
  }
}




/**
 * 配色
 */
export interface ColorScheme extends Record<TokenType, ResourceColor> {


}

