export const languageParses: Record<string, object> = {}
export function language(language: string) {
  return (target: new () => object) => {
    languageParses[language.toUpperCase()] = new target()
    return
  }
}
