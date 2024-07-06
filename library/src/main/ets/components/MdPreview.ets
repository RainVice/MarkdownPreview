import { Lexer, TokensList } from '../marked'
import { PreviewOption } from '../option'
import { MdPreviewBuilder } from './builder/MdPreviewBuilder'

@Component
export struct MdPreview {
  md: string = ''
  @State private tokensList: TokensList | undefined = undefined

  aboutToAppear(): void {
    const mdPreviewOption: PreviewOption = new PreviewOption()
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