import { MdPreview } from '@rv/markdown-preview';

@Entry
@Component
struct Index {
  @State md: string = `
- [x] GFM task list 1
    skljflkdsjklf
- [x] GFM task list 2
- [ ] GFM task list 3
    - [ ] GFM task list 3-1
    - [ ] GFM task list 3-2
    - [ ] GFM task list 3-3
- [ ] GFM task list 4
    - [ ] GFM task list 4-1
    - [ ] GFM task list 4-2

s/mdf,nsd,
sdkjgfhdsjk
`

  build() {
    Scroll() {
      MdPreview({ md: this.md })
    }
    .padding(10)
    .height('100%')
    .width('100%')
  }
}