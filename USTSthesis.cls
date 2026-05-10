% ----------------------------------------------------------
% USTSthesis.cls
% 统一类文件，负责三种入口文档：
%   thesis          正文
%   translation     独立外文翻译
%   thesisappendix  正文 + 附录译文
%
% 维护说明：
% 1. 模式选择放在本类文件中。
% 2. 通用格式拆分到 style/*.sty。
% 3. 译文相关差异集中在 USTS-translation.sty。
% ----------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{USTSthesis}[2026/05/10 USTS thesis template v2.1.0]

% ------------------ 模式开关 ------------------
\newif\ifUSTSthesis
\newif\ifUSTStranslation
\newif\ifUSTSthesisappendix
\USTSthesisfalse
\USTStranslationfalse
\USTSthesisappendixfalse

\DeclareOption{thesis}{\USTSthesistrue}
\DeclareOption{translation}{\USTStranslationtrue}
\DeclareOption{thesisappendix}{\USTSthesisappendixtrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax

% 默认回退到 thesis，兼容旧写法。
\ifUSTSthesis\else
  \ifUSTStranslation\else
    \ifUSTSthesisappendix\else
      \USTSthesistrue
    \fi
  \fi
\fi

% 基类保持与原始两个 cls 一致。
\LoadClass[12pt,a4paper,oneside]{ctexbook}

% ------------------ 模块加载 ------------------
% 先把 style/ 加入搜索路径，再按包名加载。
% 这样 \RequirePackage 的包名与 \ProvidesPackage 保持一致。
\makeatletter
\def\input@path{{style/}}
\makeatother
\RequirePackage{USTS-base}
\RequirePackage{USTS-page}
\RequirePackage{USTS-heading}
\RequirePackage{USTS-floats}
\RequirePackage{USTS-ref}
\RequirePackage{USTS-listing}
\RequirePackage{USTS-theorem}
\RequirePackage{USTS-bib}
\RequirePackage{USTS-translation}

% ------------------ 模式应用 ------------------
% 统一分发命令，在 \begin{document} 时执行。
% 这样所有模式切换逻辑都集中在一个地方。
\newcommand{\USTSApplyMode}{%
  \ifUSTSthesis
    \USTSSetupThesis
  \fi
  \ifUSTStranslation
    \USTSSetupTranslation
  \fi
  \ifUSTSthesisappendix
    \USTSSetupThesisAppendix
  \fi
}

\AtBeginDocument{\USTSApplyMode}

\endinput
