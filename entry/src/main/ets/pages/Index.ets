import { MdPreview } from '@rv/markdown-preview';

@Entry
@Component
struct Index {
  @State md: string = `
# aaaa*1* **2 3** *bbb**_s_ 3**bbb*
## aaaa*1* **2 3** *bbb**_s_ 3**bbb*
### aaaa*1* **2 3** *bbb**_s_ 3**bbb*
#### aaaa*1* **2 3** *bbb**_s_ 3**bbb*
---

1. First item > sdf
    1. asasd
    2. sfds
    > asdas
    asd
    asd**aaa**
    > asd
2. Second item
3. Third item
4. Fourth item

> 666
> # asd
> 666
> > as
> > sdfsdf
>
> ~~~java
> {
>   "firstName": "John",
>   "lastName": "Smith",
>   "age": 25
> }
> ~~~

888\`asd\`

~~~java
{
  "firstName": "John",
  "lastName": "Smith",
  "age": 25
}
~~~

![这是图片](https://markdown.com.cn/assets/img/philly-magic-garden.9c0b4415.jpg "Magic Gardens")

这是一个链接 [Markdown语法](https://markdown.com.cn "最好的markdown教程")。

[![沙漠中的岩石图片](https://markdown.com.cn/assets/img/philly-magic-garden.9c0b4415.jpg "Shiprock")](https://markdown.com.cn)


123456
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