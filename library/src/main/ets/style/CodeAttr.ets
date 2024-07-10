import { LanguageParse, LanguageRule } from '../utils'

export class CodeAttr {
  /**
   * 标题背景颜色
   */
  titleBackgroundColor: ResourceColor = Color.Black
  /**
   * 标题文字颜色
   */
  titleTextColor: ResourceColor = Color.White
  /**
   * 标题文字大小
   */
  titleTextSize: number = 12
  /**
   * 圆角大小
   */
  borderRadius: number = 10
  /**
   * 代码区域背景颜色
   */
  codeBackgroundColor: ResourceColor = "#1E1F22"
  /**
   * 代码文字大小
   */
  codeTextSize: number = 14
  /**
   * 行号颜色
   */
  lineNumberColor: ResourceColor = "#9A9EA3"

  /**
   * 注册语言解析规则
   * @param language 语言类型
   * @param rule 解析规则
   */
  registerLanguage(language: string, rule: LanguageRule[]) {
    LanguageParse.registerLanguage(language, rule)
  }
}