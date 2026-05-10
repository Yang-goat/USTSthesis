# USTSthesis

苏州科技大学本科毕业设计（论文）LaTeX 模板

![Version](https://img.shields.io/badge/version-2.1.1-blue.svg)
![License: LPPL 1.3c](https://img.shields.io/badge/license-LPPL%201.3c-green.svg)
![Build: XeLaTeX + Biber](https://img.shields.io/badge/build-XeLaTeX%20%2B%20Biber-orange.svg)

本模板面向苏州科技大学本科毕业设计（论文）写作，当前 `2.1.1` 版本已经完成三文档重构，并继续优化了字体粗细、图片目录、文献引用和使用说明，可同时支持：

- 毕业论文正文
- 单独的外文翻译译文
- 含外文翻译与外文原文附录的毕业论文全文

---

## 版本信息

- 当前版本：`2.1.1`
- 更新日期：`2026-05-10`
- 编译方式：`XeLaTeX + Biber`
- 格式参考：[苏州科技大学 毕业设计（论文）样式](https://bylw.usts.edu.cn/bysj/NewsDetail.aspx?ConfigurationID=8F0lgC4y7Ho%3d&HomePageManagementID=X0H9ludZcp8%3d)

---

## 2.1.1 更新内容

- 字体粗细优化：
  - 为 `\heiti` 对应的 `zhhei` 字族启用伪粗体，已有标题中的 `\heiti\bfseries` 现在会呈现为接近 Word 的“黑体+加粗”。
  - 为宋体字族补齐中文 `\textbf{...}` 的加粗渲染，正文和表格中的中文粗体不再退回普通宋体。
  - 将中文斜体形状映射回宋体，避免定理环境触发中文字体形状缺失警告。
- 模板元数据更新：
  - 类文件版本更新为 `v2.1.1`。
  - `USTSthesis.cls` 和 `style/` 下各模块日期更新为 `2026/05/10`。
- 文献引用优化：
  - 参考文献排序改为按正文引用顺序输出，避免按作者/年份重排后与正文引用顺序不一致。
  - 默认隐藏 URL，保留 DOI 和 eprint 信息，使参考文献列表更贴近毕业论文版式，同时保留关键电子出版信息。
- 图片目录约定：
  - 新增 [img/](img/) 作为论文图片推荐存放目录。
  - 更新正文示例，提示用户将自有图片放入 `img/` 并使用 `img/文件名.png` 的路径写法。
- 仓库维护：
  - 新增 `.gitignore`，忽略常见 LaTeX 编译中间文件。
  - 移除自动 release workflow，后续 release 改为手动发布。
- 示例与文档：
  - 刷新三个入口的示例 PDF。
  - README 补充图片、字体和编译清理说明。

---

## 项目结构

- [USTSthesis.cls](USTSthesis.cls)：模板类文件
- [style/](style/)：样式模块
- [front/](front/)：中英文摘要等前置部分
- [chapters/](chapters/)：论文章节
- [appendix/](appendix/)：外文翻译与原文附录
- [img/](img/)：论文图片推荐存放目录
- [reference.bib](reference.bib)：参考文献数据库

三套主入口：

- [main-thesis.tex](main-thesis.tex)：只生成毕业论文正文
- [main-translation.tex](main-translation.tex)：只生成单独外文翻译
- [main-thesis-with-appendix.tex](main-thesis-with-appendix.tex)：生成含外文翻译与外文原文附录的完整论文

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

2.1.1 版本默认按正文首次引用顺序输出参考文献，不再按作者和年份重新排序。因此通常只需要调整正文引用顺序，不需要手动改 `.bib` 文件中的条目先后。

文献列表默认隐藏 URL，保留 DOI 和 eprint 信息。若学校或学院要求必须显示 URL，可在 [style/USTS-bib.sty](style/USTS-bib.sty) 中把 `url=false` 改为 `url=true`。

---

## 推荐使用流程

### 只写正文

1. 修改 [front/abstract_zh.tex](front/abstract_zh.tex) 和 [front/abstract_en.tex](front/abstract_en.tex)
2. 修改 [chapters/](chapters/) 下各章内容
3. 将论文图片放到 [img/](img/) 并在正文中用 `img/文件名.png` 引用
4. 修改 [reference.bib](reference.bib)
5. 编译 [main-thesis.tex](main-thesis.tex)

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
- `.gitignore` 已忽略常见 LaTeX 中间文件；需要清理当前目录时可运行 `latexmk -C`

如果没有安装 `latexmk`，可以直接用 XeLaTeX 编译当前模板示例：

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

---

## License

This LaTeX template is distributed under the LaTeX Project Public License (LPPL) version 1.3c or later.
