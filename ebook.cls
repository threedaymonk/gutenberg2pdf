% vim: syntax=tex
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{ebook}[2010/03/12 Book class tweaked to make PDFs for ebook readers]

% Sensible defaults for book class
\PassOptionsToClass{10pt,oneside,onecolumn,final,openright}{book}

% Custom paper and margin sizes
\DeclareOption{sonyreader}{
  \def\@paperheight{115.854mm}
  \def\@paperwidth{88.184mm}
  \def\@margin{2mm}}

% Landscape option
\newif\iflandscape
\landscapefalse
\DeclareOption{landscape}{%
  \landscapetrue}

% Fonts
\DeclareOption{gentium}{%
  \def\@font{Gentium Basic}}
\DeclareOption{libertine}{%
  \def\@font{Linux Libertine O}}

% Inherit from existing book class
\ExecuteOptions{sonyreader,libertine} % default suits me
\ProcessOptions
\LoadClass{book}

% Apply paper size and margins
\ifdefined\@paperheight
  \setlength\paperheight {\@paperheight}
  \setlength\paperwidth  {\@paperwidth}
\fi

\iflandscape
  \setlength\@tempdima   {\paperheight}
  \setlength\paperheight {\paperwidth}
  \setlength\paperwidth  {\@tempdima}
\fi

\ifdefined\@margin
  \usepackage[top=\@margin, bottom=\@margin, left=\@margin, right=\@margin]{geometry}
\fi

% Turn off page numbering (the reader will handle this)
\pagestyle{empty}

% It's better that the document can be generated automatically, even if this is
% typographically suboptimal
\sloppy

% Don't print date on title page by default
\global\let\@date\@empty

% Ensure that title and author go into PDF metadata
\RequirePackage[xetex]{hyperref}
\renewcommand{\title}[1]{
  \gdef\@title{#1}
  \hypersetup{pdftitle={#1}}
}
\renewcommand{\author}[1]{
  \gdef\@author{#1}
  \hypersetup{pdfauthor={#1}}
}

% Remove indentation
\setlength\leftmargini   {0em}
\setlength\leftmarginii  {0em}
\setlength\leftmarginiii {0em}
\setlength\leftmarginiv  {0em}
\setlength\leftmarginv   {0em}
\setlength\leftmarginvi  {0em}

% Extra commands
\newcommand{\dinkus}{
  \begin{center}
  ***
  \end{center}}

% Fonts
\usepackage{fontspec}
\ifdefined\@font
  \setromanfont{\@font}
\fi

\endinput
