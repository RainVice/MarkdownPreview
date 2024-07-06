export class ListAttr {
  /**
   * 有序列表序号生成策略
   * @param orderNums 祖先列表序号数组，数组长度代表层级
   * @returns 生成的序号
   */
  orderStrategy?: (orderNums: number[]) => ResourceStr =
    (orderNums: number[]) => orderNums.map(num => num + 1).join(".");
  /**
   * 无序列表序号生成策略
   * @param unOrderNums 祖先列表序号数组,数组长度代表层级
   * @returns 生成的序号
   */
  unOrderStrategy?: (unOrderNums: number[]) => ResourceStr = (unOrderNums: number[]) => "•"

  /**
   * 列表序号与段落之间的间距
   */
  space?: Length = 5

  /**
   * 任务列表的选中颜色
   */
  taskColorSelected?: ResourceColor = Color.Blue
}