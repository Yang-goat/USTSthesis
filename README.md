# USTSthesis
苏州科技大学本科毕业设计（论文）LaTeX 模板

![Version](https://img.shields.io/badge/version-1.0.3-blue.svg)
![License: LPPL 1.3c](https://img.shields.io/badge/license-LPPL%201.3c-green.svg)
![Build: XeLaTeX + Biber](https://img.shields.io/badge/build-XeLaTeX%20%2B%20Biber-orange.svg)

本仓库提供可直接编译的本科毕业论文模板，包含摘要、目录、正文、参考文献、附录等完整结构，并给出正文写作与排版的可复用示例。

---

## 版本信息
- 当前版本：`1.0.3`
- 更新日期：`2026-02-26`
- 格式参考：[苏州科技大学 毕业设计（论文）样式](https://bylw.usts.edu.cn/bysj/NewsDetail.aspx?ConfigurationID=8F0lgC4y7Ho%3d&HomePageManagementID=X0H9ludZcp8%3d)

---

## 主要特性
- 基于 `ctexbook`，适配中文论文写作。
- 预置 `biblatex`（GB/T 7714-2015）与 `biber`。
- 集成常用宏包：`graphicx`、`subcaption`、`booktabs`、`tabularx`、`longtable`、`algorithm2e`、`listings`、`cleveref` 等。
- 提供完整正文使用说明（见 `chapters/ch1.tex`），覆盖：
  - 交叉引用（`\cref` / `\crefrange`）
  - 图、表、公式、算法
  - 列表环境（`enumerate`、`itemize`、`description`）
  - 定理定义类环境（`theorem`、`definition`、`lemma`、`proposition`、`corollary`）

---

## 项目结构
- `main.tex`：主文档入口（组织摘要、目录、正文、参考文献、附录）。
- `USTSthesis.cls`：模板类文件（版式、字体、章节样式、图表、数学环境等）。
- `front/`：摘要与致谢。
- `chapters/`：正文章节。
  - `chapters/ch1.tex`：模板正文使用说明（建议先读）。
  - `chapters/ch2.tex`：进阶示例（算法与实现细节写作框架）。
- `appendix/`：附录示例。
- `reference.bib`：参考文献数据库。

---

## 编译方式
推荐使用 XeLaTeX + Biber：

```bash
xelatex main
biber main
xelatex main
xelatex main
```

或使用：

```bash
latexmk -xelatex -bibtex main.tex
```

---

## 快速开始
1. 编译模板，确保可生成 `main.pdf`。
2. 按 `main.tex` 的章节顺序替换内容。
3. 优先参考 `chapters/ch1.tex` 中的正文示例写作。
4. 在 `reference.bib` 维护文献条目，正文使用 `\cite{key}`。

---

## 正文写作建议（对应模板能力）
- 图表与公式统一加 `\label{}`，正文统一用 `\cref{}` 引用。
- 定理、定义、引理、命题、推论可直接使用。
- 算法建议使用 `algorithm2e`，代码建议使用 `listings`。
- 提交前检查：图表是否有分析文字，引用是否完整，文献是否一一对应。

---

## 历史版本
| 版本号 | 日期 | 更新内容 |
|:--:|:--:|:--|
| **0.0.2**	| 2025-10-07	| 首个测试版本：待核验格式正确性。
| **0.0.3**	| 2026-02-20	| 新增外文文献翻译及原文部分格式。
| **1.0.0** | 2026-02-23 | 正式版：统一正文使用说明，补齐 `cref`、列表、定理定义等环境示例并完善模板文档。 |
| **1.0.1** | 2026-02-23 | 修复了正文1.5倍行距失效的bug。 |
| **1.0.2** | 2026-02-24 | 优化了证明没有加粗的效果。 |
| **1.0.3** | 2026-02-26 | 优化了伪代码算法样式。新增了章节引用示例。 |

---

## License
This LaTeX template is distributed under the LaTeX Project Public License (LPPL) version 1.3c or later.
