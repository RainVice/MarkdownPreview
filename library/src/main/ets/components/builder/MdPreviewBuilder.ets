import { Token, Tokens, TokensList } from '../../marked/Tokens'
import { rvHeading } from './rvHeading'

@Component
export struct MdPreviewBuilder {

  tokensList: TokensList | undefined = undefined

  build() {
    Column({space: 10}){
      ForEach(this.tokensList,(item: Token,index: number) => {
        if (item.type === 'heading') {
          rvHeading({tokensList: item as Tokens.Heading})
        }
      })
    }
  }
}