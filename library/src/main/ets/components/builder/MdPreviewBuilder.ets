import { Token, TokensList } from '../../marked/Tokens'
import { isBlockquote, isHeading, isHr, isParagraph, isCode, isImage, isList } from '../../utils/TokenCheck'
import { rvBlockquote } from './rvBlockquote'
import { rvCode } from './rvCode'
import { rvHeading } from './rvHeading'
import { rvHr } from './rvHr'
import { rvList } from './rvList'
import { rvParagraph } from './rvParagraph'

@Component
export struct MdPreviewBuilder {
  tokensList: TokensList | undefined = undefined
  level: number = 0

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
          rvList({list: item,level: this.level})
        }
      })
    }
    .width("100%")
    .alignItems(HorizontalAlign.Start)
  }
}