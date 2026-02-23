% ----------------------------------------------------------
%  USTSthesis.cls
%  苏州科技大学本科毕业设计（论文）LaTeX 模板类
% ----------------------------------------------------------

\ProvidesClass{USTSthesis}[2026/02/23 苏州科技大学本科生毕业设计模板 v1.0.1]

% ================== 基类与中文支持 ==================
\LoadClass[12pt,a4paper,oneside]{ctexbook}

\RequirePackage{iftex}
\ifPDFTeX % 引擎检查
  \ClassError{USTSthesis}{This class requires XeLaTeX or LuaLaTeX}{%
    Please compile with XeLaTeX (recommended) or LuaLaTeX.}
\fi

\RequirePackage{fontspec}
\RequirePackage{setspace}
\RequirePackage{xeCJK}
\RequirePackage{indentfirst}                    % 章节后第一段缩进
% 中文字体
\setCJKmainfont{SimSun}      % 正文主中文字体
\setCJKsansfont[AutoFakeBold=true]{SimHei}      % 中文无衬线字体
\setCJKmonofont{FangSong}    % 中文等宽字体
% 西文字体
\setmainfont{Times New Roman}% 西文主字体
\linespread{1.5}                                % 行距1.5倍
\setlength{\parindent}{2em}                     % 首行缩进2个汉字宽度

% ================== 页面与格式 ==================
\RequirePackage{geometry}
\geometry{
  top=2.54cm, bottom=2.54cm, left=3.17cm, right=3.17cm, % 页边距
  headheight=15pt, headsep=0.5cm, footskip=0.8cm        % 页眉页脚距离
}

% ================== 正文字体 ==================
\renewcommand{\normalsize}{%
  \zihao{-4}\songti
  \selectfont
}

% ================== 页眉页脚 ==================
\RequirePackage{fancyhdr}
\fancyhf{}% 清空默认页眉页脚
\fancypagestyle{plain}{% 章首页
  \fancyhead[C]{\zihao{5}\songti 苏州科技大学本科生毕业论文}
  \fancyfoot[C]{\zihao{-5}\rmfamily\thepage}
}
\fancypagestyle{fancy}{% 其他页
  \fancyhead[C]{\zihao{5}\songti 苏州科技大学本科生毕业论文}
  \fancyfoot[C]{\zihao{-5}\rmfamily\thepage}
}
\renewcommand{\headrulewidth}{0.5pt}   % 页眉线粗细
\pagestyle{fancy}

% ================== 页码 ==================
% 在主文档中：
% \frontmatter % → 罗马数字页码（摘要、目录）
% \mainmatter  % → 阿拉伯数字页码（正文）
% \backmatter  % → 参考文献、致谢等
\renewcommand{\frontmatter}{% 摘要页码大写罗马
  \cleardoublepage
  \@mainmatterfalse
  \pagenumbering{Roman}
}

% ================== 标题摘要环境 ==================
\newenvironment{zhabstract}[1]{%
  \clearpage
  \thispagestyle{fancy}
  %题目：小二号黑体，居中，段前/段后2行
  \par\noindent
  \vspace*{20bp}
  \begin{center}
    \bfseries\heiti\zihao{-2} #1%
  \end{center}
  \vspace*{30bp}
  %摘要标题：3号黑体居中，两字之间空\quad
  \begin{center}
    \bfseries\heiti\zihao{3} 摘\quad 要%
  \end{center}
  \vspace{\baselineskip}
  %摘要正文：小4号宋体，1.5倍行距
  \zihao{-4}\songti
  \setstretch{1.5}\selectfont
}{%
  \par % 环境结束不主动加空行；“正文后空2行”交给 \keywords 控制
}
\newenvironment{enabstract}[1]{%
  \clearpage
  \thispagestyle{fancy}
  %英文题目：小二号 Times New Roman，加粗，居中，段前/段后2行
  \par\noindent
  \vspace*{20bp}
  \begin{center}
    \bfseries\rmfamily\zihao{-2} #1%
  \end{center}
  \vspace*{30bp}
  %Abstract 标题：3号 Times New Roman，加粗，居中
  \begin{center}
    \bfseries\rmfamily\zihao{3} Abstract%
  \end{center}
  \vspace{\baselineskip}
  %摘要正文：小4号，1.5倍行距
  \zihao{-4}\rmfamily
  \setstretch{1.5}\selectfont
}{%
  \par
}

