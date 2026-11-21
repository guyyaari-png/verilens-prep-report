%% =====================================================================
%%  my-template.cls  —  תבנית לדוחות בעברית ובאנגלית (LuaLaTeX)
%%  גרסה: 1.1  |  תאריך: 2026-11-21
%%  מחברים: גיא יערי, פז ניסים
%%  הידור: lualatex -> biber -> lualatex -> lualatex
%%  רשימת פקודות מלאה ודוגמאות: TEMPLATE.md
%%
%%  יומן שינויים (Changelog)
%%  ----------------------------------------------------------------
%%  1.1  2026-11-21  סימן כיוון (RLM) בפקודות הסימון; "נספח" בכותרות הנספחים;
%%       כותרות עליונות ותחתונות בעברית גם בעמודי המקורות; שבירת קישורים ארוכים
%%  1.0  2026-11-21  גרסה ראשונה, בנויה בשישה שלבים:
%%       שלב 1  שלד, שפות וגופנים (babel, bidi=basic, Frank Ruhl, Heebo)
%%       שלב 2  פקודות סימון: \en \num \he \code \req
%%       שלב 3  פרקים, סעיפים, מספור ותוכן עניינים
%%       שלב 4  טבלאות (עמודה ראשונה מימין), ארבע תיבות, תרשימים בטוחים
%%       שלב 5  עמוד שער, כותרת עליונה ותחתונה, ספירת עמודים
%%       שלב 6  ביבליוגרפיה (biblatex+biber, IEEE), TEMPLATE.md, דוגמה
%% =====================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{my-template}[2026/11/21 v1.1 Hebrew-English report template]
\def\mytemplate@version{1.1}

\LoadClass[11pt,a4paper,oneside]{report}

%% ---------------------------------------------------------------------
%% שלב 1: שלד, שפות וגופנים
%% ---------------------------------------------------------------------
\RequirePackage{iftex}
\RequireLuaTeX
\RequirePackage[english,bidi=basic,layout=tabular.lists.counters]{babel}
\babelprovide[import,main]{hebrew}
\babelfont{rm}[Path=fonts/,Extension=.ttf,UprightFont=*-400,BoldFont=*-700,
               ItalicFont=*-400,BoldItalicFont=*-700]{FrankRuhl}
\babelfont{sf}[Path=fonts/,Extension=.ttf,UprightFont=*-400,BoldFont=*-700,
               ItalicFont=*-400,BoldItalicFont=*-700]{Heebo}
\babelfont{tt}{DejaVu Sans Mono}

\RequirePackage[a4paper,top=2.4cm,bottom=2.4cm,left=2.3cm,right=2.3cm,
                headheight=15pt]{geometry}
\RequirePackage{setspace}\setstretch{1.08}
\setlength{\parskip}{4pt}
\setlength{\parindent}{0pt}
\setlength{\emergencystretch}{3em}

\RequirePackage{xcolor}
\definecolor{ink}{HTML}{1F2A44}
\definecolor{acc}{HTML}{0B6E99}
\definecolor{acc2}{HTML}{C2410C}
\definecolor{soft}{HTML}{E8F1F6}
\definecolor{soft2}{HTML}{FDEEE4}
\definecolor{okc}{HTML}{2E7D32}
\definecolor{midc}{HTML}{F2B705}
\definecolor{badc}{HTML}{C62828}
\definecolor{rulec}{HTML}{B8C4D0}

