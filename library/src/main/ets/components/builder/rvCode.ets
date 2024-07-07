import { Tokens } from '../../marked'
import { MdPreviewOption } from '../../option'
import { CodeAttr } from '../../style'

@Component
export struct rvCode {
  code: Tokens.Code | undefined = undefined
  private attr: CodeAttr = MdPreviewOption.value.codeAttr

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
        Text(this.code?.text)
          .fontColor(this.attr.codeTextColor)
          .fontSize(this.attr.codeTextSize)
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