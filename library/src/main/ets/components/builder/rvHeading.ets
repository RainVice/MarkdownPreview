import { Token, Tokens, TokensList } from '../../marked/Tokens'
import { rvInLine } from './rvInLine'

@Component
export struct rvHeading {
  tokensList: Tokens.Heading | undefined = undefined

  build() {
    rvInLine({ tokensList: this.tokensList })
  }
}