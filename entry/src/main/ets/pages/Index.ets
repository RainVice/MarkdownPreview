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

| **姓名**   | **年龄** |     *工作* |    *工作* |
| :----- | :---: | -------: | -------: |
| 小可爱 |  18  | 吃可爱多 |吃可爱多 |
| 小小勇敢 |  20  | 爬棵勇敢树 |爬棵勇敢树 |
| 小小小机智 |  22  | 看一本机智书 |看一本机智书 |


- qsda
- hsdfgs
- skhfs
- hskdfhks
    - shfsj
    - shfsdkhfj
- sukdgj

1. First item > sdf
    1. asasd
    2. sfds
        1. asda
        2. sdfs
        3. sdfsdf
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