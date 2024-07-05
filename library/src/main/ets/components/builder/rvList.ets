import { Tokens, TokensList } from '../../marked/Tokens'
import { MdPreviewBuilder } from './MdPreviewBuilder'

@Component
export struct rvList {
  list: Tokens.List | undefined = undefined
  // 列表层级
  listLevel: number = 0
  // 列表处于当前层级的第几序列
  listSerial: string = ''

  build() {
    Column() {
      if (this.list?.ordered) {
        this.orderList()
      } else {
        this.unOrderList()
      }
    }
  }

  @Builder
  orderList() {
    ForEach(this.list?.items, (item: Tokens.ListItem, index: number) => {
      Row({ space: 5 }) {
        Text(`${this.listSerial}${index + 1}`)
        MdPreviewBuilder({
          tokensList: item.tokens as TokensList,
          listLevel: this.listLevel + 1,
          listSerial: `${this.listSerial}${index + 1}.`
        })
      }
      .alignItems(VerticalAlign.Top)
    })
  }

  @Builder
  unOrderList() {
    ForEach(this.list?.items, (item: Tokens.ListItem, index: number) => {
      Row({ space: 5 }) {
        Text("•")
        MdPreviewBuilder({
          tokensList: item.tokens as TokensList,
          listLevel: this.listLevel + 1,
        })
      }
      .alignItems(VerticalAlign.Top)
    })
  }
}