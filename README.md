# USTSthesis
苏州科技大学本科毕业设计（论文）LaTeX 模板

![Version](https://img.shields.io/badge/version-0.0.2-blue.svg)
![License: LPPL 1.3c](https://img.shields.io/badge/license-LPPL%201.3c-green.svg)
![Build: XeLaTeX + Biber](https://img.shields.io/badge/build-XeLaTeX%20%2B%20Biber-orange.svg)

本仓库提供一个可直接编译的本科毕业论文模板，内含示例章节、图表与参考文献的用法说明，并已去除个人信息，仅保留占位内容，便于二次修改。

---

## 特色
- 基于 `ctexbook`，中文样式与章节标题已配置
- 预置 `biblatex`（GB/T 7714-2015 风格）与 `biber` 后端
- 集成常用宏包：`graphicx`、`subcaption`、`booktabs`、`tabularx`、`algorithm2e`、`listings`、`cleveref` 等
- 示例章节“写作与排版示例”演示图片、子图、表格、列宽控制与交叉引用

---

## 目录结构
- `main.tex`：主文档（摘要、目录、正文、参考文献、附录顺序已配置）
- `USTSthesis.cls`：模板类文件（页面、字体、图表、标题、参考文献样式）
- `front/`：前置部分
  - `abstract_zh.tex`、`abstract_en.tex`、`acknowledgement.tex`
- `chapters/`：正文与附录
  - `introduction.tex`、`ch1.tex`（示例章节）、`ch2.tex`…、`appendixA.tex`
- `reference.bib`：参考文献数据库

---

## 编译方式
推荐使用 XeLaTeX + Biber：

```bash
xelatex main
biber main
xelatex main
xelatex main
```

或使用一键命令：

```bash
latexmk -xelatex -bibtex main.tex
```

> 提示：Windows 用户建议完整安装 TeX Live（或 MikTeX）并确保 `biber` 可用。

---

## 快速开始
1. 克隆仓库并进入项目根目录
2. 按“编译方式”运行编译，生成 `main.pdf`
3. 替换内容：
   - **论文题目**：编辑 `front/abstract_zh.tex` 与 `front/abstract_en.tex` 的参数
   - **摘要与关键词**：同上文件正文部分
   - **致谢**：修改 `front/acknowledgement.tex`
   - **正文章节**：在 `chapters/` 中撰写 `ch1.tex`、`ch2.tex` 等

---

## 图与表的使用（简要）

**插图**
- 单图：`\includegraphics[width=0.6\textwidth]{figures/example}`
- 子图：使用 `subfigure` 环境，建议子图宽度 `0.48\textwidth`
- 控制尺寸：用 `width=<比例>\textwidth` 或 `height=<数值>`
- 位置参数：`[H]` 强制当前位置，或 `[htbp]` 自动优化

**表格**
- 使用 `booktabs` 的 `\toprule / \midrule / \bottomrule`
- 固定列宽：`p{3cm}`；调整行距：`\renewcommand{\arraystretch}{1.2}`
- 自适应宽度：`tabularx` + `X` 列型，总宽 `\textwidth`

**交叉引用**
- 图表公式加 `\label{}`，正文用 `\ref{}` 或 `\eqref{}` 引用
- 推荐 `cleveref` 包的 `\cref{}` 自动添加前缀

更多示例与注释见章节：`chapters/ch1.tex`（写作与排版示例）。

---

## 参考文献
- 文献条目维护在 `reference.bib`
- 正文引用：`\cite{key}`
- 末尾：`\printbibliography` 自动生成“参考文献”并入目录

---

## 注意事项
- 模板仅提供格式框架与示例内容，请自行替换真实论文信息
- 若学校或学院更新格式要求，请以最新规范为准进行微调
- 字体需本机可用，Mac/Linux/Windows 字体名称可能略有差异

---

## 历史版本
| 版本号 | 日期 | 更新内容 |
|:--:|:--:|:--|
| **0.0.2** | 2025-10-07 | 首个测试版本：待核验格式正确性。 |

---

## License
This LaTeX template is distributed under the LaTeX Project Public License (LPPL) version 1.3c or later.
