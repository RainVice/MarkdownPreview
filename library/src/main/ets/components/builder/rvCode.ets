import { Tokens } from '../../marked/marked'
import { MdPreviewOption } from '../../option'
import { CodeAttr } from '../../style'
import { CodeToken, copyText, LanguageParse } from '../../utils'

@Component
export struct rvCode {
  code: Tokens.Code | undefined = undefined
  private attr: CodeAttr = MdPreviewOption.value.codeAttr
  private tokens: CodeToken[][] = []

  aboutToAppear(): void {
    this.tokens = LanguageParse.getCodeTokens(this.code?.text || "", this.code?.lang || "")
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
          .onClick(() => {
            copyText(this.code!.text)
          })
      }
      .backgroundColor(this.attr.titleBackgroundColor)
      .padding(10)
      .width("100%")


      Row() {
        Column() {
          ForEach(this.tokens, (_token: CodeToken[], index: number) => {
            Text(index.toString())
              .fontSize(this.attr.codeTextSize)
              .fontColor(this.attr.lineNumberColor)
          })
        }
        .padding({
          top: 10,
          bottom: 10,
          left: 5,
          right: 5
        })
        .backgroundColor(this.attr.codeBackgroundColor)
        .alignItems(HorizontalAlign.End)
        .border({
          width: { right: 1 },
          color: this.attr.lineNumberColor
        })

        Scroll() {
          Column() {
            ForEach(this.tokens, (token: CodeToken[]) => {
              Text() {
                ForEach(token, (item: CodeToken) => {
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