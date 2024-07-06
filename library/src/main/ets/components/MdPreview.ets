import { Lexer, Tokenizer, TokensList } from '../marked/marked'
import { MdPreviewBuilder } from './builder/MdPreviewBuilder'

@Component
export struct MdPreview {
  md: string = ''
  @State private tokensList: TokensList | undefined = undefined

  aboutToAppear(): void {
    const temp = Lexer.lex(this.md)
    this.tokensList = temp
  }

  build() {
    if (this.tokensList) {
      Column() {
        MdPreviewBuilder({ tokensList: this.tokensList })
      }
    }
  }
}