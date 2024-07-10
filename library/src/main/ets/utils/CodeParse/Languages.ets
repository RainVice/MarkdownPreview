export type LanguageExtension = Record<string, LanguageRule[]>

export interface LanguageRule {
  parsing: (src: string) => CodeToken | undefined
}

export interface CodeToken {
  value: string,
  color: ResourceColor
}


