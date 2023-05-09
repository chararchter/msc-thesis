%Pagaidām pielāgots tikai bakalaura darbam
%Valta un Viktorija modifikācijas
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{LuThesis}[2019/05/16 Lu bakalaura tēžu stils]
\makeatletter
\newcommand{\spacingsize}{1.5} %Mainam atstarpes star rindiņām
\DeclareOption{singlespacing}{\renewcommand{\@spacingsize}{1}}

\newcommand{\@fontsize}{2}
\DeclareOption{12pt}{\renewcommand{\@fontsize}{2}}
\DeclareOption{11pt}{\renewcommand{\@fontsize}{1}}
\DeclareOption{10pt}{\renewcommand{\@fontsize}{0}}
\DeclareOption{twoside}{
\PassOptionsToClass{twoside}{scrreprt}}
 

\DeclareOption*{%
	\InputIfFileExists{\CurrentOption.min}{}{
		\PassOptionsToClass{\CurrentOption}{scrreprt}
	}
}

\ProcessOptions\relax


\if \@fontsize 1
	\PassOptionsToClass{11pt}scrreprt}
\else
	\if \@fontsize 0
		\PassOptionsToClass{10pt}{scrreprt}
	\else
		\PassOptionsToClass{12pt}{scrreprt}
	\fi
\fi

\LoadClass[a4paper,abstract=on,openany, notitlepage]{scrreprt}


% Formatējam lapu
\RequirePackage[inner=3cm,outer=2cm,top=2cm,bottom=2cm,
		includehead,includefoot]{geometry}
\setlength\parindent{1cm}
\RequirePackage{xparse}

% Valodas un fonti
\RequirePackage[utf8]{inputenc}
\RequirePackage{fontspec}
\RequirePackage{csquotes}
\RequirePackage{polyglossia}

% Mērskaitļu un mērvienības
\RequirePackage{siunitx}

% Bibliogrāfija
\RequirePackage[backend=bibtex, sorting=none]{biblatex}

% TODO noņemt ja nestrādā
% \RequirePackage{ulem}

%Mainam header and footer
% \RequirePackage{scrlayer-scrpage}
% \clearpairofpagestyles
% \cfoot*{\pagemark}

