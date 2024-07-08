import { Tokens } from '../../marked'
import { MdPreviewOption } from '../../option'
import { CodeAttr } from '../../style'
import { LanguageParse, LanguageToken } from '../../utils'

@Component
export struct rvCode {
  code: Tokens.Code | undefined = undefined
  private attr: CodeAttr = MdPreviewOption.value.codeAttr
  private parse: LanguageParse | undefined = undefined

  aboutToAppear(): void {
    this.parse = MdPreviewOption.value.getLanguageParse(this.code!.lang!.toUpperCase())
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


      // todo 代码预览
      Scroll() {
        Row() {
          if (this.code?.lang) {

            ForEach(this.parse?.parseCode(this.code?.text), (tokens: LanguageToken[], index: number) => {
              Column() {
                Text(index.toString())
              }

              Text() {
                ForEach(tokens, (item: LanguageToken) => {
                  Span(item.value)
                    .fontColor(this.parse?.color[item.type])
                })
              }
            })
          }
        }
        .justifyContent(FlexAlign.Start)

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