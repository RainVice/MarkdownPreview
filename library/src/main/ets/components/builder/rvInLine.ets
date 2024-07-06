import { Token, TokensList } from '../../marked/Tokens'
import { updateObj } from '../../utils/FontUtils'
import { isCodespan, isDel, isEm, isImage, isLink, isStrong, isText, isBr, isEscape } from '../../utils/TokenCheck'
import { rvFontStyle } from '../../style/rvFontStyle'
import { promptAction } from '@kit.ArkUI'
import { decodeHtmlEntities } from '../../utils/TextUtils'

@Component
export struct rvInLine {
  line: Token[] | undefined = undefined
  fontStyle: rvFontStyle = {}

  build() {
    Text() {
      this.inLine(this.line, this.fontStyle)
    }
    .font(this.fontStyle)
  }

  @Builder
  inLine(
    tokens: Token[] = [],
    style: rvFontStyle = {},
    decoration: DecorationStyleInterface = { type: TextDecorationType.None },
    textType: TextType = TextType.Normal,
    event: () => void = () => {
    }) {
    ForEach(tokens, (item: Token, index: number) => {
      if (isText(item)) {
        Span(decodeHtmlEntities(item.text)).font(style).decoration(decoration)
          .fontColor(style.color)
          .onClick(textType === TextType.Link ? event : null)
      } else if (isEm(item)) {
        this.inLine(item.tokens, updateObj(style, { style: FontStyle.Italic }))
      } else if (isStrong(item)) {
        this.inLine(item.tokens, updateObj(style, { weight: FontWeight.Bold }))
      } else if (isDel(item)) {
        this.inLine(item.tokens, undefined, { type: TextDecorationType.LineThrough })
      } else if (isCodespan(item)) {
        Span(`「${decodeHtmlEntities(item.text)}」`).font(style).decoration(decoration).fontColor(Color.Red)
          .onClick(textType === TextType.Link ? event : null)
      } else if (isImage(item)) {
        if (textType === TextType.Link) {
          SymbolSpan($r('sys.symbol.share'))
            .fontColor([Color.Gray])
          Span("跳转链接").onClick(event).fontColor(Color.Gray)
        }
        ImageSpan(item.href).width("100%")
      } else if (isLink(item)) {
        this.inLine(item.tokens, updateObj(style, { color: Color.Blue }), { type: TextDecorationType.Underline },
          TextType.Link, () => {
            promptAction.showToast({ message: "点击链接" })
          })
      } else if (isBr(item)) {
        Span('\n')
      } else if (isEscape(item)) {
        Span(decodeHtmlEntities(item.text)).font(style).decoration(decoration)
          .fontColor(style.color)
      }
    })
  }
}

enum TextType {
  Normal,
  Link,
}