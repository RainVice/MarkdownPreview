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
> 666
> # asd
> 666
>
> ~~~java
> {
>   "firstName": "John",
>   "lastName": "Smith",
>   "age": 25
> }
> ~~~
>
888\`asd\`

~~~java
{
  "firstName": "John",
  "lastName": "Smith",
  "age": 25
}
~~~
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