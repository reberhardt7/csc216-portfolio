\ProvidesClass{cs-portfolio}
\LoadClass[letterpaper,12pt]{article}

\usepackage[margin=1in]{geometry}
\usepackage{listings}
\usepackage{caption}
\usepackage{mdframed}
\usepackage{courier}
\usepackage{quoting}
\usepackage{tikz}
\usepackage{pgfplots}
\usepackage{etoolbox}

\setlength{\parindent}{0pt}

% Code blocks
\lstset{language=Java, frame=top, frame=bottom, captionpos=t,
		belowcaptionskip=8pt, aboveskip=8pt, belowskip=10pt,
		basicstyle=\small\ttfamily,
		numbers=left, numberstyle=\footnotesize, numbersep=10pt,
		showspaces=false, showstringspaces=false, showtabs=false, tabsize=4,
		breaklines=true}
\DeclareCaptionFormat{listing}{\rule{\dimexpr\textwidth\relax}{0.4pt}\par\vskip1pt#1#2#3}
\captionsetup[lstlisting]{format=listing,
						  singlelinecheck=false,
						  margin=0pt,
						  labelformat=empty,
						  font=bf}

% Block quotes (for questions/problems)
\newenvironment{blockquote} {
	\vspace{5pt}
	\begin{mdframed}[linewidth=2pt, topline=false, rightline=false, bottomline=false]
	\begin{quoting}[vskip=0pt, leftmargin=10pt, rightmargin=0pt, indentfirst=false]\itshape
}
{\end{quoting}\end{mdframed}\vspace{5pt}}

% Title page
\title{\vspace{3in}CSC 216: Portfolio \portfolionum}
\newcommand{\maketitlepage} {
	\maketitle
	\thispagestyle{empty}
	\newpage
}

% Section headers and helpers
\newcommand{\portfolio}[1] {\def\portfolionum{#1}}
\newcommand{\chapter}[1] {\def\chapternum{#1} \section*{Chapter #1}}
\newcommand{\homework} {\subsection*{Homework}}
\newcommand{\labs} {\subsection*{Labs}}
\newcommand{\problem}[2] {
	\begin{minipage}{\textwidth}
	\vspace{12pt}
	\subsubsection*{#1}
	\begin{blockquote}{#2}\end{blockquote}
	\vspace{-8pt}
	\end{minipage}
	\def\problemnum{#1}
}
\newcommand{\project}[1] {
	\section*{Project: #1}
	\def\problemnum{project}
	\let\chapternum\undefined
}

% Read code blocks from files
% The \ifdef{\chapternum}{\chapternum-}{} includes the chapter number prefix if a chapter is defined
% (in the case of Projects, there will be no chapter number)
\newcommand{\includesrc}[1] {\lstinputlisting[caption=#1]{\ifdef{\chapternum}{\chapternum-}{}\problemnum/#1}}
\newenvironment{scoped}{}{}
\newcommand{\includeout}[1][out]{
	{
		\definecolor{green}{HTML}{10e500}
		% Disable Java syntax highlighting and provide bash/terminal coloring for program output
		\lstset{language=, moredelim=**[is][\color{green}]{\\033[92m}{\\033[0m}}
		\lstinputlisting[caption=Program output]{\ifdef{\chapternum}{\chapternum-}{}\problemnum/#1}
	}
}
