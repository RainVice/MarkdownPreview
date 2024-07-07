import { Tokens } from '../../marked'
import { MdPreviewOption } from '../../option'
import { rvInLine } from './rvInLine'

@Component
export struct rvParagraph {
  paragraph: Tokens.Paragraph | undefined = undefined

  build() {
    rvInLine({ line: this.paragraph?.tokens, fontStyle: MdPreviewOption.value.fontAttr })
  }
}