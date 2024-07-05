import { Tokens, TokensList } from '../../marked/Tokens'
import { MdPreviewBuilder } from './MdPreviewBuilder'

@Component
export struct rvList {
  list: Tokens.List | undefined = undefined
  level: number = 0

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
    ForEach(this.list?.items, (listItem: Tokens.ListItem, index: number) => {
      Row({ space: 10 }) {
        Text(`${index + 1}.`).fontSize(16 - this.level * 2)
        MdPreviewBuilder({ tokensList: listItem.tokens as TokensList, level: this.level + 1 })
      }
      .alignItems(VerticalAlign.Top)
    })
  }

  @Builder
  unOrderList() {
    ForEach(this.list?.items, (item: Tokens.ListItem, index: number) => {

    })
  }
}