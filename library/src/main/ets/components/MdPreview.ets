import { Lexer, TokensList } from '../marked'
import { MdPreviewOption, PreviewOption } from '../option'
import { JavaParse } from '../utils/CodeParsing/JavaParse'
import { MdPreviewBuilder } from './builder/MdPreviewBuilder'

@Component
export struct MdPreview {
  md: string = ''
  @State private tokensList: TokensList | undefined = undefined
  previewOption: PreviewOption = new PreviewOption()

  aboutToAppear(): void {
    const temp = Lexer.lex(this.md)
    this.tokensList = temp
    MdPreviewOption.value = this.previewOption


    const java = new JavaParse("public static void main(){}")
    console.log("解析成功：",JSON.stringify(java.parseCode()))
  }

  build() {
    if (this.tokensList) {
      Column() {
        MdPreviewBuilder({ tokensList: this.tokensList})
      }
    }
  }
}