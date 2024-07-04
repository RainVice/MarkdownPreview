import { Lexer, Tokenizer, TokensList } from '../marked/marked'
import { MdPreviewBuilder } from './builder/MdPreviewBuilder'

@Component
export struct MdPreview {
  @Require @Prop md: string
  @State private tokensList: TokensList | undefined = undefined

  aboutToAppear(): void {
    const tokenizer = new Tokenizer()
    const lexer = new Lexer({ tokenizer })
    const a = lexer.lex(this.md)
    this.tokensList = lexer.lex(this.md)
  }

  build() {
    if (this.tokensList) {
      Column() {
        MdPreviewBuilder({ tokensList: this.tokensList })
      }
    }
  }
}