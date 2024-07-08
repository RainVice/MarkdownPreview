import { LanguageParse } from '../../../../../Index'
import { Tokens } from '../../marked'
import { MdPreviewOption } from '../../option'
import { CodeAttr } from '../../style'
import { LanguageToken } from '../../utils'

@Component
export struct rvCode {
  code: Tokens.Code | undefined = undefined
  private attr: CodeAttr = MdPreviewOption.value.codeAttr
  private parse: LanguageParse | undefined = undefined


  aboutToAppear(): void {
    this.parse = LanguageParse.getLanguageParse(this.code?.lang)
  }

  build() {
    Column() {
      Row() {
        Text(this.code?.lang)
          .fontSize(this.attr.titleTextSize)
          .fontColor(this.attr.titleTextColor)
        Blank()
        Text("复制")
          .fontSize(this.attr.titleTextSize)
          .fontColor(this.attr.titleTextColor)
      }
      .backgroundColor(this.attr.titleBackgroundColor)
      .padding(10)
      .width("100%")

      Scroll() {
        if (this.code?.lang){
          ForEach(this.parse?.parseCode(this.code?.text), (tokens: LanguageToken[], index: number) => {
            ForEach(tokens,(item: LanguageToken) => {
              Span(item.value)
                .fontColor(this.parse?.color[item.type])
            })
          })
        }else{
          Text(this.code?.text)
            .fontColor(this.attr.codeTextColor)
            .fontSize(this.attr.codeTextSize)
        }
      }
      .align(Alignment.Start)
      .width("100%")
      .padding(10)
      .scrollable(ScrollDirection.Horizontal)
      .backgroundColor(this.attr.codeBackgroundColor)

    }
    .clip(true)
    .alignItems(HorizontalAlign.Start)
    .borderRadius(this.attr.borderRadius)
    .width("100%")

  }
}