% ================== 关键词 ==================
\newcommand{\keywords}[1]{%
  \par\vspace{2\baselineskip}%
  {\bfseries\heiti\zihao{-4} 关键词\quad}{\zihao{-4}\songti #1}%
}
\newcommand{\enkeywords}[1]{%
  \par\vspace{2\baselineskip}%
  {\bfseries\zihao{-4} Keywords\quad}{\zihao{-4} #1}%
}

% ================== 章节标题格式 ==================
\RequirePackage{titlesec}
\renewcommand{\thechapter}{\arabic{chapter}}
% 章标题：小三号黑体，加粗，段前0.5行，段后0.5行
\titleformat{\chapter}[hang]
  {\centering\bfseries\heiti\zihao{-3}}
  {第\,\thechapter\,章}
  {1em}
  {}
\titlespacing*{\chapter}
  {0pt}
  {-0.5\baselineskip}
  {0.75\baselineskip}
% 二级标题：四号黑体，加粗
\titleformat{\section}
  {\bfseries\heiti\zihao{4}}
  {\thesection}
  {1em}
  {}
% 三级标题：小四号黑体，加粗
\titleformat{\subsection}
  {\bfseries\heiti\zihao{-4}}
  {\thesubsection}
  {1em}
  {}

% ================== 目录格式设置（改好版：编号黑体加粗，标题宋体不加粗） ==================
\RequirePackage{titletoc}
\RequirePackage{setspace}
\setcounter{tocdepth}{2}% 目录深度到subsection
\renewcommand{\contentsname}{%
  {\centering\zihao{-3}\heiti\bfseries 目\hspace{1em} 录}%
  \vspace{0.75\baselineskip}%
}
% 目录整体 1.5 倍行距（并在目录内局部加粗“编号”而不影响标题）
\let\USTS@oldtableofcontents\tableofcontents
\renewcommand{\tableofcontents}{%
  \begingroup
  \setstretch{1.5}\selectfont
  % 仅在目录中：让 \numberline{编号} 输出为黑体加粗，标题正文不受影响
  \let\USTS@oldnumberline\numberline
  \renewcommand{\numberline}[1]{%
    \USTS@oldnumberline{{\heiti\bfseries ##1}}%
  }%
  \USTS@oldtableofcontents
  \endgroup
}
% 设置章节为数字编号
\ctexset{
  chapter = {
    name = {第,章},
    number = \arabic{chapter}
  }
}
% chapter（章）条目：第X章 标题 .... 页码
\titlecontents{chapter}
  [0em]
  {%
    \zihao{5}\songti
    \setlength{\baselineskip}{20pt}%
    \parskip=0pt
  }
  {\bfseries\heiti\thecontentslabel\hspace{0.5em}} %有编号章样式
  {\bfseries\heiti}% 无编号章样式
  {\titlerule*[0.5pc]{.}\contentspage}
% section（节）条目：1.1 标题 .... 页码
\titlecontents{section}
  [1.5em]
  {\zihao{5}\songti}
  {{\heiti\bfseries\thecontentslabel\quad}}
  {}
  {\titlerule*[0.5pc]{.}\contentspage}
% subsection（小节）条目：1.1.1 标题 .... 页码
\titlecontents{subsection}
  [3em]
  {\zihao{5}\songti}
  {{\heiti\bfseries\thecontentslabel\quad}}
  {}
  {\titlerule*[0.5pc]{.}\contentspage}

% ================== 图表与数学 ==================
\RequirePackage{amsmath, amssymb, amsthm, bm, mathtools}
% \RequirePackage{siunitx}
% \sisetup{round-mode=places, round-precision=2}% 数字保留两位小数
\RequirePackage{graphicx, subcaption, float, booktabs, multirow, array, longtable, tabularx, multicol, makecell}
\RequirePackage{caption}
% 三线表线宽（booktabs）：\toprule / \midrule / \cmidrule
\setlength{\heavyrulewidth}{0.10em} % 顶线、底线
\setlength{\lightrulewidth}{0.06em} % 中线
\setlength{\cmidrulewidth}{0.06em}  % 子分组线
\DeclareCaptionFont{wuhaoSong}{\zihao{5}\songti}% 图表标题字体
\captionsetup{font={wuhaoSong}, labelfont={wuhaoSong}, labelsep=quad, labelsep=quad, skip=6pt}% 图表标题格式
\captionsetup[subfigure]{font={wuhaoSong}, labelfont={wuhaoSong}}% 子图标题格式
\captionsetup[subtable]{font={wuhaoSong}, labelfont={wuhaoSong}}% 子表标题格式
\RequirePackage{etoolbox}
\newcommand{\USTStablefont}{\zihao{5}\songti}% 表格字体
\AtBeginEnvironment{table}{\USTStablefont}
\AtBeginEnvironment{longtable}{\USTStablefont}
\AtBeginEnvironment{tabular}{\USTStablefont}
\AtBeginEnvironment{tabularx}{\USTStablefont}
\renewcommand{\figurename}{图}
\renewcommand{\tablename}{表}
\numberwithin{figure}{chapter}% 图表编号按章节
\numberwithin{table}{chapter}% 表格编号按章节

% ================== 超链接 ==================
\RequirePackage{hyperref}
\hypersetup{
  colorlinks=true,
  linkcolor=black,
  citecolor=black,
  urlcolor=black,
  pdfstartview=FitH,
  bookmarksopen=true
}
\RequirePackage{bookmark}
\RequirePackage{cleveref}% 智能引用 \cref{}
% 名称改中文
\crefname{figure}{图}{图}
\Crefname{figure}{图}{图}
\crefname{table}{表}{表}
\Crefname{table}{表}{表}
\crefname{equation}{式}{式}
\Crefname{equation}{式}{式}
\crefname{algocf}{算法}{算法}
\Crefname{algocf}{算法}{算法}
\crefname{theorem}{定理}{定理}
\Crefname{theorem}{定理}{定理}
\crefname{definition}{定义}{定义}
\Crefname{definition}{定义}{定义}
\crefname{lemma}{引理}{引理}
\Crefname{lemma}{引理}{引理}
\crefname{proposition}{命题}{命题}
\Crefname{proposition}{命题}{命题}
\crefname{corollary}{推论}{推论}
\Crefname{corollary}{推论}{推论}
% 单个
\crefformat{figure}{图~#2#1#3}
\Crefformat{figure}{图~#2#1#3}
\crefformat{table}{表~#2#1#3}
\Crefformat{table}{表~#2#1#3}
\crefformat{equation}{式~(#2#1#3)}
\Crefformat{equation}{式~(#2#1#3)}
\crefformat{algocf}{算法~#2#1#3}
\Crefformat{algocf}{算法~#2#1#3}
\crefformat{theorem}{定理~#2#1#3}
\Crefformat{theorem}{定理~#2#1#3}
\crefformat{definition}{定义~#2#1#3}
\Crefformat{definition}{定义~#2#1#3}
\crefformat{lemma}{引理~#2#1#3}
\Crefformat{lemma}{引理~#2#1#3}
\crefformat{proposition}{命题~#2#1#3}
\Crefformat{proposition}{命题~#2#1#3}
\crefformat{corollary}{推论~#2#1#3}
\Crefformat{corollary}{推论~#2#1#3}
% 连续范围
\crefrangeformat{figure}{图~#3#1#4-#5#2#6}
\Crefrangeformat{figure}{图~#3#1#4-#5#2#6}
\crefrangeformat{table}{表~#3#1#4-#5#2#6}
\Crefrangeformat{table}{表~#3#1#4-#5#2#6}
\crefrangeformat{equation}{式~(#3#1#4-#5#2#6)}
\Crefrangeformat{equation}{式~(#3#1#4-#5#2#6)}

% ================== 列表与代码 ==================
\RequirePackage{enumitem}
\setlist[enumerate,1]{
    label=(\arabic*),     % (1)
    leftmargin=*,         % 自动计算正文缩进
    labelindent=2em,      % 序号整体缩进两个中文字符
    labelsep=0.5em,       % 序号和内容间距
    itemsep=0pt,
    topsep=6pt,
    align=left
}
\setlist[itemize,1]{
    label=\textbullet,
    leftmargin=*,
    labelindent=2em,
    labelsep=0.5em,
    itemsep=0pt,
    topsep=6pt,
    align=left
}
\setlist[description]{
    leftmargin=*,
    labelindent=2em,
    labelsep=0.5em,
    itemsep=0pt,
    topsep=6pt,
    style=nextline,
    font=\bfseries
}
\AtBeginEnvironment{enumerate}{
    \zihao{-4}\songti          % 小四号宋体
    \setstretch{1.5}           % 1.5倍行距
}
\AtBeginEnvironment{itemize}{
    \zihao{-4}\songti
    \setstretch{1.5}
}
\AtBeginEnvironment{description}{
    \zihao{-4}\songti
    \setstretch{1.5}
}
\RequirePackage[ruled,vlined,linesnumbered]{algorithm2e}
\SetKwInput{KwIn}{输入}
\SetKwInput{KwOut}{输出}
\SetKw{KwTo}{至}
\SetKw{KwBy}{步长}
\SetKw{KwRet}{返回}
\SetAlCapNameFnt{\bf}
\SetAlCapFnt{\bf}
\SetAlgoCaptionSeparator{：}
\renewcommand{\algorithmcfname}{算法}
\renewcommand{\thealgocf}{\thechapter.\arabic{algocf}}
% 代码高亮
\RequirePackage{listings,xcolor}
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

% ================== 定理环境 ==================
\theoremstyle{plain}
\newtheorem{theorem}{\heiti\bfseries 定理}[chapter]
\newtheorem{lemma}{\heiti\bfseries 引理}[chapter]
\newtheorem{proposition}{\heiti\bfseries 命题}[chapter]
\newtheorem{corollary}{\heiti\bfseries 推论}[chapter]
\theoremstyle{definition}
\newtheorem{definition}{\heiti\bfseries 定义}[chapter]

% ================== 外文文献翻译格式 ==================
\RequirePackage{pdfpages}
% 译文“总标题”
\newcommand{\translationtitle}[1]{%
  \par
  \thispagestyle{fancy}%
  \vspace*{\baselineskip}% 上空 1.5 行
  \begin{center}
    \zihao{-3}\heiti\bf #1%
  \end{center}%
  % \vspace{\baselineskip}% 下空 1.5 行
  \addcontentsline{toc}{section}{#1}%
  % 后续正文：小四宋体 + 1.5 倍行距
  \zihao{-4}\songti
  \setstretch{1.5}\selectfont%
}
% 译文摘要环境
\newenvironment{translationabstract}{%
  \par
  \begin{center}
    \zihao{-3}\heiti\bf 摘\quad 要%
  \end{center}%
  \vspace{\baselineskip}%
  \zihao{-4}\songti
  \setstretch{1.5}\selectfont%
}{%
  \par
}
% 译文关键词
\newcommand{\translationkeywords}[1]{%
  \par\vspace{2\baselineskip}%
  {\zihao{-4}\heiti\bf 关键词\quad}{\zihao{-4}\songti #1}%
  \par
}
%译文内部层级标题
\newcounter{translationsection}
\newcounter{translationsubsection}[translationsection]
\newcounter{translationsubsubsection}[translationsubsection]
\renewcommand{\thetranslationsubsection}{\arabic{translationsection}.\arabic{translationsubsection}}
\renewcommand{\thetranslationsubsubsection}{\thetranslationsubsection.\arabic{translationsubsubsection}}
% 一级（相当于 section）
\newcommand{\translationsection}[1]{%
  \refstepcounter{translationsection}%
  \par\vspace{0.5\baselineskip}%
  {\noindent\zihao{4}\heiti\bf \arabic{translationsection}.\ #1\par}%
  \vspace{0.5\baselineskip}%
  \zihao{-4}\songti\setstretch{1.5}\selectfont%
}
% 二级（相当于 subsection）
\newcommand{\translationsubsection}[1]{%
  \refstepcounter{translationsubsection}%
  \par\vspace{0.5\baselineskip}%
  {\noindent\zihao{-4}\heiti\bf \thetranslationsubsection\ #1\par}%
  \vspace{0.5\baselineskip}%
  \zihao{-4}\songti\setstretch{1.5}\selectfont%
}
% 三级
\newcommand{\translationsubsubsection}[1]{%
  \refstepcounter{translationsubsubsection}%
  \par\vspace{0.5\baselineskip}%
  {\noindent\zihao{-4}\heiti\bf \thetranslationsubsubsection\ #1\par}%
  \vspace{0.5\baselineskip}%
  \zihao{-4}\songti\setstretch{1.5}\selectfont%
}

% ================== 参考文献 ==================
\RequirePackage[
  backend=biber,
  style=gb7714-2015,
  gbpub=false,
  sorting=nyt,
  giveninits=true,
  maxnames=5
]{biblatex}
% \addbibresource{reference.bib}

% ================== 结束 ==================
\endinput
