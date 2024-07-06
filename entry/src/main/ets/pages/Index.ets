import { MdPreview } from '@rv/markdown-preview';

@Entry
@Component
struct Index {
  @State md: string = `
aaa<user.name@example.com>aaa
这是一个链接 [Markdown语法](https://markdown.com.cn)。

http://www.example.com 你觉得不过健康

- [x] GFM task list 1
- [x] GFM task list 2
- [ ] GFM task list 3
    - [ ] GFM task list 3-1
    - [ ] GFM task list 3-2
    - [ ] GFM task list 3-3
- [ ] GFM task list 4
    - [ ] GFM task list 4-1
    - [ ] GFM task list 4-2
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