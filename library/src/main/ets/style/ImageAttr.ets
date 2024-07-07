export  class ImageAttr {

  /**
   * 边框
   */
  border: BorderOptions = {}

  /**
   * 标题颜色
   */
  titleColor: ResourceColor = Color.Gray

  /**
   * 标题图标颜色
   */
  titleIconColor: ResourceColor = Color.Gray

  /**
   * 标题大小
   */
  titleSize: number = 10

  /**
   * 图片点击事件
   */
  onClick: (clickEvent: ClickEvent, url: string) => void = () => {}

}