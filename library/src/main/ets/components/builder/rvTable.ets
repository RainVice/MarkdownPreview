import { Tokens } from '../../marked/marked'
import { MdPreviewOption } from '../../option'
import { TableAttr } from '../../style'
import { rvInLine } from './rvInLine'

@Component
export struct rvTable {
  table: Tokens.Table | undefined = undefined
  @State w: number = 0
  private attr: TableAttr = MdPreviewOption.value.tableAttr

  build() {
    Scroll() {
      Column() {
        Row() {
          ForEach(this.table?.header, (item: Tokens.TableCell) => {
            Column() {
              rvInLine({ line: item.tokens, fontStyle: this.attr.headerFont })
            }
            .border(this.attr.cellBorder)
            .layoutWeight(1)
            .alignItems(item.align === 'right' ? HorizontalAlign.End :
              item.align === 'center' ? HorizontalAlign.Center : HorizontalAlign.Start)
            .padding(5)
          })
        }
        .backgroundColor(this.attr.headerBackground)

        ForEach(this.table?.rows, (row: Tokens.TableCell[], rowNum: number) => {
          Row() {
            ForEach(row, (item: Tokens.TableCell) => {
              Column() {
                rvInLine({ line: item.tokens, fontStyle: { size: 14 } })
              }
              .border(this.attr.cellBorder)
              .layoutWeight(1)
              .alignItems(item.align === 'right' ? HorizontalAlign.End :
                item.align === 'center' ? HorizontalAlign.Center : HorizontalAlign.Start)
              .padding(5)
            })
          }
          .backgroundColor(rowNum % 2 === 0 ? this.attr.oddBackground : this.attr.evenBackground)
        })
      }
      .width(this.table!.header.length * this.attr.columnWidth < this.w ? "100%" : this.table!.header.length * this.attr.columnWidth)
    }
    .border(this.attr.border)
    .width("100%")
    .onSizeChange((_oldVal: SizeOptions,newVal: SizeOptions) => {
      this.w = newVal.width as number
    })
    .scrollable(ScrollDirection.Horizontal)
  }
}