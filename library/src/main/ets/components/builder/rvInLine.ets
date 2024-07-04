import { Token, TokensList } from '../../marked/Tokens'
import { isCodespan, isDel, isEm, isStrong, isText } from '../../utils/TokenCheck'

@Component
export struct rvInLine {
  line: Token[] | undefined = undefined
  fontStyle: Font = {}

  build() {
    Text() {
      this.inLine(this.line, this.fontStyle)
    }
    .font(this.fontStyle)
  }

  @Builder
  inLine(
    tokens: Token[] = [],
    style: Font = {},
    decoration: DecorationStyleInterface = { type: TextDecorationType.None }) {
    ForEach(tokens, (item: Token, index: number) => {
      if (isText(item)) {
        Span(item.text).font(style).decoration(decoration)
      } else if (isEm(item)) {
        this.inLine(item.tokens, this.updateFont(style, { style: FontStyle.Italic }))
      } else if (isStrong(item)) {
        this.inLine(item.tokens, this.updateFont(style, { weight: FontWeight.Bold }))
      } else if (isDel(item)) {
        this.inLine(item.tokens, undefined, { type: TextDecorationType.LineThrough })
      } else if (isCodespan(item)) {
        Span(`「${item.text}」`).font(style).decoration(decoration).fontColor(Color.Red)
      }
    })
  }

  updateFont(old: Font, newVal: Font) {
    for (let key of Object.keys(newVal)) {
      if (newVal[key]) {
        old[key] = newVal[key]
      }
    }
    return old
  }
}