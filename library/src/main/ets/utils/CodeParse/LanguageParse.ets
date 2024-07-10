import { defaultParse } from './DefaultParse';
import { CodeToken, LanguageExtension, LanguageRule } from './Languages';

export class LanguageParse {

  /**
   * 默认颜色
   */
  private static defaultColor: ResourceColor = "#DAF2F8"
  private static languageExtension: LanguageExtension = defaultParse

  setDefaultColor(color: ResourceColor) {
    LanguageParse.defaultColor = color
  }

  static registerLanguage(language: string, rule: LanguageRule[]) {
    LanguageParse.languageExtension[language] = rule
  }

  static getCodeTokens(code: string, language: string): CodeToken[][] {
    const tokens: CodeToken[][] = []
    const lines = code.split("\n");
    for (const line of lines) {
      tokens.push(LanguageParse.parseLine(line,
        LanguageParse.languageExtension[language.toUpperCase()] || LanguageParse.languageExtension["DEFAULT"]));
    }
    return tokens
  }

  private static parseLine(line: string, rules: LanguageRule[]): CodeToken[] {
    const tokens: CodeToken[] = [];
    while (line.length > 0) {
      let token: CodeToken | undefined
      let match: boolean = false
      for (let rule of rules) {
        if (token = rule.parsing(line)) {
          tokens.push(token);
          match = true
          line = line.substring(token.value.length)
          break
        }
      }
      if (line.length > 0 && !match) {

        const match = /^\b.*\b/.exec(line)

        tokens.push({ value: match ? match[0] : line[0], color: LanguageParse.defaultColor });
        line = line.substring(match ? match[0].length : 1)
      }
    }
    return tokens
  }

}