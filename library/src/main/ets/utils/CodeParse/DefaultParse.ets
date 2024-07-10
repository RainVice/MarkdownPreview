import { LanguageExtension } from './Languages';

export function defaultParse(): LanguageExtension {
  return {
    "JAVA": [
      {
        parsing: (src: string) => {
          const regex =
            /^\b(?:abstract|assert|boolean|break|byte|case|catch|char|class|const|continue|default|do|double|else|enum|exports|extends|final|finally|float|for|goto|if|implements|import|instanceof|int|interface|long|module|native|new|non-sealed|null|open|opens|package|permits|private|protected|provides|public|record(?!\s*[(){}[\]<>=%~.:,;?+\-*/&|^])|requires|return|sealed|short|static|strictfp|super|switch|synchronized|this|throw|throws|to|transient|transitive|try|uses|var|void|volatile|while|with|yield)\b/
          const match = regex.exec(src)
          if (match) {
            return { value: match[0], color: "#E1D984" }
          }
          else {
            return undefined
          }
        }
      }, // keyword
      {
        parsing: (src: string) => {
          const regex = /^ *\/\/.*|^\/\*\*?[\s\S]*?\*\//
          const match = regex.exec(src)
          if (match) {
            return { value: match[0], color: "#808080" }
          }
          else {
            return undefined
          }
        }
      }, // comment
      {
        parsing: (src: string) => {
          const regex = /^(["']).*?\1/
          const match = regex.exec(src)
          if (match) {
            return { value: match[0], color: "#A96989" }
          }
          else {
            return undefined
          }
        }
      }, // string
      {
        parsing: (src: string) => {
          const regex = /^\b(?:false|true)\b/
          const match = regex.exec(src)
          if (match) {
            return { value: match[0], color: "#E1D984" }
          }
          else {
            return undefined
          }
        }
      }, // boolean
      {
        parsing: (src: string) => {
          const regex = /^\b([\S]+) *\([\s\S]*\) *\{[\s\S]*/
          const match = regex.exec(src)
          if (match) {
            return { value: match[1], color: "#619061" }
          }
          else {
            return undefined
          }
        }
      }, // method
      {
        parsing: (src: string) => {
          const regex = /^\b0x[\da-f]+\b|^\b0b[01]+\b|^\b0o[0-7]+\b|^(?:\b\d+(?:\.\d*)?[dfl]?|^\B\.\d+)(?:e[+-]?\d+)?/i
          const match = regex.exec(src)
          if (match) {
            return { value: match[0], color: "#7FDD44" }
          }
          else {
            return undefined
          }
        }
      }, // number
      {
        parsing: (src: string) => {
          const regex = /^[<>]=?|^[!=]=?=?|^--?|^\+\+?|^&&?|^\|\|?|^[?*/~^%]/
          const match = regex.exec(src)
          if (match) {
            return { value: match[0], color: "#C18135" }
          }
          else {
            return undefined
          }
        }
      }, // operator
      {
        parsing: (src: string) => {
          const regex = /^[\{\}\[\]\(\)]/
          const match = regex.exec(src)
          if (match) {
            return { value: match[0], color: "#9d1731" }
          }
          else {
            return undefined
          }
        }
      }, // block
      {
        parsing: (src: string) => {
          const regex = /^\b.*\b/
          const match = regex.exec(src)
          if (match) {
            return { value: match[0], color: "#DAF2F8" }
          }
          else {
            return undefined
          }
        }
      },// identifier
    ],
    "DEFAULT": [
      {
        parsing(src: string) {
          const regex =
            /^\b(?:abstract|assert|boolean|break|byte|case|catch|char|class|const|continue|default|do|double|else|enum|extends|final|finally|float|for|if|implements|import|instanceof|int|interface|long|new|null|package|private|protected|public|return|short|static|super|switch|synchronized|this|throw|throws|transient|try|void|volatile|while)\b/
          const match = regex.exec(src)
          if (match) {
            return { value: match[0], color: "#E1D984" }
          }
          else {
            return undefined
          }
        }
      }, // keyword
      {
        parsing(src: string) {
          const regex = /^[<>]=?|^[!=]=?=?|^--?|^\+\+?|^&&?|^\|\|?|^[?*/~^%]/
          const match = regex.exec(src)
          if (match) {
            return { value: match[0], color: "#C18135" }
          }
          else {
            return undefined
          }
        },
      }, // operator
      {
        parsing(src: string) {
          const regex = /^\b0x[\da-f]+\b|^\b0b[01]+\b|^\b0o[0-7]+\b|^(?:\b\d+(?:\.\d*)?[dfl]?|^\B\.\d+)(?:e[+-]?\d+)?/i
          const match = regex.exec(src)
          if (match) {
            return { value: match[0], color: "#7FDD44" }
          }
          else {
            return undefined
          }
        }
      }, // number
      {
        parsing(src: string) {
          const regex = /^[<>]=?|^[!=]=?=?|^--?|^\+\+?|^&&?|^\|\|?|^[?*/~^%]/
          const match = regex.exec(src)
          if (match) {
            return { value: match[0], color: "#9d1731" }
          }
          else {
            return undefined
          }
        }
      }, // block
      {
        parsing(src: string) {
          const regex = /^\b.*\b/
          const match = regex.exec(src)
          if (match) {
            return { value: match[0], color: "#DAF2F8" }
          }
          else {
            return undefined
          }
        }
      },// identifier
    ]
  }
}

