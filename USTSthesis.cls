% ----------------------------------------------------------
%  USTSthesis.cls
%  苏州科技大学本科毕业设计（论文）LaTeX 模板类
% ----------------------------------------------------------

\ProvidesClass{USTSthesis}[2025/10/06 苏州科技大学本科毕业设计模板]

% ================== 基类与中文支持 ==================
\LoadClass[12pt,a4paper,oneside]{ctexbook}

\usepackage{fontspec}
\usepackage{setspace}
\usepackage{xeCJK}
\usepackage{indentfirst}          % 章节后第一段缩进
\setCJKmainfont{SimSun}           % 宋体
\setCJKsansfont{SimHei}           % 黑体
\setCJKmonofont{FangSong}         % 仿宋
\setmainfont{Times New Roman}
\setsansfont{Arial}
\setmonofont{Courier New}
\linespread{1.5}
\setlength{\parindent}{2em}

% ================== 页面与格式 ==================
\usepackage{geometry}
\geometry{
  top=3.2cm, bottom=3cm, left=3cm, right=2.5cm,
  headheight=15pt, headsep=0.8cm, footskip=1.2cm
}

% ================== 页眉页脚 ==================
\usepackage{fancyhdr}
\fancypagestyle{plain}{%
  \fancyhf{}
  \fancyhead[C]{\zihao{-5}\songti 苏州科技大学本科毕业设计（论文）}
  \fancyfoot[C]{\zihao{-5}\songti\thepage}
}
\fancypagestyle{fancy}{%
  \fancyhf{}
  \fancyhead[C]{\zihao{-5}\songti 苏州科技大学本科毕业设计（论文）}
  \fancyfoot[C]{\zihao{-5}\songti\thepage}
}
\pagestyle{fancy}

% ================== 图表与数学 ==================
\usepackage{amsmath, amssymb, amsthm, bm, mathtools}
\usepackage{siunitx}
\sisetup{round-mode=places, round-precision=2}
\usepackage{graphicx, subcaption, float, booktabs, multirow, array, longtable, tabularx, multicol, makecell}
\usepackage{caption}
\captionsetup{font={small}, labelfont=bf, labelsep=quad, skip=6pt}
\renewcommand{\figurename}{图}
\renewcommand{\tablename}{表}
\numberwithin{figure}{chapter}
\numberwithin{table}{chapter}

% ================== 超链接与目录 ==================
\usepackage{hyperref}
\hypersetup{
  colorlinks=true,
  linkcolor=black,
  citecolor=black,
  urlcolor=blue,
  pdfstartview=FitH,
  bookmarksopen=true
}
\usepackage{bookmark}
\usepackage{cleveref}

% ================== 列表与代码 ==================
\usepackage{enumitem}
\setlist{nosep, topsep=3pt, leftmargin=2em}

\usepackage[ruled,vlined,linesnumbered]{algorithm2e}
\SetKwInput{KwIn}{输入}
\SetKwInput{KwOut}{输出}
\SetKw{KwTo}{至}
\SetKw{KwBy}{步长}
\SetKw{KwRet}{返回}
\SetAlCapNameFnt{\bfseries}
\SetAlCapFnt{\bfseries}
\SetAlgoCaptionSeparator{：}
\renewcommand{\algorithmcfname}{算法}
\renewcommand{\thealgocf}{\thechapter.\arabic{algocf}}

% 代码高亮
\usepackage{listings,xcolor}
\lstset{
  basicstyle=\ttfamily\small,
  keywordstyle=\color{blue},
  commentstyle=\color{gray},
  stringstyle=\color{brown},
  numbers=left,
  numberstyle=\tiny,
  numbersep=5pt,
  frame=single,
  breaklines=true,
  tabsize=4,
  captionpos=b
}

% ================== 章节标题格式 ==================
\usepackage{titlesec}
\titleformat{\chapter}[hang]{\centering\zihao{-2}\heiti}{第\,\thechapter\,章}{1em}{}
\titlespacing*{\chapter}{0pt}{-10pt}{20pt}
\titleformat{\section}{\zihao{3}\heiti}{\thesection}{1em}{}
\titleformat{\subsection}{\zihao{4}\heiti}{\thesubsection}{1em}{}

