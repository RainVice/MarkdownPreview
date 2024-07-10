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
    .width("100%")
    .alignItems(HorizontalAlign.Start)
    .backgroundColor(this.attr.backgroundColor)
    .padding(this.attr.padding)
    .borderWidth({left: this.attr.borderWidth})
    .borderColor(this.attr.borderColor)
  }
}