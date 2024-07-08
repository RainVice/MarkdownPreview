import { Lexer, TokensList } from '../marked'
import { MdPreviewOption, PreviewOption } from '../option'
import { MdPreviewBuilder } from './builder/MdPreviewBuilder'

@Component
export struct MdPreview {
  md: string = ''
  @State private tokensList: TokensList | undefined = undefined
  previewOption: PreviewOption = new PreviewOption()

  aboutToAppear(): void {
    this.tokensList = Lexer.lex(this.md)
    MdPreviewOption.value = this.previewOption
  }

  build() {
    if (this.tokensList) {
      Column() {
        MdPreviewBuilder({ tokensList: this.tokensList })
      }
    }
  }
}