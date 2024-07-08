import { Token } from '../../marked'
import { updateObj } from '../../utils'
import { isCodespan, isDel, isEm, isImage, isLink, isStrong, isText, isBr, isEscape } from '../../utils'
import { FontAttr, ImageAttr, LinkAttr } from '../../style'
import { decodeHtmlEntities } from '../../utils'
import { MdPreviewOption } from '../../option'

@Component
export struct rvInLine {
  line: Token[] | undefined = undefined
  fontStyle: FontAttr = {}
  private imageAttr: ImageAttr = MdPreviewOption.value.imageAttr
  private linkAttr: LinkAttr = MdPreviewOption.value.linkAttr

  build() {
    Text() {
      this.inLine(this.line, this.fontStyle)
    }
    .font(this.fontStyle)
  }

  @Builder
  inLine(
    tokens: Token[] = [],
    style: FontAttr = {},
    decoration: DecorationStyleInterface = { type: TextDecorationType.None },
    link: string | undefined = undefined,
    event: (event: ClickEvent, link: string) => void = () => {
    }) {
    ForEach(tokens, (item: Token) => {
      if (isText(item)) {
        Span(decodeHtmlEntities(item.text))
          .font(style)
          .decoration(decoration)
          .fontColor(style.color)
          .onClick(link ? (clickEvent: ClickEvent) => event(clickEvent, link) : null)
        if (link && this.linkAttr.showSymbol) {
          SymbolSpan($r('sys.symbol.share'))
            .fontWeight(FontWeight.Bold)
            .fontColor([this.linkAttr.symbolColor])
            .onClick(link ? (clickEvent: ClickEvent) => event(clickEvent, link) : null)
        }
      } else if (isEm(item)) {
        this.inLine(item.tokens, updateObj(style, { style: FontStyle.Italic }))
      } else if (isStrong(item)) {
        this.inLine(item.tokens, updateObj(style, { weight: FontWeight.Bold }))
      } else if (isDel(item)) {
        this.inLine(item.tokens, style,
          { type: TextDecorationType.LineThrough, color: MdPreviewOption.value.emphasizeAttr.delLineColor })
      } else if (isCodespan(item)) {
        Span(decodeHtmlEntities(MdPreviewOption.value.codeSpanAttr.previewStrategy(item.text)))
          .textBackgroundStyle(MdPreviewOption.value.codeSpanAttr.textBackgroundStyle)
          .font(style)// .decoration(decoration)
          .fontColor(MdPreviewOption.value.codeSpanAttr.fontStyle.color)
          .onClick((clickEvent: ClickEvent) => MdPreviewOption.value.codeSpanAttr.onClick(clickEvent, item.text))
      } else if (isImage(item)) {
        if (link) {
          SymbolSpan($r('sys.symbol.share'))
            .fontSize(this.imageAttr.titleSize)
            .fontColor([this.imageAttr.titleIconColor])
          Span("跳转链接 ")
            .onClick(link ? (clickEvent: ClickEvent) => event(clickEvent, link) : null)
            .fontSize(this.imageAttr.titleSize)
            .fontColor(this.imageAttr.titleIconColor)
        }
        if (item.title || item.text) {
          SymbolSpan($r('sys.symbol.shutter_photo'))
            .fontSize(this.imageAttr.titleSize)
            .fontColor([this.imageAttr.titleIconColor])
          Span(`${item.title + ' ' || ''}(${item.text || ''})`)
            .fontSize(this.imageAttr.titleSize)
            .fontColor(this.imageAttr.titleIconColor)
        }
        ImageSpan(item.href).width("100%")
          .border(this.imageAttr.border)
          .onClick((event: ClickEvent) => this.imageAttr.onClick(event, item.href))
      } else if (isLink(item)) {
        this.inLine(item.tokens, updateObj(style, { color: this.linkAttr.color }), {
          color: this.linkAttr.decorationColor,
          type: this.linkAttr.showDecoration ? TextDecorationType.Underline : TextDecorationType.None
        },
          item.href,
          this.linkAttr.onClick
        )
      } else if (isBr(item)) {
        Span('\n')
      } else if (isEscape(item)) {
        Span(decodeHtmlEntities(item.text))
          .font(style)
          .decoration(decoration)
          .fontColor(style.color)
      }
    })
  }
}

enum TextType {
  Normal,
  Link,
}