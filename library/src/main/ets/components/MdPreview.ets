import { Lexer, Tokenizer, TokensList } from '../marked/marked'
import { MdPreviewBuilder } from './builder/MdPreviewBuilder'

@Component
export struct MdPreview {
  @Require @Prop md: string
  @State private tokensList: TokensList | undefined = undefined

  aboutToAppear(): void {
    // const tokenizer = new Tokenizer()
    const lexer = new Lexer()
    const temp = lexer.lex(this.md)
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