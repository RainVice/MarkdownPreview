import { MdPreview, PreviewOption } from '@rv/markdown-preview';

@Entry
@Component
struct Index {
  @State md: string = `
\`\`\`ArkTS
// 注释
build() {
  Scroll() {
    MdPreview({ md: this.md, previewOption: this.option })
  }
  .padding(10)
  .height('100%')
  .width('100%')
}
\`\`\`
  `
  // todo 演示代码高亮自定义
  option: PreviewOption = new PreviewOption()
  aboutToAppear(): void {
    this.option.codeAttr.registerLanguage("ArkTS",[
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
        parsing(src: string) {
          const regex = /\b(.*)\b\(.*\)([\s])*?\./
          const match = regex.exec(src)
          if (match) {
            return { value: match[1], color: "#A96989" }
          }
          else {
            return undefined
          }
        }
      }

    ])
  }

  build() {
    Scroll() {
      MdPreview({ md: this.md, previewOption: this.option })
    }
    .padding(10)
    .height('100%')
    .width('100%')
  }
}