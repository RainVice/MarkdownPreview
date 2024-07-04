import { MdPreview } from '@rv/markdown-preview';

@Entry
@Component
struct Index {
  @State md: string = `
# aaaa*1* **2** ***3***
> 666
> # asd
> 666
888

234

  `

  build() {
    Column() {
      MdPreview({ md: this.md })
    }
    .height('100%')
    .width('100%')
  }
}