import { Token, TokensList } from '../../marked/Tokens'
import { isBlockquote, isHeading, isHr, isParagraph, isCode, isImage, isList, isTable } from '../../utils/TokenCheck'
import { rvBlockquote } from './rvBlockquote'
import { rvCode } from './rvCode'
import { rvHeading } from './rvHeading'
import { rvHr } from './rvHr'
import { rvList } from './rvList'
import { rvParagraph } from './rvParagraph'
import { rvTable } from './rvTable'
import { promptAction } from '@kit.ArkUI'
import { rvFontStyle } from '../../style/rvFontStyle'

@Component
export struct MdPreviewBuilder {
  tokensList: TokensList | undefined = undefined
  // 列表层级
  listLevel: number = 0
  // 列表处于当前层级的第几序列
  listSerial: string = ''

  fontStyle: rvFontStyle = {}

  build() {
    Column({ space: 10 }) {
      ForEach(this.tokensList, (item: Token, index: number) => {
        if (isHeading(item)) {
          rvHeading({ heading: item })
        } else if (isParagraph(item)) {
          rvParagraph({ paragraph: item })
        } else if (isHr(item)) {
          rvHr()
        } else if (isBlockquote(item)) {
          rvBlockquote({ blockquote: item })
        } else if (isCode(item)) {
          rvCode({ code: item })
        } else if (isList(item)) {
          rvList({ list: item, listLevel: this.listLevel, listSerial: this.listSerial })
        } else if(isTable(item)){
          rvTable({table: item})
        }
      })
      if (this.tokensList!['links']) {
        ForEach(Object.keys(this.tokensList!['links']),(item: string,index:number) => {
          Text(){
            Span(`[ ${item} ]: `)
              .fontWeight(FontWeight.Bolder)
            Span(`${this.tokensList!['links'][item].href}`)
              .fontColor("#5C5C5C")
              .decoration({type: TextDecorationType.Underline})
              .onClick(() => {
                promptAction.showToast({message: "超链接"})
              })
            Span(` ${this.tokensList!['links'][item].title}`)
          }
        })
      }
    }
    .width("100%")
    .alignItems(HorizontalAlign.Start)
  }
}