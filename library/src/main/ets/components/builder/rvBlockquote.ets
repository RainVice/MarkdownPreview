import { Tokens, TokensList } from '../../marked/marked'
import { MdPreviewOption } from '../../option/PreviewOption'
import { BlockquoteAttr } from '../../style'
import { MdPreviewBuilder } from './MdPreviewBuilder'

@Component
export struct rvBlockquote {

  blockquote: Tokens.Blockquote | undefined = undefined
  private attr: BlockquoteAttr = MdPreviewOption.value.blockquoteAttr

  build() {
    Column(){
      MdPreviewBuilder({tokensList: this.blockquote?.tokens as TokensList})
    }
    .backgroundColor(this.attr.backgroundColor)
    .width("100%")
    .padding(this.attr.padding)
    .borderWidth({left: this.attr.borderWidth})
    .borderColor(this.attr.borderColor)
  }
}