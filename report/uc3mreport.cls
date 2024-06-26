% =========================================================================== %
%% uc3mreport.cls : LaTeX Class File
% =========================================================================== %
% Authors: Luis Daniel Casais Mezquida <luisdaniel.casais@alumnos.uc3m.es> &
%          Jorge Lázaro Ruiz <jorge.lazaro@alumnos.uc3m.es>

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uc3mreport}[UC3M report template]



%----------
% GENERAL PACKAGES
%----------

\RequirePackage{enumerate}
\RequirePackage{import}
\RequirePackage{etoolbox}



%----------
% PACKAGE OPTIONS
%----------

% en: english
\newif\if@langen@pp\@langen@ppfalse  % check es language
\DeclareOption{en}{\@langen@pptrue}

% es: spanish
\newif\if@langes@pp\@langes@ppfalse  % check en language
\DeclareOption{es}{\@langes@pptrue}

\ProcessOptions\relax



%----------
% DOCUMENT SETTINGS
%----------

\LoadClass[12pt]{article}

% margins: 2.5 cm top and bottom; 3 cm left and right
\RequirePackage[a4paper, vmargin=2.5cm, hmargin=3cm]{geometry}
\RequirePackage{emptypage}  % removes headers/footers from empty pages

% Paragraph Spacing and Line Spacing: Narrow (6 pt / 1.15 spacing) or Moderate (6 pt / 1.5 spacing)
\renewcommand{\baselinestretch}{1.15}
\parskip=6pt

\RequirePackage[utf8]{inputenc}  % utf-8
\RequirePackage[T1]{fontenc}
\RequirePackage{mathptmx}  % times new roman



%----------
% LANGUAGE
%----------

\if@langes@pp  % spanish
	\RequirePackage[spanish, es-tabla]{babel}
	\RequirePackage[babel, spanish=spanish]{csquotes}
	\selectlanguage{spanish}

	\def\of{de}
	\def\proffesorname{Profesor}
\fi

\if@langen@pp  % english
	\RequirePackage[english]{babel}
	\RequirePackage[babel, english=american]{csquotes}
	\selectlanguage{english}

	\def\of{of}
	\def\proffesorname{Professor}
\fi



%----------
% CONFIG
%----------
\RequirePackage{listofitems}

% setup variables

