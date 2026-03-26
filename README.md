# USTSthesis

苏州科技大学本科毕业设计（论文）LaTeX 模板

![Version](https://img.shields.io/badge/version-2.0.0-blue.svg)
![License: LPPL 1.3c](https://img.shields.io/badge/license-LPPL%201.3c-green.svg)
![Build: XeLaTeX + Biber](https://img.shields.io/badge/build-XeLaTeX%20%2B%20Biber-orange.svg)

本模板面向苏州科技大学本科毕业设计（论文）写作，当前 `2.0.0` 版本已经完成三文档重构，可同时支持：

- 毕业论文正文
- 单独的外文翻译译文
- 含外文翻译与外文原文附录的毕业论文全文

---

## 版本信息

- 当前版本：`2.0.0`
- 更新日期：`2026-03-26`
- 编译方式：`XeLaTeX + Biber`
- 格式参考：[苏州科技大学 毕业设计（论文）样式](https://bylw.usts.edu.cn/bysj/NewsDetail.aspx?ConfigurationID=8F0lgC4y7Ho%3d&HomePageManagementID=X0H9ludZcp8%3d)

---

## 2.0.0 更新内容

- 入口文件重构：
  - 删除旧的单入口 `main.tex`
  - 新增 [main-thesis.tex](main-thesis.tex)、[main-translation.tex](main-translation.tex)、[main-thesis-with-appendix.tex](main-thesis-with-appendix.tex)
  - 三个入口分别对应“正文”“独立译文”“正文+附录”
- 类文件重构：
  - [USTSthesis.cls](USTSthesis.cls) 从原来的大一统类文件改成“模式分发器”
  - 版式、页眉页脚、目录、图表、参考文献、定理、代码、译文逻辑拆分到 [style/](style/) 下多个 `.sty`
  - 当前模块包括：`USTS-base`、`USTS-page`、`USTS-heading`、`USTS-floats`、`USTS-ref`、`USTS-listing`、`USTS-theorem`、`USTS-bib`、`USTS-translation`
- 章节结构重构：
  - 删除旧的 `chapters/ch1.tex`
  - 将正文入口改为 [chapters/introduction.tex](chapters/introduction.tex)
  - 重写 [chapters/ch2.tex](chapters/ch2.tex) 作为正文模板使用说明
  - 保留并调整 [chapters/ch3.tex](chapters/ch3.tex)、[chapters/ch4.tex](chapters/ch4.tex)、[chapters/ch5.tex](chapters/ch5.tex)
  - 新增 [chapters/ch6.tex](chapters/ch6.tex)
  - 致谢从旧的 `front/acknowledgement.tex` 移到 [chapters/acknowledgement.tex](chapters/acknowledgement.tex)
- 附录结构重构：
  - 删除旧的 `appendix/appendixA.tex`、`appendix/appendixB.tex`、`appendix/appendixC.tex`
  - 新增 [appendix/trans.tex](appendix/trans.tex) 作为外文翻译总入口
  - 新增 [appendix/origin.tex](appendix/origin.tex) 作为外文原文 PDF 配置入口
  - 新增 [appendix/trans-meta-article.tex](appendix/trans-meta-article.tex)、[appendix/trans-meta-book.tex](appendix/trans-meta-book.tex)、[appendix/trans-body.tex](appendix/trans-body.tex)
- 译文逻辑重构：
  - 独立译文模式下：无英文摘要页、无页眉、无目录、全篇阿拉伯页码
  - 附录模式下：译文作为正式附录 A 插入论文，沿用论文页眉与连续页码
  - 译文内部标题采用独立编号：`第1章 / 1.1 / 1.1.1`
  - 译文内部编号不接正文，也不与附录字母编号混用
- 目录与附录行为重构：
  - 译文附录目录中只保留“附录 A 外文翻译”和译文大标题
  - 译文内部子标题不写入目录
  - 原文附录目录中只保留“附录 B 外文原文”
  - 原文 PDF 首页自动叠加附录标题
  - 修复了原文附录多出一页空白标题页的问题

---

## 项目结构

- [USTSthesis.cls](USTSthesis.cls)：模板类文件
- [style/](style/)：样式模块
- [front/](front/)：中英文摘要等前置部分
- [chapters/](chapters/)：论文章节
- [appendix/](appendix/)：外文翻译与原文附录
- [reference.bib](reference.bib)：参考文献数据库

三套主入口：

- [main-thesis.tex](main-thesis.tex)
- [main-translation.tex](main-translation.tex)
- [main-thesis-with-appendix.tex](main-thesis-with-appendix.tex)

---

## 三个文档怎么用

### 1. 毕业论文正文

使用 [main-thesis.tex](main-thesis.tex)。

适用场景：

- 只生成毕业论文正文
- 不包含外文翻译附录
- 不包含外文原文 PDF 附录

编译命令：

```bash
latexmk -xelatex main-thesis.tex
```

---

### 2. 单独的外文翻译译文

使用 [main-translation.tex](main-translation.tex)。

该文档的规则是：

- 格式总体与正文一致
- 无英文摘要页
- 无页眉
- 无目录
- 全篇阿拉伯页码

编译命令：

```bash
latexmk -xelatex main-translation.tex
```

---

### 3. 含附录的毕业论文全文

使用 [main-thesis-with-appendix.tex](main-thesis-with-appendix.tex)。

该文档会在正文、参考文献之后自动加入：

- 附录 A：外文翻译
- 附录 B：外文原文 PDF

其中：

- 译文附录沿用论文页眉与连续页码
- 原文 PDF 也参与论文页码
- 原文附录不再生成多余的空白标题页

编译命令：

```bash
latexmk -xelatex main-thesis-with-appendix.tex
```

---

## 外文翻译怎么写

外文翻译统一从 [appendix/trans.tex](appendix/trans.tex) 进入。它负责两件事：

- 选择“带摘要页”还是“不带摘要页”
- [appendix/trans-body.tex](appendix/trans-body.tex)

### 第一步：选择译文类型

在 [appendix/trans.tex](appendix/trans.tex) 中二选一。

#### 方案一：论文/论文式文章

适用于有摘要页的外文论文、论文式文章。

默认启用的是这一套：

```tex
\input{appendix/trans-meta-article}
% \input{appendix/trans-meta-book}
```

对应模板文件是 [appendix/trans-meta-article.tex](appendix/trans-meta-article.tex)，示例写法：

```tex
\appendixtranslationtitle{某外文论文标题（译文）}
\begin{translationabstract}
这里填写译文摘要内容。
\translationkeywords{关键词1；关键词2；关键词3}
\end{translationabstract}
\newpage
```

### 方案二：书本/技术文档/一般资料

适用于没有摘要页的书本、技术手册、说明文档等。

使用时，把 [appendix/trans.tex](appendix/trans.tex) 改成：

```tex
% \input{appendix/trans-meta-article}
\input{appendix/trans-meta-book}
```

对应模板文件是 [appendix/trans-meta-book.tex](appendix/trans-meta-book.tex)，示例写法：

```tex
\appendixtranslationtitle{某外文书籍标题（译文）}
```

这种情况下没有摘要页，译文大标题后直接进入正文。

### 第二步：填写译文正文

正文写在 [appendix/trans-body.tex](appendix/trans-body.tex)。

可直接使用：

```tex
\translationsection{第一章标题}
这里开始正文内容。

\translationsubsection{1.1 小节标题}
这里继续写正文。

\translationsubsubsection{1.1.1 小节标题}
这里继续写正文。
```

说明：

- 独立译文模式下，这些命令按普通译文文档排版
- 附录模式下，显示为独立的“第1章 / 1.1 / 1.1.1”体系
- 译文内部子标题不会写入论文目录

---

## 外文原文 PDF 怎么接入

原文附录入口是 [appendix/origin.tex](appendix/origin.tex)。

你只需要改两个地方：

```tex
\setoriginappendixtitle{外文原文}
\setoriginpdfpath{appendix/LaTeX基础.pdf}

\USTSIncludeOriginAppendix
```

其中：

- `\setoriginappendixtitle{...}`：设置附录标题
- `\setoriginpdfpath{...}`：设置原文 PDF 路径
- `\USTSIncludeOriginAppendix`：执行插入，不要删除

原文附录的行为：

- 自动作为“附录 B”插入
- 自动进入目录
- 目录中只显示附录标题，不展开 PDF 内容
- PDF 首页自动覆盖附录标题
- PDF 页面继续参与论文页码

---

## 推荐使用流程

### 只写正文

1. 修改 [front/abstract_zh.tex](front/abstract_zh.tex) 和 [front/abstract_en.tex](front/abstract_en.tex)
2. 修改 [chapters/](chapters/) 下各章内容
3. 修改 [reference.bib](reference.bib)
4. 编译 [main-thesis.tex](main-thesis.tex)

### 只写单独外文翻译

1. 在 [appendix/trans.tex](appendix/trans.tex) 选择有无摘要页方案
2. 修改对应的 [appendix/trans-meta-article.tex](appendix/trans-meta-article.tex) 或 [appendix/trans-meta-book.tex](appendix/trans-meta-book.tex)
3. 在 [appendix/trans-body.tex](appendix/trans-body.tex) 写正文
4. 编译 [main-translation.tex](main-translation.tex)

### 生成带附录的最终论文

1. 先完成正文
2. 再完成 [appendix/trans.tex](appendix/trans.tex) 这一套译文内容
3. 在 [appendix/origin.tex](appendix/origin.tex) 配置原文 PDF
4. 编译 [main-thesis-with-appendix.tex](main-thesis-with-appendix.tex)

---

## 编译说明

推荐统一使用：

```bash
latexmk -xelatex main-thesis.tex
latexmk -xelatex main-translation.tex
latexmk -xelatex main-thesis-with-appendix.tex
```

如果需要手动编译正文类文档，可使用：

```bash
xelatex main-thesis-with-appendix
biber main-thesis-with-appendix
xelatex main-thesis-with-appendix
xelatex main-thesis-with-appendix
```

说明：

- 含参考文献的文档需要 `biber`
- 单独译文文档通常不需要 `biber`

---

## 历史版本

| 版本号 | 日期 | 更新内容 |
|:--:|:--:|:--|
| **0.0.2** | 2025-10-07 | 首个测试版本：待核验格式正确性。 |
| **0.0.3** | 2026-02-20 | 新增外文文献翻译及原文部分格式。 |
| **1.0.0** | 2026-02-23 | 正式版：统一正文使用说明，补齐 `cref`、列表、定理定义等环境示例并完善模板文档。 |
| **1.0.1** | 2026-02-23 | 修复正文 1.5 倍行距失效问题。 |
| **1.0.2** | 2026-02-24 | 优化证明环境样式。 |
| **1.0.3** | 2026-02-26 | 优化伪代码算法样式，新增章节引用示例。 |
| **2.0.0** | 2026-03-26 | 相对 `v1.0.3` 完成整体重构：旧 `main.tex` 拆为三个入口，`USTSthesis.cls` 模块化，旧 appendixA/B/C 体系改为 `trans/origin` 入口，补齐独立译文与附录译文两种模式，并重组章节与致谢文件结构。 |

---

## License

This LaTeX template is distributed under the LaTeX Project Public License (LPPL) version 1.3c or later.
