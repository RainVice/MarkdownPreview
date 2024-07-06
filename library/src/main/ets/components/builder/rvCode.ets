import { Tokens } from '../../marked'

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
      .align(Alignment.Start)
      .width("100%")
      .padding(10)
      .scrollable(ScrollDirection.Horizontal)
      .backgroundColor("#1E1F22")

    }
    .clip(true)
    .alignItems(HorizontalAlign.Start)
    .borderRadius(10)
    .width("100%")

  }
}