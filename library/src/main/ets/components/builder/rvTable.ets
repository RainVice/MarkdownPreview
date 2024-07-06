import { Tokens } from '../../marked/Tokens'
import { rvInLine } from './rvInLine'

@Component
export struct rvTable {
  table: Tokens.Table | undefined = undefined
  @State w: number = 0

  build() {
    Scroll() {
      Column() {
        Row({space: 5}) {
          ForEach(this.table?.header, (item: Tokens.TableCell, index: number) => {
            Column() {
              rvInLine({ line: item.tokens, fontStyle: { weight: FontWeight.Medium } })
            }
            .layoutWeight(1)
            .alignItems(item.align === 'right' ? HorizontalAlign.End :
              item.align === 'center' ? HorizontalAlign.Center : HorizontalAlign.Start)
            .padding(5)
          })
        }
        .backgroundColor("#F0F0F0")

        ForEach(this.table?.rows, (row: Tokens.TableCell[], rowNum: number) => {
          Row({space: 5}) {
            ForEach(row, (item: Tokens.TableCell) => {
              Column() {
                rvInLine({ line: item.tokens, fontStyle: { size: 14 } })
              }
              .layoutWeight(1)
              .alignItems(item.align === 'right' ? HorizontalAlign.End :
                item.align === 'center' ? HorizontalAlign.Center : HorizontalAlign.Start)
              .padding(5)
            })
          }
          .backgroundColor(rowNum % 2 === 0 ? Color.White : "#F8F8F8")
        })
      }
      .width(this.table!.header.length * 100 < this.w ? "100%" : this.table!.header.length * 100)
    }
    .width("100%")
    .onSizeChange((_oldVal: SizeOptions,newVal: SizeOptions) => {
      this.w = newVal.width as number
    })
    .scrollable(ScrollDirection.Horizontal)
  }
}