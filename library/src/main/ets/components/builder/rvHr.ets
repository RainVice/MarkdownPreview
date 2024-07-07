import { MdPreviewOption } from '../../option'
import { DividerAttr } from '../../style'

@Component
export struct rvHr {
  attr: DividerAttr = MdPreviewOption.value.dividerAttr
  build() {
    Divider()
      .color(this.attr.color)
      .strokeWidth(this.attr.width)
      .lineCap(this.attr.lineCap)
  }
}