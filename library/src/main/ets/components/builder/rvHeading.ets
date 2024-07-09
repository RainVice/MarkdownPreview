import { Tokens } from '../../marked/marked'
import { MdPreviewOption } from '../../option'
import { rvInLine } from './rvInLine'

@Component
export struct rvHeading {
  heading: Tokens.Heading | undefined = undefined

  build() {
    rvInLine({ line: this.heading?.tokens, fontStyle: MdPreviewOption.value.heading[this.heading!.depth] })
  }
}