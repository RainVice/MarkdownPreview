import { Token, Tokens, TokensList } from '../../marked/marked'
import { isBlockquote, isHeading, isHr, isParagraph, isCode, isList, isTable } from '../../utils'
import { rvBlockquote } from './rvBlockquote'
import { rvCode } from './rvCode'
import { rvHeading } from './rvHeading'
import { rvHr } from './rvHr'
import { rvList } from './rvList'
import { rvParagraph } from './rvParagraph'
import { rvTable } from './rvTable'
import { promptAction } from '@kit.ArkUI'
import { MdPreviewOption } from '../../option'
import { EmptyBuild } from '../EmptyBuild'

@Component
export struct MdPreviewBuilder {
  // token集合
  tokensList: TokensList | undefined = undefined
  // 列表层级
  listLevel: number[] = []
  // 自定义token
  @BuilderParam private customBuilder: ((token: Tokens.Generic) => void) = EmptyBuild

  build() {
    Column({ space: 10 }) {
      ForEach(this.tokensList, (item: Token) => {
        if (isHeading(item)) {
          rvHeading({ heading: item })
        }
        else if (isParagraph(item)) {
          rvParagraph({ paragraph: item })
        }
        else if (isHr(item)) {
          rvHr()
        }
        else if (isBlockquote(item)) {
          rvBlockquote({ blockquote: item })
        }
        else if (isCode(item)) {
          rvCode({ code: item })
        }
        else if (isList(item)) {
          rvList({ list: item, listLevel: this.listLevel })
        }
        else if (isTable(item)) {
          rvTable({ table: item })
        }
        else {
          if (this.customBuilder =
            MdPreviewOption.value.customParser.find(mdParse => mdParse.extension.name === item.type)?.builder ||
              EmptyBuild) {
            this.customBuilder(item)
          }
        }
      })
      if (this.tokensList!['links'] && Object.keys(this.tokensList!['links']).length > 0 ) {
        Text("参考资料").fontWeight(FontWeight.Medium).fontSize(20)
        ForEach(Object.keys(this.tokensList!['links']), (item: string) => {
          Text() {
            Span(`[ ${item} ]: `).fontColor(Color.Gray)
            Span(`${this.tokensList!['links'][item].href}`)
              .fontColor("#5C5C5C")
              .decoration({ type: TextDecorationType.Underline })
              .onClick(() => {
                promptAction.showToast({ message: "超链接" })
              })
            Span(` ${this.tokensList!['links'][item].title || ""}`)
          }
        })
      }
    }
    .width("100%")
    .alignItems(HorizontalAlign.Start)
  }
}