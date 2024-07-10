import { Tokens, TokensList } from '../../marked/marked'
import { MdPreviewOption } from '../../option'
import { ListAttr } from '../../style'
import { MdPreviewBuilder } from './MdPreviewBuilder'

@Component
export struct rvList {
  list: Tokens.List | undefined = undefined
  // 列表层级
  listLevel: number[] = []
  private attr: ListAttr = MdPreviewOption.value.listAttr

  build() {
    Column({ space: this.attr.lineSpace }) {
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
      Row({ space: this.attr.numberSpace }) {
        Text(this.attr.orderStrategy(this.listLevel.concat(index)))
          .fontColor(this.attr.numberColor)
        MdPreviewBuilder({
          tokensList: item.tokens as TokensList,
          listLevel: this.listLevel.concat(index),
        })
          .layoutWeight(1)
      }
      .alignItems(VerticalAlign.Top)
    })
  }

  @Builder
  unOrderList() {
    ForEach(this.list?.items, (item: Tokens.ListItem, index: number) => {
      if (item.task) {
        Row({ space: 5 }) {
          Checkbox()
            .select(item.checked)
            .shape(CheckBoxShape.ROUNDED_SQUARE)
            .margin(0)
            .selectedColor(this.attr.taskSelectedColor)
          MdPreviewBuilder({
            tokensList: item.tokens as TokensList,
            // listLevel: this.listLevel.push(index) ? this.listLevel : [],
          })
        }
        .hitTestBehavior(HitTestMode.Block)
        .alignItems(VerticalAlign.Top)
      } else {
        Row({ space: 5 }) {
          Text(this.attr.unOrderStrategy(this.listLevel.concat(index)))
            .fontColor(this.attr.numberColor)
          MdPreviewBuilder({
            tokensList: item.tokens as TokensList,
            listLevel: this.listLevel.concat(index),
          })
        }
        .alignItems(VerticalAlign.Top)
      }
    })
  }
}