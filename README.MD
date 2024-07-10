# MarkdownPreview

MarkdownPreview是基于ArkUI的一款轻量级Markdown预览工具，支持设置样式，自定义语法解析，自定义代码高亮规则等

## 快熟开始

1. 安装依赖
   `ohpm i @rv/markdown-preview`
2. 引入组件
   ```typescript
   import { MdPreview, PreviewOption } from '@rv/markdown-preview';
   ```
3. 在需要的界面使用
   ```typescript
   MdPreview({ md: markdown文本 })
   ```

## 预览选项

通过 `PreviewOption` 来设置

## 功能实现

即将实现功能：

- 欢迎提出建议

已实现功能：

- **自定义语法解析**
- **自定义代码高亮**
- 增加自定义预览样式选项

已实现预览：

- [标题](https://markdown.com.cn/basic-syntax/headings.html)
- [段落](https://markdown.com.cn/basic-syntax/paragraphs.html)
- [换行](https://markdown.com.cn/basic-syntax/line-breaks.html)
- [强调](https://markdown.com.cn/basic-syntax/emphasis.html)
- [引用](https://markdown.com.cn/basic-syntax/blockquotes.html)
- [列表](https://markdown.com.cn/basic-syntax/lists.html)
- [代码](https://markdown.com.cn/basic-syntax/code.html)
- [分割线](https://markdown.com.cn/basic-syntax/horizontal-rules.html)
- [链接](https://markdown.com.cn/basic-syntax/links.html)
- [图片](https://markdown.com.cn/basic-syntax/images.html)
- [表格](https://markdown.com.cn/extended-syntax/tables.html)
- [围栏代码块](https://markdown.com.cn/extended-syntax/fenced-code-blocks.html)
- [转义字符](https://markdown.com.cn/basic-syntax/escaping-characters.html)
- [删除线](https://markdown.com.cn/extended-syntax/footnotes.html)
- [任务列表](https://markdown.com.cn/extended-syntax/task-lists.html)
- [自动网址链接](https://markdown.com.cn/extended-syntax/automatic-url-linking.html)
- [使用 Emoji 表情](https://markdown.com.cn/extended-syntax/emoji.html)

暂未实现预览：

- [内嵌 HTML 标签](https://markdown.com.cn/basic-syntax/htmls.html)
- [标题编号](https://markdown.com.cn/extended-syntax/heading-ids.html)
- 数学公式
- 其他欢迎补充

无实现预览计划：

- [脚注](https://markdown.com.cn/extended-syntax/footnotes.html)
- [定义列表](https://markdown.com.cn/extended-syntax/definition-lists.html)


