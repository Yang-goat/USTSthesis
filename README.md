# USTSthesis

苏州科技大学本科毕业设计（论文）LaTeX 模板

![Version](https://img.shields.io/badge/version-2.1.3-blue.svg)
![License: LPPL 1.3c](https://img.shields.io/badge/license-LPPL%201.3c-green.svg)
![Build: XeLaTeX + Biber](https://img.shields.io/badge/build-XeLaTeX%20%2B%20Biber-orange.svg)

本模板面向苏州科技大学本科毕业设计（论文）写作，当前 `2.1.3` 版本在三文档架构基础上修复了无摘要页外文翻译的首页排版和附录译文公式编号问题，可同时支持：

- 毕业论文正文
- 单独的外文翻译译文
- 含外文翻译与外文原文附录的毕业论文全文

---

## 版本信息

- 当前版本：`2.1.3`
- 更新日期：`2026-05-15`
- 编译方式：`XeLaTeX + Biber`
- 格式参考：[苏州科技大学 毕业设计（论文）样式](https://bylw.usts.edu.cn/bysj/NewsDetail.aspx?ConfigurationID=8F0lgC4y7Ho%3d&HomePageManagementID=X0H9ludZcp8%3d)

---

## 2.1.3 更新内容

- 无摘要页译文排版修复：
  - 修复仅翻译模式下无摘要页译文标题后多出空页的问题，译文标题后可直接进入第 1 章。
  - 修复作为论文附录时无摘要页译文标题后多出空页的问题，附录标题、译文标题和第 1 章可连续排版。
- 附录译文公式编号修复：
  - 附录模式下译文章节继续使用独立的“第 1 章 / 1.1 / 1.1.1”体系。
  - 附录译文中的公式编号同步改为按译文章节编号，例如 `(1.1)`，不再沿用附录章号生成 `(A.1)`。

---

## 项目结构

如果你是第一次使用 LaTeX 或第一次接触多文件模板，可以先把这个项目理解成“内容文件 + 主入口文件”的结构：

- 内容文件负责写具体内容，例如摘要、正文各章、致谢、外文翻译正文。
- 主入口文件负责决定把哪些内容按什么顺序汇总成一个 PDF。
- 平时大多数修改都发生在内容文件里；编译时通常选择一个主入口文件编译。

核心文件和目录如下：

- [USTSthesis.cls](USTSthesis.cls)：模板类文件，控制整体版式、页眉页脚、章节样式等。一般不需要改。
- [style/](style/)：样式模块，拆分存放模板内部样式。一般不需要改。
- [front/](front/)：论文前置内容，目前包含中文摘要和英文摘要。
- [chapters/](chapters/)：论文正文内容，每个 `.tex` 文件对应一个章节或后置章节。写正文时主要改这里。
- [appendix/](appendix/)：外文翻译和外文原文附录。译文有一点特殊：同一份译文内容既可以单独编译成“外文翻译”文档，也可以被完整论文作为附录引用。
- [img/](img/)：论文图片推荐存放目录。
- [reference.bib](reference.bib)：参考文献数据库，正文中通过 `\cite{key}` 引用。

三个主入口文件如下：

- [main-thesis.tex](main-thesis.tex)：只汇总论文正文相关内容，生成毕业论文正文 PDF。
- [main-translation.tex](main-translation.tex)：只汇总外文翻译相关内容，生成单独的外文翻译 PDF。
- [main-thesis-with-appendix.tex](main-thesis-with-appendix.tex)：在论文正文后继续汇总外文翻译和外文原文 PDF，生成含附录的完整论文 PDF。

换句话说，正文、摘要、参考文献、译文正文等内容尽量各写各的，最后由三个 `main-*.tex` 入口按不同用途装配成不同文档。

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

## 推荐使用流程

### 第一次打开项目时

1. 先不要改模板样式文件，重点看三个主入口：`main-thesis.tex`、`main-translation.tex`、`main-thesis-with-appendix.tex`。
2. 确认你当前要生成哪一种文档：正文、单独译文，还是带附录的完整论文。
3. 先编译一次对应主入口，确认本机 LaTeX 环境可用。
4. 后续写作时主要修改 `front/`、`chapters/`、`appendix/`、`img/` 和 `reference.bib`。

### 写毕业论文正文

1. 在 [front/abstract_zh.tex](front/abstract_zh.tex) 填写中文摘要和关键词。
2. 在 [front/abstract_en.tex](front/abstract_en.tex) 填写英文摘要和关键词。
3. 在 [chapters/](chapters/) 下按章节写正文。可以先替换已有示例内容，再按需要新增章节文件。
4. 如果新增章节文件，需要在 `main-thesis.tex` 和 `main-thesis-with-appendix.tex` 中增加对应的 `\include{chapters/文件名}`。
5. 将论文图片放到 [img/](img/) 中，在正文里用 `img/文件名.png` 这类路径引用。
6. 在 [reference.bib](reference.bib) 中维护参考文献，在正文中使用 `\cite{key}` 引用。
7. 编译 [main-thesis.tex](main-thesis.tex) 查看正文版本。

### 写单独外文翻译

1. 在 [appendix/trans.tex](appendix/trans.tex) 选择译文类型：论文式文章使用 `trans-meta-article`，书本或技术文档使用 `trans-meta-book`。
2. 在对应的 [appendix/trans-meta-article.tex](appendix/trans-meta-article.tex) 或 [appendix/trans-meta-book.tex](appendix/trans-meta-book.tex) 中填写译文标题、摘要和关键词等信息。
3. 在 [appendix/trans-body.tex](appendix/trans-body.tex) 中填写译文正文。
4. 编译 [main-translation.tex](main-translation.tex) 查看单独译文版本。

### 生成带附录的最终论文

1. 先完成正文、摘要、参考文献等论文主体内容。
2. 完成 [appendix/trans.tex](appendix/trans.tex) 这一套外文翻译内容。
3. 在 [appendix/origin.tex](appendix/origin.tex) 中设置外文原文 PDF 的标题和路径。
4. 编译 [main-thesis-with-appendix.tex](main-thesis-with-appendix.tex) 查看带附录的完整论文。
5. 如果你同时维护正文版、译文版和完整版，最终提交前建议三个主入口都编译一次，避免某一个文档没有同步到最新内容。

---

## 外文翻译怎么写

外文翻译统一从 [appendix/trans.tex](appendix/trans.tex) 进入。它负责两件事：

- 选择“带摘要页”还是“不带摘要页”
- 引入 [appendix/trans-body.tex](appendix/trans-body.tex) 中的译文正文

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

## 图片怎么放

建议把论文图片统一放入 [img/](img/)。

正文中按相对路径引用，例如：

```tex
\begin{figure}[H]
  \centering
  \includegraphics[width=0.62\textwidth]{img/result.png}
  \caption{实验结果图}
  \label{fig:result}
\end{figure}
```

注意：

- LaTeX 路径建议统一使用 `/`，即 `img/result.png`，不要写成 Windows 反斜杠。
- 文件名尽量使用英文、数字、短横线或下划线，减少跨平台编译问题。
- 示例文件仍保留 `example-image-a`、`example-image-b`，这些是 LaTeX 自带占位图；正式论文替换为自己的 `img/...` 路径即可。

---

## 字体和加粗怎么用

大多数位置不需要手动设置字体，模板已经为章节标题、目录、摘要标题、关键词、图表标题和定理标题配置好字体。

需要在正文中手动加粗时：

```tex
普通中文加粗：\textbf{关键结论}
黑体加粗强调：{\heiti\bfseries 关键结论}
英文加粗：\textbf{important result}
```

说明：

- `\textbf{中文}` 会使用宋体加粗渲染。
- `{\heiti\bfseries ...}` 会使用黑体加粗渲染，更接近 Word 中“黑体+加粗”的效果。
- 不建议大段正文手动切换字体；学校格式相关的标题类样式优先交给模板控制。

---

## 参考文献怎么用

参考文献条目统一写在 [reference.bib](reference.bib)，正文中使用 `\cite{key}` 引用。

自 2.1.1 版本起，模板默认按正文首次引用顺序输出参考文献，不再按作者和年份重新排序。因此通常只需要调整正文引用顺序，不需要手动改 `.bib` 文件中的条目先后。

文献列表默认隐藏普通条目的 URL，保留 DOI 和 eprint 信息。这样期刊论文、图书、会议论文等条目即使在 `.bib` 中保留了 `url` 字段，文后参考文献也不会被很长的网址撑开。

如果某条文献本身就是电子资源，应在该条目内单独打开 URL 输出。推荐写成 `@online`，同时填写 `url`、`urldate`，并加入 `options = {url=true}`：

```bibtex
@online{web_resource_key,
  author  = {{机构名}},
  title   = {网页标题},
  year    = {2024},
  url     = {https://example.com/page},
  urldate = {2025-01-01},
  options = {url=true}
}
```

这样只会显示这条电子资源的 URL；其他普通文献仍按模板默认设置隐藏 URL。`GB/T 7714-2015` 对电子资源要求著录获取和访问路径，因此电子资源不要只写 `url` 字段而忘记 `options = {url=true}`。

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
- `front/`、`chapters/`、`appendix/` 下的内容文件不是完整文档，通常不要直接编译它们，而是编译三个 `main-*.tex` 主入口之一。
- `.gitignore` 已忽略常见 LaTeX 中间文件；需要清理当前目录时可运行 `latexmk -C`

### VS Code 插件编译提醒

如果你使用 VS Code + LaTeX Workshop 这类插件编译，每次打开项目后建议先确认当前选择的是正确的编译配方，例如：

```text
xelatex -> biber -> xelatex -> xelatex
```

或者插件中等价的 `xelatex、biber、xelatex*2` 配方。然后先对当前要维护的某一个主文件执行一次编译，例如 [main-thesis.tex](main-thesis.tex)、[main-translation.tex](main-translation.tex) 或 [main-thesis-with-appendix.tex](main-thesis-with-appendix.tex)。

这样做的目的是让插件知道你现在正在维护哪一个主文档。之后即使你修改并保存的是 `chapters/ch2.tex`、`front/abstract_zh.tex` 或 `appendix/trans-body.tex` 这类内容文件，插件通常也会自动回到刚才的主文件继续编译。其他两个主入口不会自动同步编译，需要你在需要时手动编译一次。

如果没有安装 `latexmk`，可以直接用 XeLaTeX 预览当前模板示例；若文档包含参考文献，仍需要按上面的手动流程执行 `biber` 后再运行两次 XeLaTeX：

```bash
xelatex main-thesis.tex
xelatex main-translation.tex
xelatex main-thesis-with-appendix.tex
```

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
| **2.1.1** | 2026-05-10 | 合并 2.1.x 更新：字体粗细优化，黑体加粗接近 Word 效果，中文 `\textbf` 正常加粗；参考文献按正文引用顺序输出，隐藏 URL 并保留 DOI/eprint；新增 `img/` 图片目录约定、`.gitignore`，移除自动 release workflow，并完善 README 与正文示例说明。 |
| **2.1.2** | 2026-05-11 | 文档整理更新：优化新手入门教程和多文件架构说明，提前并细化推荐使用流程，补充 VS Code 插件编译提醒，并为每个 `.tex` 文件增加用途注释。 |
| **2.1.3** | 2026-05-15 | 外文翻译格式修复：无摘要页译文标题后直接进入第 1 章，不再多出空页；附录译文公式按译文章节编号为 `(1.1)` 等，不再显示为 `(A.1)`。 |

---

## License

This LaTeX template is distributed under the LaTeX Project Public License (LPPL) version 1.3c or later.
