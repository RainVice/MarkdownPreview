import { marked, Tokens, TokensList } from '../marked/marked'
import { MdPreviewOption, PreviewOption } from '../option'
import { MdPreviewBuilder } from './builder/MdPreviewBuilder'

@Component
export struct MdPreview {
  md: string = ''
  previewOption: PreviewOption = new PreviewOption()
  @State private tokensList: TokensList | undefined = undefined

  aboutToAppear(): void {
    MdPreviewOption.value = this.previewOption
    marked.use({
      extensions: MdPreviewOption.value.customParser.map(item => item.extension)
    })
    this.tokensList = marked.lexer(this.md)
    return
  }

  build() {
    if (this.tokensList) {
      Column() {
        MdPreviewBuilder({ tokensList: this.tokensList })
      }
    }
  }
}