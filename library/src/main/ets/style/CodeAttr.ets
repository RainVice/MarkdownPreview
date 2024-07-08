import { DefaultParse, JavaParse, LanguageParse } from '../utils'

export class CodeAttr{

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
   * 行号文字大小
   */
  lineNumberTextSize: number = 14

  /**
   * 行号背景
   */
  lineNumberBackgroundColor: ResourceColor = "#1E1F22"

  // 代码高亮规则
  private languageParses: Record<string, LanguageParse> = {
    "JAVA": new JavaParse(),
    "DEFAULT": new DefaultParse()
  }

  // 设置代码高亮
  setLanguageParse(languageParse: LanguageParse) {
    this.languageParses[languageParse.language.toUpperCase()] = languageParse
  }

  // 获取代码高亮规则
  getLanguageParse(language: string | undefined): LanguageParse {
    return this.languageParses[language ? language.toUpperCase() : "DEFAULT"] || this.languageParses["DEFAULT"];
  }


}