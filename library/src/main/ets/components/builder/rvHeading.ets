import { Token, Tokens, TokensList } from '../../marked/Tokens'
import { rvFontStyle } from '../../style/rvFontStyle'
import { rvInLine } from './rvInLine'

@Component
export struct rvHeading {
  heading: Tokens.Heading | undefined = undefined
  private headerStyle: Record<number, rvFontStyle> = {
    1: { size: 22, weight: FontWeight.Bold },
    2: { size: 21, weight: FontWeight.Bold },
    3: { size: 20, weight: FontWeight.Bold },
    4: { size: 19, weight: FontWeight.Bold },
    5: { size: 18, weight: FontWeight.Bold },
    6: { size: 17, weight: FontWeight.Bold },
  }

  build() {
    rvInLine({ line: this.heading?.tokens, fontStyle: this.headerStyle[this.heading!.depth] })
  }
}