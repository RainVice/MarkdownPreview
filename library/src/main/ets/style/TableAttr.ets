import { FontAttr } from '.'

export class TableAttr {

  /**
   * 表头字体属性
   */
  headerFont: FontAttr = {
    weight: FontWeight.Medium,
  }

  /**
   * 表头背景
   */
  headerBackground: ResourceColor = "#F0F0F0"

  /**
   * 表格单数行背景
   */
  oddBackground: ResourceColor = Color.White

  /**
   * 双数行背景
   */
  evenBackground: ResourceColor = "#F8F8F8"

  /**
   * 表格边框
   */
  border: BorderOptions = {}

  /**
   * 单元格边框
   */
  cellBorder: BorderOptions = {}

  /**
   * 列宽,单位 vp
   */
  columnWidth: number = 100


}