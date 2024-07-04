import { Tokens } from '../../marked/Tokens'

@Component
export struct rvCode {
  code: Tokens.Code | undefined = undefined

  build() {
    Column() {
      Row() {
        Text(this.code?.lang)
          .fontSize(12)
          .fontColor(Color.White)
        Blank()
        Text("复制")
          .fontSize(12)
          .fontColor(Color.White)
      }
      .backgroundColor(Color.Black)
      .padding(10)
      .width("100%")

      Scroll() {
        Text(this.code?.text)
          .fontColor(Color.White)
          .fontSize(14)
      }
      .padding(10)
      .scrollable(ScrollDirection.Horizontal)

    }
    .clip(true)
    .alignItems(HorizontalAlign.Start)
    .borderRadius(10)
    .width("100%")
    .backgroundColor("#1E1F22")

  }
}