%% ---------------------------------------------------------------------
%% שלב 2: פקודות סימון — מטרה אחת לכל פקודה
%% ---------------------------------------------------------------------
% מילה, שם או קיצור באנגלית (גם ביטוי של כמה מילים, כיחידה אחת)
% סימן כיוון בלתי נראה (RLM): תא בטבלה או תווית שמתחילים באנגלית או במספר נשארים מימין לשמאל
\newcommand{\rlm}{\char"200F\relax}
\newcommand{\en}[1]{\rlm\foreignlanguage{english}{#1}}
% מספר, שבר עשרוני, טווח, אחוז, סכום או גרסה, כיחידה אחת משמאל לימין
\newcommand{\num}[1]{\rlm\foreignlanguage{english}{#1}}
% עברית בתוך סביבה אנגלית (למשל תווית בתרשים)
\newcommand{\he}[1]{\foreignlanguage{hebrew}{\rlm#1\rlm}}
% קוד או שם קובץ קצר בתוך שורה
\newcommand{\code}[1]{\rlm\foreignlanguage{english}{\texttt{#1}}}
% מזהה של דרישה, בדיקה, סיכון או תוצר (למשל FR-01)
\newcommand{\req}[1]{\rlm\foreignlanguage{english}{\texttt{\small #1}}}

%% ---------------------------------------------------------------------
%% שלב 3: פרקים, סעיפים, מספור ותוכן עניינים
%% ---------------------------------------------------------------------
\setcounter{secnumdepth}{2}
\setcounter{tocdepth}{1}
\renewcommand{\@makechapterhead}[1]{%
  {\parindent\z@\normalfont
   {\color{acc}\sffamily\large \@chapapp\ \thechapter}\par\vskip 2pt
   {\color{ink}\sffamily\bfseries\LARGE #1}\par\vskip 4pt
   {\color{acc}\rule{\linewidth}{1.2pt}}\par\vskip 14pt}}
\renewcommand{\@makeschapterhead}[1]{%
  {\parindent\z@\normalfont
   {\color{ink}\sffamily\bfseries\LARGE #1}\par\vskip 4pt
   {\color{acc}\rule{\linewidth}{1.2pt}}\par\vskip 14pt}}
\renewcommand{\section}{\@startsection{section}{1}{\z@}%
  {-3.0ex \@plus -1ex \@minus -.2ex}{1.2ex \@plus .2ex}%
  {\normalfont\sffamily\Large\bfseries\color{ink}}}
\renewcommand{\subsection}{\@startsection{subsection}{2}{\z@}%
  {-2.4ex\@plus -1ex \@minus -.2ex}{0.8ex \@plus .2ex}%
  {\normalfont\sffamily\large\bfseries\color{ink}}}
% מספור מורכב (2.1) תמיד משמאל לימין, גם בכיתובים ובהפניות
\renewcommand{\thesection}{\babelsublr{\thechapter.\arabic{section}}}
\renewcommand{\thesubsection}{\babelsublr{\thechapter.\arabic{section}.\arabic{subsection}}}
\renewcommand{\thetable}{\babelsublr{\thechapter.\arabic{table}}}
\renewcommand{\thefigure}{\babelsublr{\thechapter.\arabic{figure}}}
% נספחים מסומנים באותיות עבריות
\g@addto@macro\appendix{\renewcommand{\thechapter}{\ifcase\value{chapter}\or א\or ב\or ג\or ד\or ה\fi}%
  \renewcommand{\thetable}{\thechapter\arabic{table}}\renewcommand{\thefigure}{\thechapter\arabic{figure}}}
% כותרת לא נשארת לבד בתחתית עמוד
\RequirePackage{needspace,etoolbox}
\pretocmd{\section}{\needspace{7\baselineskip}}{}{}
\pretocmd{\subsection}{\needspace{4\baselineskip}}{}{}
\RequirePackage{enumitem}
\setlist{itemsep=2pt,topsep=3pt,parsep=0pt}

% שמות בעברית לרכיבים אוטומטיים
\addto\captionshebrew{%
  \renewcommand{\contentsname}{תוכן עניינים}%
  \renewcommand{\listfigurename}{רשימת איורים}%
  \renewcommand{\listtablename}{רשימת טבלאות}%
  \renewcommand{\figurename}{איור}%
  \renewcommand{\tablename}{טבלה}%
  \renewcommand{\chaptername}{פרק}%
  \renewcommand{\appendixname}{נספח}%
  \renewcommand{\bibname}{מקורות}}

%% ---------------------------------------------------------------------
%% שלב 4: טבלאות, תיבות ותרשימים
%% ---------------------------------------------------------------------
\RequirePackage{array,booktabs,tabularx,longtable,multirow}
\RequirePackage{amsmath,amssymb}
\renewcommand{\arraystretch}{1.2}
% עמודת טקסט רחבה; העמודה הראשונה בטבלה היא תמיד הימנית
\newcolumntype{Y}{>{\raggedright\arraybackslash}X}
\newcolumntype{C}{>{\centering\arraybackslash}X}
% כותרת עמודה מודגשת
\newcommand{\colhead}[1]{\textbf{#1}}

% כיתובים: קטנים, תווית מודגשת
\RequirePackage[font=small,labelfont=bf,skip=5pt]{caption}
\setlength{\textfloatsep}{10pt plus 3pt minus 3pt}
\setlength{\floatsep}{9pt plus 2pt minus 2pt}
\setlength{\intextsep}{9pt plus 2pt minus 2pt}
\setcounter{topnumber}{3}\setcounter{bottomnumber}{2}\setcounter{totalnumber}{5}
\renewcommand{\topfraction}{0.88}\renewcommand{\bottomfraction}{0.6}
\renewcommand{\textfraction}{0.08}\renewcommand{\floatpagefraction}{0.75}

% ארבעה סוגי תיבות: מסקנה, הערה, אזהרה, דוגמה
\RequirePackage{float}
\RequirePackage[most]{tcolorbox}
\tcbset{mybox/.style={enhanced,breakable,boxrule=0.6pt,arc=3pt,
  left=6pt,right=6pt,top=4pt,bottom=4pt,fonttitle=\sffamily\bfseries\small,
  coltitle=white,before skip=6pt,after skip=6pt,halign title=flush right}}
% התיבה עצמה נבנית בסביבה אנגלית (מסגרת LTR) והתוכן בעברית (RTL)
\newtcolorbox{mytcb@box}[3]{mybox,colback=#1,colframe=#2,title={\he{#3}},
  before upper={\selectlanguage{hebrew}}}
\newenvironment{keybox}[1][מסקנה]{\par\begin{otherlanguage}{english}\begin{mytcb@box}{soft}{acc}{#1}}{\end{mytcb@box}\end{otherlanguage}}
\newenvironment{notebox}[1][הערה]{\par\begin{otherlanguage}{english}\begin{mytcb@box}{okc!6}{okc}{#1}}{\end{mytcb@box}\end{otherlanguage}}
\newenvironment{warnbox}[1][אזהרה]{\par\begin{otherlanguage}{english}\begin{mytcb@box}{badc!5}{badc}{#1}}{\end{mytcb@box}\end{otherlanguage}}
\newenvironment{examplebox}[1][דוגמה]{\par\begin{otherlanguage}{english}\begin{mytcb@box}{soft2}{acc2}{#1}}{\end{mytcb@box}\end{otherlanguage}}

% תרשימים: נבנים תמיד בסביבה אנגלית (LTR); תוויות בעברית דרך \he
\RequirePackage{tikz}
\usetikzlibrary{arrows.meta,positioning,shapes.geometric,shapes.misc,fit,calc,
                backgrounds,decorations.pathreplacing}
\RequirePackage{pgfplots}\pgfplotsset{compat=1.18}
\RequirePackage{pgfgantt}
\newenvironment{ltrdiagram}{\par\begin{otherlanguage}{english}\begin{center}}{\end{center}\end{otherlanguage}\vspace{-6pt}}

%% ---------------------------------------------------------------------
%% שלב 5: עמוד שער, כותרת עליונה ותחתונה
%% ---------------------------------------------------------------------
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\newcommand{\@reporttitle}{}\newcommand{\@reportsubtitle}{}
\newcommand{\@reporttagline}{}\newcommand{\@course}{}
\newcommand{\@institution}{}\newcommand{\@lecturer}{}
\newcommand{\@students}{}\newcommand{\@reportdate}{}
\newcommand{\@docversion}{}\newcommand{\@shorttitle}{}
\newcommand{\reporttitle}[1]{\renewcommand{\@reporttitle}{#1}}
\newcommand{\reportsubtitle}[1]{\renewcommand{\@reportsubtitle}{#1}}
\newcommand{\reporttagline}[1]{\renewcommand{\@reporttagline}{#1}}
\newcommand{\course}[1]{\renewcommand{\@course}{#1}}
\newcommand{\institution}[1]{\renewcommand{\@institution}{#1}}
\newcommand{\lecturer}[1]{\renewcommand{\@lecturer}{#1}}
\newcommand{\students}[1]{\renewcommand{\@students}{#1}}
\newcommand{\reportdate}[1]{\renewcommand{\@reportdate}{#1}}
\newcommand{\docversion}[1]{\renewcommand{\@docversion}{#1}}
\newcommand{\shorttitle}[1]{\renewcommand{\@shorttitle}{#1}}

\pagestyle{fancy}\fancyhf{}
\fancyhead[R]{\he{\small\sffamily\leftmark}}
\fancyhead[L]{\he{\small\sffamily\@shorttitle}}
\fancyfoot[C]{\he{\small\sffamily עמוד \thepage{} מתוך \pageref*{LastPage}}}
\fancyfoot[R]{\he{\scriptsize\sffamily\color{gray}\@students}}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0pt}
\renewcommand{\chaptermark}[1]{\markboth{#1}{}}
\fancypagestyle{plain}{\fancyhf{}%
  \fancyfoot[C]{\small\sffamily עמוד \thepage{} מתוך \pageref*{LastPage}}%
  \renewcommand{\headrulewidth}{0pt}}

% עמוד שער: בלי מספר עמוד, עם מסגרת
\newcommand{\makecover}{%
  \begin{titlepage}
  \thispagestyle{empty}%
  \begin{tikzpicture}[remember picture,overlay]
    \draw[acc,line width=2pt] ([xshift=1.2cm,yshift=-1.2cm]current page.north west)
      rectangle ([xshift=-1.2cm,yshift=1.2cm]current page.south east);
  \end{tikzpicture}%
  \centering
  \vspace*{1.0cm}
  {\sffamily\color{acc}\large\@reporttagline\par}\vspace{0.5cm}
  {\sffamily\bfseries\color{ink}\fontsize{40}{46}\selectfont\@reporttitle\par}\vspace{0.4cm}
  {\sffamily\bfseries\color{ink}\LARGE\@reportsubtitle\par}
  \vspace{0.7cm}{\color{acc}\rule{0.6\linewidth}{1.2pt}}\par\vspace{0.7cm}
  \coverlogo\par
  \vfill
  {\renewcommand{\arraystretch}{1.4}%
   \begin{tabular}{@{}r@{\quad}r@{}}
   \textbf{מגישים:} & \@students\\
   \textbf{קורס:} & \@course\\
   \textbf{מרצה:} & \@lecturer\\
   \textbf{מוסד:} & \@institution\\
   \textbf{תאריך:} & \@reportdate\\
   \textbf{גרסת מסמך:} & \@docversion\\
   \end{tabular}\par}
  \vspace{0.8cm}
  {\scriptsize\color{gray}© \num{2026} \@students. כל הזכויות שמורות.\par}
  \vspace*{0.6cm}
  \end{titlepage}}
\newcommand{\coverlogo}{%
  \begin{otherlanguage}{english}\begin{tikzpicture}
  \foreach \i/\c in {0/acc,1/acc!70,2/acc!45,3/acc!25}{
    \draw[line width=2.2pt,\c] (0,0) circle (1.0+0.38*\i);}
  \fill[acc2] (0,0) circle (0.42);
  \draw[white,line width=2.4pt,-{Stealth[length=3pt]}] (-0.2,0.0)--(-0.03,-0.17)--(0.24,0.2);
  \end{tikzpicture}\end{otherlanguage}}

%% ---------------------------------------------------------------------
%% שלב 6: ביבליוגרפיה וקישורים
%% ---------------------------------------------------------------------
\RequirePackage[backend=biber,style=ieee,sorting=none,maxnames=6,autolang=other]{biblatex}
% רשימת המקורות: כותרת בעברית, הרשומות עצמן באנגלית (LTR)
\newcommand{\printreferences}{%
  \chapter*{מקורות}\markboth{מקורות}{מקורות}\addcontentsline{toc}{chapter}{מקורות}%
  \begin{otherlanguage}{english}\printbibliography[heading=none]\end{otherlanguage}}
\setcounter{biburlnumpenalty}{9000}\setcounter{biburllcpenalty}{9000}\setcounter{biburlucpenalty}{9000}
\RequirePackage{xurl}
\RequirePackage[hidelinks,unicode]{hyperref}
\RequirePackage{bookmark}

\endinput
