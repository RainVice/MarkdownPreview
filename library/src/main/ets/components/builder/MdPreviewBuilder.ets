import { Token, TokensList } from '../../marked/Tokens'
import { isBlockquote, isHeading, isHr, isParagraph,isCode } from '../../utils/TokenCheck'
import { rvBlockquote } from './rvBlockquote'
import { rvCode } from './rvCode'
import { rvHeading } from './rvHeading'
import { rvHr } from './rvHr'
import { rvParagraph } from './rvParagraph'

@Component
export struct MdPreviewBuilder {
  tokensList: TokensList | undefined = undefined

  build() {
    Column({ space: 10 }) {
      ForEach(this.tokensList, (item: Token, index: number) => {
        if (isHeading(item)) {
          rvHeading({ heading: item })
        } else if (isParagraph(item)) {
          rvParagraph({ paragraph: item })
        } else if (isHr(item)) {
          rvHr()
        } else if (isBlockquote(item)){
          rvBlockquote({blockquote: item})
        } else if (isCode(item)){
          rvCode({code: item})
        }
      })
    }
    .width("100%")
    .alignItems(HorizontalAlign.Start)
  }
}