% ================== 定理环境 ==================
\newtheorem{theorem}{定理}[chapter]
\newtheorem{definition}{定义}[chapter]

% ================== 摘要环境（先题目后摘要） ==================
\newenvironment{zhabstract}[1]{%
  \chapter*{}
  \addcontentsline{toc}{chapter}{摘\quad 要}
  \thispagestyle{fancy}
  % ========= 标题部分 =========
  \begin{center}
    \zihao{3}\heiti #1  % 论文题目
  \end{center}
  \vspace{0.5em}
  \begin{center}
    \zihao{3}\heiti 摘 \quad 要  % 摘要标题
  \end{center}
  \vspace{1em}
  % ========= 摘要正文 =========
  \zihao{-4}\songti
  \setstretch{1.5}
}{\par\vspace{1em}}

\newenvironment{enabstract}[1]{%
  \chapter*{}
  \addcontentsline{toc}{chapter}{Abstract}
  \thispagestyle{fancy}
  % ========= 标题部分 =========
  \begin{center}
    \zihao{3}\bfseries #1  % 英文题目
  \end{center}
  \vspace{0.5em}
  \begin{center}
    \zihao{3}\bfseries Abstract  % 英文摘要标题
  \end{center}
  \vspace{1em}
  % ========= 摘要正文 =========
  \zihao{-4}
  \setstretch{1.5}
}{\par\vspace{1em}}

\newcommand{\keywords}[1]{%
  \vspace{1em}\par
  {\heiti 关键词：} #1
}

\newcommand{\enkeywords}[1]{%
  \vspace{1em}\par
  \textbf{Keywords:} #1
}

% ================== 外文文献翻译格式 ==================
\usepackage{pdfpages}

\newcommand{\translationtitle}[1]{%
  \begin{center}
    \zihao{3}\heiti #1
  \end{center}
  \vspace{0.5em}
}

\newenvironment{translationabstract}{%
  \begin{center}
    \zihao{3}\heiti 摘\quad 要
  \end{center}
  \vspace{1em}
  \zihao{-4}\songti
  \setstretch{1.5}
}{\par\vspace{1em}}

\newcommand{\translationkeywords}[1]{%
  \vspace{1em}\par
  {\heiti 关键词：} #1
}

\newcounter{translationsection}
\newcounter{translationsubsection}[translationsection]
\renewcommand{\thetranslationsubsection}{\arabic{translationsection}.\arabic{translationsubsection}}

\newcommand{\translationsection}[1]{%
  \refstepcounter{translationsection}%
  \section*{\arabic{translationsection}.\ #1}%
  \addcontentsline{toc}{section}{\arabic{translationsection}.\ #1}%
}

\newcommand{\translationsubsection}[1]{%
  \refstepcounter{translationsubsection}%
  \subsection*{\thetranslationsubsection\ #1}%
  \addcontentsline{toc}{subsection}{\thetranslationsubsection\ #1}%
}

% ================== 致谢环境 ==================
\newenvironment{acknowledgement}{
  \chapter*{致 \quad 谢}
  \addcontentsline{toc}{chapter}{致\quad 谢}
  \thispagestyle{fancy}
  \vspace{1em}
  \zihao{-4}\songti\setstretch{1.5}
}{\par\vspace{1em}}

% ================== 附录环境 ==================
\newcommand{\appendixsection}{
  \appendix
  \titleformat{\chapter}[hang]{\centering\zihao{-2}\heiti}{附录\,\thechapter}{1em}{}
}

% ================== 参考文献 ==================
\usepackage[
  backend=biber,
  style=gb7714-2015,
  gbpub=false,
  sorting=nyt,
  giveninits=true,
  maxnames=5
]{biblatex}
% \addbibresource{reference.bib}

% ================== 正文页码控制 ==================
% 在主文档中：
% \frontmatter % → 罗马数字页码（摘要、目录）
% \mainmatter  % → 阿拉伯数字页码（正文）
% \backmatter  % → 参考文献、致谢等

% ================== 结束 ==================
\endinput
