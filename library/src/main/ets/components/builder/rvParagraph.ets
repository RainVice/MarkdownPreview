import { Tokens } from '../../marked/Tokens'
import { rvInLine } from './rvInLine'

@Component
export struct rvParagraph {
  paragraph: Tokens.Paragraph | undefined = undefined
  build() {
    rvInLine({line: this.paragraph?.tokens})
  }
}