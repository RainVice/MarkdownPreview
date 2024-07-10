import { MdPreview, PreviewOption } from '@rv/markdown-preview';

@Entry
@Component
struct Index {
  @State md: string = `
# 最大标题 H1
## 次级标题 H2
### 第三级标题 H3
#### 第四级标题 H4
##### 第五级标题 H5
###### 最小标题 H6

普通段落文本开始。*这段文本会显示为斜体*。_这也是斜体_。
**这段文本会显示为粗体**。__这也是粗体__。

---

### 列表
#### 无序列表
- 项目1
- 项目2
  - 子项目2.1
  - 子项目2.2
- 项目3

#### 有序列表
1. 第一项
2. 第二项
   1. 第二项的第一个子项
   2. 第二项的第二个子项
3. 第三项

---

### 链接和图片
[这是一个链接](https://www.example.com)

![这是一张图片](https://via.placeholder.com/150)

---

### 引用
> 这是一段引用文本。
>
> > 这是引用中的引用。

---

### 代码
\`这是一行代码\`

\`\`\`python
# 这是Python代码块
def hello_world():
    print("Hello, World!")
\`\`\`

\`\`\`
这是一个长代码块
可以包含多行代码
\`\`\`

---

### 表格
| 标题1 | 标题2 | 标题3 |
|-------|-------|-------|
| 单元格1 | 单元格2 | 单元格3 |
| 单元格4 | 单元格5 | 单元格6 |

---

### 水平线
---
或者
***

---

### 任务列表
- [x] 已完成项目
- [ ] 未完成项目
- [ ] 进行中项目

---

### 转义字符
\*这不是斜体\*，而是星号。

---

### 表情符号
:smile: :heart: :sparkles:

---

### 脚注
这是一个脚注的例子[^1]

[^1]: 这是脚注的文本。

---


### 警告
> **警告**: 这是一条警告信息。

---



你可以将上述代码复制到任何支持Markdown的编辑器中，以查看格式化后的效果。Markdown是一种轻量级标记语言，非常适合快速编写格式化文本。


`
  option: PreviewOption = new PreviewOption()

  aboutToAppear(): void {
    this.option.codeAttr.registerLanguage("ArkTS", [

      {
        parsing: (src: string) => {
          const regex =
            /^\b(?:this)\b/
          const match = regex.exec(src)
          if (match) {
            return { value: match[0], color: "#E1D984" }
          } else {
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
          } else {
            return undefined
          }
        }
      }, // comment
      {
        parsing: (src: string) => {
          const regex = /^\b([\S]+) *\([\s\S]*\) *\{[\s\S]*/
          const match = regex.exec(src)
          if (match) {
            return { value: match[1], color: "#619061" }
          } else {
            return undefined
          }
        }
      }, // method
      {
        parsing: (src: string) => {
          const regex = /^(["']).*?\1/
          const match = regex.exec(src)
          if (match) {
            return { value: match[0], color: "#A96989" }
          } else {
            return undefined
          }
        }
      }, // string
      {
        parsing(src: string) {
          const regex = /^\b(.*)\b\(.*\)/
          const match = regex.exec(src)
          if (match) {
            return { value: match[1], color: "#ffff9a00" }
          } else {
            return undefined
          }
        }
      }, // attribute
      {
        parsing: (src: string) => {
          const regex = /^\b0x[\da-f]+\b|^\b0b[01]+\b|^\b0o[0-7]+\b|^(?:\b\d+(?:\.\d*)?[dfl]?|^\B\.\d+)(?:e[+-]?\d+)?/i
          const match = regex.exec(src)
          if (match) {
            return { value: match[0], color: "#7FDD44" }
          } else {
            return undefined
          }
        }
      }, // number
      {
        parsing: (src: string) => {
          const regex = /^[\{\}\[\]\(\)]/
          const match = regex.exec(src)
          if (match) {
            return { value: match[0], color: "#9d1731" }
          } else {
            return undefined
          }
        }
      }, // block
      {
        parsing(src: string) {
          const regex = /^(\b[a-zA-Z0-9_]+\b) *:/
          const match = regex.exec(src)
          if (match) {
            return { value: match[1], color: "#ffffc000" }
          } else {
            return undefined
          }
        }
      }// variable

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