\makeatletter
	\newcommand{\degree}[1]{\gdef\@degree{#1}}
	\newcommand{\subject}[1]{\gdef\@subject{#1}}
	\renewcommand{\year}[1]{\gdef\@year{#1}}  % academic year
	\newcommand{\shortauthor}[1]{\gdef\@shortauthor{#1}}  % teamname, or several authors names
	\newcommand{\lab}[1]{\gdef\@lab{#1}}  % Lab 1, Exercise 3, etc.
	\newcommand{\proffesor}[1]{\gdef\@proffesor{#1}}

\makeatother



%----------
% COLORS
%----------

\RequirePackage[table]{xcolor}

\definecolor{azulUC3M}{HTML}{000e78}



%----------
% LINKS
%----------

\RequirePackage[colorlinks]{hyperref}
\RequirePackage{url}

% coloring links
\hypersetup{
	linkcolor=blue,  % links to parts of the document
	urlcolor=blue,  % links to resources outside the document
	citecolor=blue,  % citations
	filecolor=black  % local files
}



%----------
% TITLES
%----------

\RequirePackage{sectsty}

\allsectionsfont{\color{azulUC3M}}  % color titles

\preto{\part}{\newpage}  % new page before part




%----------
% TOC
%----------

\RequirePackage{titletoc}
\RequirePackage[titles]{tocloft}

\setcounter{tocdepth}{2}  % index until subsection

% use simple pagestyle
\tocloftpagestyle{simple}  % this doesn't work porque patata
\pretocmd{\tableofcontents}{\pagestyle{simple}}{}{}
\pretocmd{\listoffigures}{\pagestyle{simple}}{}{}
\pretocmd{\listoftables}{\pagestyle{simple}}{}{}


% newpage after TOC/LOF/LOT
\apptocmd{\tableofcontents}{\newpage}{}{}
\apptocmd{\listoffigures}{\newpage}{}{}  % newpage after LOF
\apptocmd{\listoftables}{\newpage}{}{}  % newpage after LOT

% part
\renewcommand\cftpartfont{
	\Large
	\hypersetup{hidelinks}
	\bfseries
	\color{azulUC3M}
}
\renewcommand\cftpartpagefont{
	\Large
	\hypersetup{hidelinks}
	\bfseries
	\color{azulUC3M}
}

% section
\renewcommand\cftsecfont{
	\large
	\hypersetup{hidelinks}
	\bfseries
	\color{azulUC3M}
}
\renewcommand\cftsecpagefont{
	\large
	\hypersetup{hidelinks}
	\bfseries
	\color{azulUC3M}
}

% subsection
\apptocmd{\cftsubsecfont}{\hypersetup{hidelinks}}{}{}

% hile links LOF/LOT
\apptocmd{\cftfigfont}{\hypersetup{hidelinks}}{}{}
\apptocmd{\cfttabfont}{\hypersetup{hidelinks}}{}{}



%----------
% HEADERS & FOOTERS
%----------

\RequirePackage{fancyhdr}
\RequirePackage{lastpage}

\preto{\headrule}{\color{azulUC3M}}  % blue headrule
\preto{\footrule}{\color{azulUC3M}}  % blue footrule

\setlength{\headheight}{15pt}  % fix headheight

\makeatletter

	\fancypagestyle{fancy} {
		% header
		\fancyhf{}
		\renewcommand{\headrulewidth}{0.4pt}
		\lhead{
			\color{azulUC3M}
			\@lab: \@title
		}
		\rhead{
			\color{azulUC3M}
			\ifdef{\@shortauthor}{\@shortauthor}{}
		}
		% footer
		\renewcommand{\footrulewidth}{0.4pt}
		\lfoot{
			\color{azulUC3M}
			\@subject\ \@year
		}
		\rfoot{
			\hypersetup{hidelinks}
			\color{azulUC3M}
			pg. \thepage\ \of\ \pageref{LastPage}
		}
	}

	\fancypagestyle{simple} {
		\fancyhf{}  % Clear header/footer
		\renewcommand{\headrulewidth}{0pt}  % No header rule
		\renewcommand{\footrulewidth}{0pt}  % No header rule
		\cfoot{\color{azulUC3M}\thepage}
	}
\makeatother



%----------
% FIGURES
%----------

\RequirePackage{graphicx}
\RequirePackage{float}
\RequirePackage{svg}


% Figures layout for engineering
% \captionsetup[figure]{
% 	format=hang,
% 	name=Fig.,
% 	singlelinecheck=off,
% 	labelsep=period,
% 	labelfont=bf,
% 	font=small
% }



%----------
% MATH
%----------

\RequirePackage{amsmath, amssymb, amsfonts, amsthm, mathtools}

% usefull macros
\DeclarePairedDelimiter\ceil{\lceil}{\rceil}%
\DeclarePairedDelimiter\floor{\lfloor}{\rfloor}%
\DeclarePairedDelimiter\abs{\lvert}{\rvert}%



%----------
% MACROS
%----------

\makeatletter

\newcommand{\blankpage} {
	\clearpage  % blank page
	\thispagestyle{empty}
	\mbox{}
	\newpage
}

\RequirePackage{xstring}

% \abbreviateauthor{name(s)}{surname{s}}
\newcommand{\abbreviateauthor}[2] {%
	% save names and surnames into list
	\setsepchar{ }%
	\readlist*\@names{#1}%
	\setsepchar{ }%
	\readlist*\@surnames{#2}%
	% print
	\foreachitem\z\in\@names[] {%
		\StrLeft{\z}{1}. %
	}%
	\@surnames[1]%
}

\makeatother



%----------
% REPORT
%----------

\newenvironment{report}
	{  % begin definition
		\clearpage
		\pagestyle{fancy}
	}
	{\newpage}  % end definition



%----------
% COVER
%----------

\RequirePackage{ifthen}

\makeatletter

	% \makecover[old] for old logo, \makecover for new logo
	\newcommand{\makecover}[1][new] {
		\begin{titlepage}
			\color{azulUC3M}
			\begin{center}
				% university logo
				\begin{figure}[H]
					\centering
					\ifthenelse{\equal {#1} {old}}
						{  % old
							\includesvg[width=0.4\textwidth]{old_uc3m_logo.svg}
							\vspace{0.5cm}
						}
						{  % new
							\includesvg[width=\textwidth]{new_uc3m_logo.svg}
							\vspace{1.5cm}
						}
				\end{figure}
				%
				% subject
				\begin{Large}
					\textsl{\@degree}\\
					\medskip
					\@subject\\
					\@year\\
				\end{Large}
				% \vspace{1.5cm}
				\vfill
				%
				% title
				\Large\textsl{\@lab}\\
				\medskip
				\Huge ``\@title''\\
				%
				\rule{0.75\textwidth}{0.1mm}\\
				\vspace*{0.5cm}
				%
				% authors
				\begin{LARGE}
					\@author\\
				\end{LARGE}
				%
				\vfill
				%
				% professor
				\ifdef{\@proffesor}{
					\begin{Large}
						\textsl{\proffesorname:}\\
						\@proffesor\\
					\end{Large}
				}
				{}
				%
			\end{center}
			\vfill
		\end{titlepage}

		\newpage
	}

\makeatother
