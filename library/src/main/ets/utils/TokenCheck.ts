import { Tokens, Token } from '../marked/Tokens';

export function isHeading(token: Token): token is Tokens.Heading {
  return token.type === 'heading'
}
export function isParagraph(token: Token): token is Tokens.Paragraph {
  return token.type === 'paragraph'
}
export function isHr(token: Token): token is Tokens.Hr {
  return token.type === 'hr'
}
export function isBlockquote(token: Token): token is Tokens.Blockquote {
  return token.type === 'blockquote'
}
export function isText(token: Token): token is Tokens.Text {
  return token.type === 'text'
}
export function isEm(token: Token): token is Tokens.Em {
  return token.type === 'em'
}
export function isStrong(token: Token): token is Tokens.Strong {
  return token.type === 'strong'
}
export function isDel(token: Token): token is Tokens.Del {
  return token.type === 'del'
}
export function isCodespan(token: Token): token is Tokens.Codespan {
  return token.type === 'codespan'
}
export function isCode(token: Token): token is Tokens.Code {
  return token.type === 'code'
}