export class LinkAttr {
  /**
   * 超链接字体颜色
   */
  color: ResourceColor = Color.Blue
  /**
   * 是否显示下划线
   */
  showDecoration: boolean = true
  /**
   * 超链接下划线颜色
   */
  decorationColor: ResourceColor = Color.Blue
  /**
   * 是否显示符号
   */
  showSymbol: boolean = true
  /**
   * 后置符号颜色
   */
  symbolColor: ResourceColor = Color.Gray
  /**
   * 超链接点击事件
   */
  onClick: (event: ClickEvent,link: string) => void = () => {
  }
}