import { FontAttr } from '.'

export class CodeSpanAttr{

  /**
   * 字体颜色
   */
  fontStyle: FontAttr = {color: Color.Red}

  /**
   * 背景样式
   */
  textBackgroundStyle: TextBackgroundStyle = {}


  /**
   * 代码预览策略
   */
  previewStrategy: (code: string) => string = (code: string) => `「${code}」`



}