% https://tex.stackexchange.com/questions/55698/text-under-a-line#55705
\newcommand\tline[2]{$\underset{\text{\small{#1}}}{\text{\underline{\hspace{#2}}}}$}

%veidojam titillapu
 \renewcommand*{\maketitle}{%
 \begin{titlepage}
 \begin{center}%
   	{\Large \MakeUppercase{LATVIJAS UNIVERSITĀTE} \par}%
   	{\Large \MakeUppercase{Datorikas fakultāte}\par}%
    \end{center}
      \par\vspace*{\fill} % Viss virs šī paliek augšpusē
     \begin{center}   	
     {\Large \textbf{\MakeUppercase{\@title}} \par}%
    \vskip 2em
    {\large {\MakeUppercase{maģistra darbs}}\par}
   \end{center}\par
    \par\vspace*{\fill} % Viss zem šī tiek nobīdīts uz apakšu
 
   \begin{flushleft}
    {%
      {
      Autors: \textbf \@author}\\
      Studenta apliecības Nr.: \studaplnum  \\
      Darba vadītājs: \darbvad\\
      \par}%
    \end{flushleft}
    \par\vspace*{\fill}
   {\centering\large \MakeUppercase{Rīga} \the\year \par}
 \end{titlepage}
\begingroup
  \pagestyle{empty}
  \cleardoublepage
\endgroup
 }


 

%Formatējam virsrakstus
%virsrakstu fontu izmēri
\RequirePackage[runin]{abstract}
\RequirePackage[explicit]{titlesec}
\titleformat{name=\chapter}
  {\normalfont\fontsize{14}{16}\bfseries}{\thechapter. \MakeUppercase{#1}}{0pt}{}
\titleformat{name=\chapter,numberless}
  {\normalfont\fontsize{14}{16}\bfseries}{\MakeUppercase{#1}}{0pt}{}
\titleformat{\section}
  {\normalfont\fontsize{13}{14}\bfseries}{\thesection. #1}{0pt}{}
\titleformat{\subsection}
  {\normalfont\normalsize\bfseries\raggedright}{\thesubsection. #1}{0pt}{}
\titleformat{\subsubsection}
  {\normalfont\normalsize\raggedright}{\thesubsection. #1}{0pt}{}
%virsrakstu atstarpes
\titlespacing*{\chapter}{0pt}{-50pt}{12pt} %pa kreisi, virs virsraksta (\chapter standartā nobīdīts pa 50pt uz leju), aiz virsraksta
\titlespacing*{\section}{0pt}{24pt minus 12pt}{12pt}
\titlespacing*{\subsection}{0pt}{0pt plus 12pt}{6pt plus 6pt}
\titlespacing*{\subsubsection}{0pt}{6ptplus 6pt minus 6pt}{0pt plus 6pt}
% sākt nodaļas jaunā lapā
\let\oldchapter\chapter
\renewcommand{\chapter}{\clearpage\oldchapter}
% renew abstract
\renewenvironment{abstract}{}{\par\medskip}

\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{amsfonts}

% New commands: keywords
\newcommand{\@keywordname}{Keywords:}
\newcommand{\keywords}[1]{\par\addvspace\baselineskip\noindent\textbf{\@keywordname}\enspace\ignorespaces#1}
\providecaptionname{english,british,american}{\@keywordname}{Keywords:}
\providecaptionname{latvian}{\@keywordname}{Atslēgas vārdi:}


	
\RequirePackage{advdate}
\RequirePackage{url}

% Satura rādītāja formatējums
\RequirePackage[titles]{tocloft}
\renewcommand\cftchapfont{\normalsize}
\renewcommand\cftchappagefont{\normalsize}
\renewcommand\cftchapleader{\cftdotfill{\cftdotsep}}
\renewcommand\cftdotsep{0.1}
\setlength{\cftbeforechapskip}{0em}

%\makeatletter
%    % Display uppercase chapters
%    \patchcmd{\l@chapter}{#1}{\MakeUppercase{#1}}{}{}
%\makeatother

	
% Special sections
\newcommand{\specnodala}[1]{\newpage\addcontentsline{toc}{chapter}{#1}\chapter*{#1}}

\renewcommand{\baselinestretch}{1.5}

\RequirePackage{longtable}
\newcommand{\abbrevname}{List of Abbreviations}
\providecaptionname{english,british,american}{\abbrevname}{List of Abbreviations}
\providecaptionname{latvian}{\abbrevname}{Apzīmējumu un saīsinājumu saraksts}
\NewDocumentEnvironment{abbreviations}{ m }{%
	 {\addchap{\abbrevname}}
	\begin{longtable}{#1}
}{%
\end{longtable}
\addtocounter{table}{-1} % Don't count this table as one of the document tables
}

\RequirePackage{indentfirst}
\newcommand{\doi}[1]{\url{http://dx.doi.org/#1}}

% 
% Formatējam tabulas, attēlu nosaukuma izskatu 
\RequirePackage{caption}
\DeclareCaptionFormat{LuTableCaption}{{\raggedleft \textit{#1}\par}{\centering #3\par}}
\DeclareCaptionLabelFormat{LuCaptionLabel}{#2. \MakeLowercase{#1}}
\captionsetup[table]{
	format=LuTableCaption, labelformat=LuCaptionLabel, 
	labelsep=space, singlelinecheck=off, font=small, 
	font=bf, labelfont=normalfont
}
\captionsetup[figure]{
	labelformat=LuCaptionLabel, labelsep=space, 
	font=small, textfont=bf, labelfont=it
}

% Formatējam vienādojumu un lpp atsauces
\RequirePackage{varioref}
\labelformat{page}{(#1)}
\labelformat{equation}{(#1)}

 
 \RequirePackage{mfirstuc}
 %veidojam dokumentālo lapu
 \newcommand*{\makedoklapa}{%
 \newpage
 \thispagestyle{empty}
 % \vspace*{3ex}
 %\begin{center}%
Maģistra darbs „\doktitle” izstrādāts Latvijas Universitātes \dokfak.
  
Ar savu parakstu apliecinu, ka pētījums veikts patstāvīgi, izmantoti tikai tajā norādītie informācijas avoti un iesniegtā darba elektroniskā kopija atbilst izdrukai.

\vspace*{3ex}Autors: \tline{(Autora paraksts un datums)}{8cm}
\vfill

Rekomendēju/nerekomendēju darbu aizstāvēšanai

Darba vadītājs: \tline{(Vadītāja paraksts un datums)}{8cm}
\vfill

Recenzents: \tline{(\recenzents)}{8cm}
\vfill

Darbs iesniegts maģistratūras sekretariātā:
\tline{(Iesniegšanas datums)}{8cm}
\vfill

Ar šo es apliecinu, ka darba elektroniskā versija ir augšupielādēta LU informatīvajā sistēmā.
\vfill

Studiju metodiķis: 
\tline{(Metodiķa paraksts)}{8cm}
\vfill

Darbs aizstāvēts maģistra gala pārbaudījuma komisijas sēdē

\tline{(Darba aizstāvēšanas datums)}{4.5cm} prot. Nr. \makebox[6ex]{\rule{6ex}{0.4pt}}
\vfill

Komisijas sekretārs: \tline{(Sekretāra paraksts)}{8cm}


\vfill
\vfill

 %\end{center}
 }
  \makeatother  
 \endinput
