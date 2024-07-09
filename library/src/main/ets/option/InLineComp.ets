import { Tokens } from '../marked/Tokens'

@Builder
export function textSpan(token: Tokens.Generic){
  Span(token.text)
}