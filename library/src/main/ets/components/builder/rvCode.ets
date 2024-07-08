import { Tokens } from '../../marked'
import { MdPreviewOption } from '../../option'
import { CodeAttr } from '../../style'
import { LanguageParse, LanguageToken } from '../../utils'

@Component
export struct rvCode {
  code: Tokens.Code | undefined = undefined
  private attr: CodeAttr = MdPreviewOption.value.codeAttr
  private tokens: LanguageToken[][] = []

  aboutToAppear(): void {
    this.tokens =
      MdPreviewOption.value.codeAttr.getLanguageParse(this.code!.lang!.toUpperCase()).parseCode(this.code!.text)
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


      Row() {
        Column() {
          ForEach(this.tokens, (_token: LanguageToken[], index: number) => {
            Text(index.toString())
              .fontSize(this.attr.codeTextSize)
              .fontColor(this.attr.lineNumberColor)
          })
        }
        .padding({top: 10,bottom: 10,left: 5,right: 5})
        .backgroundColor(this.attr.codeBackgroundColor)
        .alignItems(HorizontalAlign.End)
        .border({
          width: {right: 1},
          color: this.attr.lineNumberColor
        })

        Scroll() {
          Column() {
            ForEach(this.tokens, (token: LanguageToken[]) => {
              Text() {
                ForEach(token, (item: LanguageToken) => {
                  Span(item.value)
                    .fontColor(item.color)
                    .fontSize(this.attr.codeTextSize)
                })
              }
            })
          }
          .alignItems(HorizontalAlign.Start)
        }
        .align(Alignment.Start)
        .layoutWeight(1)
        .padding(10)
        .scrollable(ScrollDirection.Horizontal)
      }
      .backgroundColor(this.attr.codeBackgroundColor)
      .justifyContent(FlexAlign.Start)

    }
    .clip(true)
    .alignItems(HorizontalAlign.Start)
    .borderRadius(this.attr.borderRadius)
    .width("100%")

  }
}