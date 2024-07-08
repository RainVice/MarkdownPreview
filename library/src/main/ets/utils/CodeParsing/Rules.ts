export type TokenType = "keyword" | "comment" | "string" | "boolean" | "method" | "number" | "operator" | "block"
  | "identifier" | "default"


export type LanguageRules = {
  [key in TokenType]: ParseRule | undefined
}




/**
 * 解析规则
 */
export interface ParseRule {
  regex: RegExp
  operation: (match: RegExpExecArray) => string
}