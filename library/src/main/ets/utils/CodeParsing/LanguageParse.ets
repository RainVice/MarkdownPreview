import { LanguageRules, ParseRule, TokenType } from './Rules'

export abstract class LanguageParse {
  public abstract readonly language: string
  protected abstract rules: LanguageRules
  /**
   * 默认配色
   */
  protected color: Record<TokenType, ResourceColor> = {
    "keyword": "#E1D984", // 关键字，如if、for、class等
    "comment": "#808080", // 注释
    "string": "#A96989", // 字符串
    "boolean": "#E1D984", // 布尔值
    "method": "#619061", // 方法或函数名
    "number": "#7FDD44", // 数字
    "operator": "#C18135", // 运算符
    "block": "#ff9d1731", // 块或括号
    "identifier": "#DAF2F8", // 标识符，如变量名
    "default": "#DAF2F8"       // 默认文本颜色
  }

  public parseCode(code: string): LanguageToken[][] {
    const tokens: LanguageToken[][] = []
    const lines = code.split("\n");
    for (const line of lines) {
      tokens.push(this.parseLine(line));
    }
    return tokens
  }

  private parseLine(line: string): LanguageToken[] {
    const tokens: LanguageToken[] = [];
    while (line.length > 0) {
      let token: string | undefined;
      let matchOK: boolean = false;
      for (const rule of Object.entries(this.rules)) {
        if (token = this.matchResults(rule[1], line)) {
          tokens.push(new LanguageToken(token, this.color[rule[0]]));
          line = line.substring(token.length)
          matchOK = true
          break
        }
      }
      if (line.length > 0 && !matchOK) {
        tokens.push(new LanguageToken(line[0], this.color["default"]));
        line = line.substring(1)
      }
    }
    return tokens;
  }

  /**
   * 匹配结果
   */
  private matchResults(rule: ParseRule | undefined, line: string): string | undefined {
    if (!rule) {
      return undefined;
    }
    const regexResult = rule.regex.exec(line)
    if (regexResult) {
      return rule.operation(regexResult)
    }
    else {
      return undefined
    }
  }
}

/**
 * 文本token
 */
export class LanguageToken {
  public value: string
  public color: ResourceColor

  constructor(value: string, color: ResourceColor) {
    this.value = value;
    this.color = color;
  }
}


