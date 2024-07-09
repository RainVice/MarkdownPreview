import { marked, Tokens, TokensList } from '../marked/marked'
import { MdPreviewOption, PreviewOption } from '../option'
import { MdPreviewBuilder } from './builder/MdPreviewBuilder'

@Component
export struct MdPreview {
  md: string = ''
  @State private tokensList: TokensList | undefined = undefined
  previewOption: PreviewOption = new PreviewOption()


  aboutToAppear(): void {

    this.previewOption.customParser.push({
      builder: this.custom,
      extension: {
        name: 'custom',
        level: 'inline',
        tokenizer: (src: string) => {
          const rule = /\<~custom~(.*?)~custom~\>/;
          const match = rule.exec(src);
          if (match) {
            return {
              type: 'custom',
              raw: match[0],
              text: match[1],
              // tokens: marked.lexer(match[1]) // 如果需要解析子 tokens
            };
          }else{
            return undefined
          }
        }
      },
    })

    MdPreviewOption.value = this.previewOption
    marked.use({
      extensions: MdPreviewOption.value.customParser.map(item => item.extension)
    })
    this.tokensList = marked.lexer(this.md)
  }

  build() {
    if (this.tokensList) {
      Column() {
        MdPreviewBuilder({ tokensList: this.tokensList })
      }
    }
  }

  @Builder
  custom(token: Tokens.Generic){
    Span(token.text).fontColor(Color.Orange)
  }

}