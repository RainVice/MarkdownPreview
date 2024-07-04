import { Tokens, TokensList } from '../../marked/Tokens'
import { MdPreviewBuilder } from './MdPreviewBuilder'

@Component
export struct rvBlockquote {

  blockquote: Tokens.Blockquote | undefined = undefined

  build() {
    Column(){
      MdPreviewBuilder({tokensList: this.blockquote?.tokens as TokensList})
    }
    .backgroundColor("#fff3f3f3")
    .width("100%")
    .padding(5)
    .borderWidth({left: 3})
    .borderColor(Color.Green)
  }
}