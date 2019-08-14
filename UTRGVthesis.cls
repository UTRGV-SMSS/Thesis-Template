 \NeedsTeXFormat{LaTeX2e}
 \ProvidesClass{UTRGVthesis}[2016/09/01 UTRGV Theses and Dissertations]

% The UTRGVthesis class is for producing theses and dissertations
% that meet the UTRGV requirements.
%
% The following class options are available
%
%   masters   : Produces the masters thesis preliminary pages
%   phd   : Produces the phd dissertation preliminary pages
%   noacknowledgments : Removes the acknowledgments page
%   nodedication: Removes the dedication page


% These packages typeset the thesis with Times Roman font
\RequirePackage{mathptmx}
\RequirePackage[T1]{fontenc}

\RequirePackage{amsmath}  % for ams mathematical environments
\RequirePackage[letterpaper]{geometry} % for fixing margins
\RequirePackage{indentfirst}  % for indention of first paragraph
\RequirePackage{graphicx} % Allow the inclusion of graphics
\RequirePackage{setspace} % Allow double spacing with the \doublespacing
\RequirePackage{calc}


% Declare some variables to hold the text fields for the preliminary pages

    \newcommand{\Title}[1]{
      \gdef\UTRGVField@Title{#1}
      \gdef\UTRGVField@UppercaseTitle{\uppercase{#1}}
      \def\UTRGVField@UlineTitle{%
        \def\\{\relax}%
        \protected@edef\tmp{\UTRGVField@Title}%
        \expandafter\uline\expandafter{\tmp}%
      }
    }
    \newcommand{\AuthorLastFirst}[1]{\gdef\UTRGVField@AuthorLastFirst{#1}}
    \newcommand{\Author}[1]{
      \gdef\UTRGVField@Author{#1}
      \gdef\UTRGVField@UppercaseAuthor{\uppercase{#1}}
    }
    \newcommand{\docname}[1]{\gdef\UTRGVField@DocName{#1}}
    \newcommand{\degree}[1]{
      \gdef\UTRGVField@Degree{#1}
      \gdef\UTRGVField@UppercaseDegree{\uppercase{#1}}
    }
    \newcommand{\degreeabbrev}[1]{\gdef\UTRGVField@DegreeAbbrev{#1}}
    \newcommand{\Advisor}[1]{\gdef\UTRGVField@Advisor{#1}}
    \newcommand{\AdvisorTitle}[1]{\gdef\UTRGVField@AdvisorTitle{#1}}
    \newcommand{\MemberA}[1]{\gdef\UTRGVField@MemberA{#1}}
    \newcommand{\MemberATitle}[1]{\gdef\UTRGVField@MemberATitle{#1}}
    \newcommand{\MemberB}[1]{\gdef\UTRGVField@MemberB{#1}}
    \newcommand{\MemberC}[1]{\gdef\UTRGVField@MemberC{#1}}
    \newcommand{\MemberD}[1]{\gdef\UTRGVField@MemberD{#1}}
    \newcommand{\MemberE}[1]{\gdef\UTRGVField@MemberE{#1}}
    \newcommand{\MemberF}[1]{\gdef\UTRGVField@MemberF{#1}}
    \newcommand{\MemberG}[1]{\gdef\UTRGVField@MemberG{#1}}
    \newcommand{\MemberH}[1]{\gdef\UTRGVField@MemberH{#1}}
    \newcommand{\Month}[1]{\gdef\UTRGVField@Month{#1}}
    \newcommand{\Year}[1]{\gdef\UTRGVField@Year{#1}}
    \newcommand{\Abstract}[1]{\gdef\UTRGVField@Abstract{#1}}
    \newcommand{\Dedication}[1]{\gdef\UTRGVField@Dedication{#1}}
    \newcommand{\Acknowledgments}[1]{\gdef\UTRGVField@Acknowledgments{#1}}
    \newcommand{\BiographicalSketch}[1]{\gdef\UTRGVField@BiographicalSketch{#1}}
    \newcommand{\Major}[1]{\gdef\UTRGVField@Major{#1}}

% Initialize the variables to their default values

    \Title{Titles Must Be in Mixed Case and May Not Exceed Six Inches}
    \docname{Thesis}
    \degree{Master of Science}
    \degreeabbrev{(MS)}
    \AdvisorTitle{Chair of Committee}
    \MemberA{}
    \MemberATitle{Committee Member}
    \MemberB{}
    \MemberC{}
    \MemberD{}
    \MemberE{}
    \MemberF{}
    \MemberG{}
    \MemberH{}

% define a command to insert a blank page
        \newcommand{\insertblankpage}{%
          \newpage
          \thispagestyle{empty}
          \mbox{}
        \addtocounter{page}{-1}
          \newpage
        }


% Use to keep track of many pages in TOC, LOT, TOC, abstract, dedication
\newcounter{pagebegin}
\newcounter{pagedifference}



% Define the preliminary page layouts using the variables

    \newcommand{\utrgvtitlepage}{%
        \newgeometry{top=2in, bottom=1in, left=1in, right=1in}
        \thispagestyle{empty}
        {\centering
          \doublespacing
        \UTRGVField@UppercaseTitle\par
        \singlespacing
        \vfill  % provides equal spacing
        A \UTRGVField@DocName \\
        \vspace{\baselineskip}
        by \\
        \vspace{\baselineskip}
        \UTRGVField@UppercaseAuthor\\
        \vfill  % provides equal spacing
        Submitted to the Graduate College of\\
        The University of Texas Rio Grande Valley\\
        In partial fulfillment of the requirements for the degree of\\
        \vspace{\baselineskip}
        \UTRGVField@UppercaseDegree\\
        \vspace{7\baselineskip}  % skip 7 lines
        \UTRGVField@Month~\UTRGVField@Year\\
        \vspace{4\baselineskip}  % skip 4 lines
        Major Subject: \UTRGVField@Major
        \par}
      \restoregeometry
        \insertblankpage
        \addtocounter{page}{-1}  % don't increment page counter for this page
      }

    \newcommand{\committeepage}{%
        \newgeometry{top=2in, bottom=1in, left=1in, right=1in}
        \thispagestyle{empty}
        \singlespacing
        {\centering
        \doublespacing
            {\UTRGVField@UppercaseTitle}\par
        \singlespacing
        \vspace{\baselineskip}
        A \UTRGVField@DocName \\
        by \\
        \UTRGVField@UppercaseAuthor\\
        \vfill
        \uppercase{Committee Members} \\
        \vfill
        \UTRGVField@Advisor\\
        \UTRGVField@AdvisorTitle\\
        \vfill
        \if \UTRGVField@MemberA \relax \relax \else \mbox{\UTRGVField@MemberA}\\
                \UTRGVField@MemberATitle \\
                \vfill
        \fi
        \if \UTRGVField@MemberB \relax \relax \else \mbox{\UTRGVField@MemberB}\\
                Committee Member\\
                \vfill
        \fi
        \if \UTRGVField@MemberC \relax \relax \else \mbox{\UTRGVField@MemberC}\\
                Committee Member\\
                \vfill
        \fi
        \if \UTRGVField@MemberD \relax \relax \else \mbox{\UTRGVField@MemberD}\\
                Committee Member\\
                \vfill
        \fi
        \if \UTRGVField@MemberE \relax \relax \else \mbox{\UTRGVField@MemberE}\\
                Committee Member\\
                \vfill
        \fi
        \if \UTRGVField@MemberF \relax \relax \else \mbox{\UTRGVField@MemberF}\\
                Committee Member\\
                \vfill
        \fi
        \if \UTRGVField@MemberG \relax \relax \else \mbox{\UTRGVField@MemberG}\\
                Committee Member\\
                \vfill
        \fi
        \if \UTRGVField@MemberH \relax \relax \else \mbox{\UTRGVField@MemberH}\\
                Committee Member\\
                \vfill
        \fi
        \mbox{\UTRGVField@Month~\UTRGVField@Year} \\
        \vspace{5\baselineskip}  % skip 5 lines to line up with previous page
        \par
      }
        \restoregeometry
        \insertblankpage
      }

    \newcommand{\copyrightpage}{%
        \newgeometry{top=0in, bottom=0in, left=1in, right=1in}
        \thispagestyle{empty}
        \mbox{}  % empty box
        {\centering%
        \vfill
        \doublespacing
        Copyright~\UTRGVField@Year~\UTRGVField@Author \\
        All Rights Reserved\\
        \vspace{10pt}  % moves up text to center
        \vfill
        \singlespacing
        \par
        }


        \restoregeometry
        \insertblankpage
    }

    \newcommand{\abstractpage}{%
        \setcounter{pagebegin}{\value{page}} %get value of first page
        \newgeometry{top=2in, bottom=1in, left=1in, right=1in}
        \thispagestyle{fancy}
        {\centering%
        ABSTRACT\\
        \vspace{\baselineskip}
        \par
        }
        \addcontentsline{toc}{chapter}{Abstract}
        \doublespacing
        {\setlength{\parindent}{0.5in}
          \noindent
          \UTRGVField@AuthorLastFirst,
          \UTRGVField@UlineTitle.
          \UTRGVField@Degree~\UTRGVField@DegreeAbbrev,
          \UTRGVField@Month,~\UTRGVField@Year,
          \pageref{LastPage}~pp.,
          \ifnum \totvalue{tablenum}=0
             \relax \relax
          \else
            {\ifnum\totvalue{tablenum}=1  \total{tablenum}~table,\else
              \total{tablenum}~tables,\fi}
          \fi
          \ifnum \totvalue{figurenum}=0
             \relax \relax
          \else
            {\ifnum\totvalue{figurenum}=1 \total{figurenum}~figure,\else
              \total{figurenum}~figures,\fi}
          \fi
          \total{bibnum}~references.

        \UTRGVField@Abstract\par
      }

        \vfill

        \restoregeometry
        % keep track of pages
        \setcounter{pagedifference}{\value{pagebegin} - \value{page}}
        \ifodd \value{pagedifference}
          \insertblankpage % insert blank page only if odd number of pages
        \fi
    }


    \newcommand{\dedicationpage}{%
      \if \UTRGVField@Dedication
       \relax
      \else
        \setcounter{pagebegin}{\value{page}} %get value of first page
        \newgeometry{top=2in, bottom=1in, left=1in, right=1in}
        \thispagestyle{fancy}
        {\centering
        DEDICATION
        \par}
      \vspace{\baselineskip}
         \small\normalsize%
        \addcontentsline{toc}{chapter}{Dedication}
        {\setlength{\parindent}{0.5in}
          \doublespacing
        \UTRGVField@Dedication
      }
        \restoregeometry
        % keep track of pages
        \setcounter{pagedifference}{\value{pagebegin} - \value{page}}
        \ifodd \value{pagedifference}
          \insertblankpage % insert blank page only if odd number of pages
        \fi
      \fi
        }


    \newcommand{\biographypage}{%
      \inappendixfalse
      \chapter*{BIOGRAPHICAL SKETCH}
        \addcontentsline{toc}{chapter}{Biographical Sketch}
          \doublespacing
        {\setlength{\parindent}{0.5in}
        \UTRGVField@BiographicalSketch
      }

        \par\renewcommand{\baselinestretch}{1} \small\normalsize%
        \restoregeometry
        }

    \newcommand{\acknowledgmentspage}{%
      \if \UTRGVField@Acknowledgments
       \relax
      \else
        \setcounter{pagebegin}{\value{page}} %get value of first page
        \newgeometry{top=2in, bottom=1in, left=1in, right=1in}
        \thispagestyle{fancy}
        {\centering
          ACKNOWLEDGMENTS
        \par}
      \vspace{\baselineskip}
         \small\normalsize%
         \addcontentsline{toc}{chapter}{Acknowledgments}
        {\setlength{\parindent}{0.5in}
          \doublespacing
          \UTRGVField@Acknowledgments
      }
        \restoregeometry
        % keep track of pages
        \setcounter{pagedifference}{\value{pagebegin} - \value{page}}
        \ifodd \value{pagedifference}
          \insertblankpage % insert blank page only if odd number of pages
        \fi
      \fi
        }



% Allow opt-out on acknowledgments
    \DeclareOption{noacknowledgments}{%
      \renewcommand{\acknowledgmentspage}{}
    }

% Allow opt-out on dedication
    \DeclareOption{nodedication}{%
      \renewcommand{\dedicationpage}{}
    }


    \DeclareOption{masters}{%
      \degree{Master of Science}
      \degreeabbrev{(MS)}
      \docname{Thesis}
      \AdvisorTitle{Chair of Committee}
    }

    \DeclareOption{phd}{%
      \degree{Doctor of Philosophy}
      \degreeabbrev{(PhD)}
      \docname{Dissertation}
      \AdvisorTitle{Chair}
    }



% Load the class and needed packages
    \DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
    \ProcessOptions
    \relax
    \LoadClass[letterpaper,12pt,oneside]{book}

\renewcommand{\contentsname}{TABLE OF CONTENTS\vspace{-0.20in}}
\renewcommand\listfigurename{LIST OF FIGURES\vspace{-0.20in}}
\renewcommand\listtablename{LIST OF TABLES\vspace{-0.20in}}
\renewcommand{\bibname}{BIBLIOGRAPHY}


% Set the margins to UTRGV specifications

\geometry{top=1in, bottom=1in, left=1in, right=1in}
   \setlength{\parindent}{0.5in}
    \raggedbottom


% Uncomment these to allow allow more liberal figure placement
    %\renewcommand{\topfraction}{0.9}
    %\renewcommand{\bottomfraction}{0.8}
    %\setcounter{topnumber}{2}
    %\setcounter{bottomnumber}{2}
    %\setcounter{totalnumber}{4}
    %\renewcommand{\textfraction}{0.07}


% Redefine the Table of Contents to deal with some blank page
% and bookmarking issues relating to ETD submission
    \let\TEMPtableofcontents\tableofcontents
    \renewcommand{\tableofcontents}{%
      \setcounter{pagebegin}{\value{page}} %get value of first page in TOC
      \providecommand\phantomsection{} \phantomsection
      \addcontentsline{toc}{chapter}{Table of Contents}
      \singlespacing
      % top margin should be 2inches
      \newgeometry{top=1.125in, bottom=1in, left=1in, right=1in}
      \TEMPtableofcontents
      \doublespacing
        \thispagestyle{fancy}
        \restoregeometry

      % keep track of pages in TOC
      \setcounter{pagedifference}{\value{pagebegin} - \value{page}}
      \ifodd \value{pagedifference}
        \insertblankpage % insert blank page only if odd number of pages
        \fi
    }

 %Redefine the List of Figures to deal with some blank page
 %and bookmarking issues
    \let\TEMPlistoffigures\listoffigures
    \renewcommand{\listoffigures}{%
      \setcounter{pagebegin}{\value{page}} %get value of first page in LOF
      \providecommand\phantomsection{} \phantomsection
      \addcontentsline{toc}{chapter}{List of Figures}
      \singlespacing
        \newgeometry{top=1.125in, bottom=1in, left=1in, right=1in}
      \TEMPlistoffigures
      \doublespacing
        \thispagestyle{fancy}
        \restoregeometry

      % keep track of pages
      \setcounter{pagedifference}{\value{pagebegin} - \value{page}}
      \ifodd \value{pagedifference}
        \insertblankpage % insert blank page only if odd number of pages
      \fi
    }

 %Redefine the List of Tables to deal with some blank page
 %and bookmarking issues
    \let\TEMPlistoftables\listoftables
    \renewcommand{\listoftables}{%
      \setcounter{pagebegin}{\value{page}} %get value of first page in LOT
      \providecommand\phantomsection{} \phantomsection
      \addcontentsline{toc}{chapter}{List of Tables}
        \newgeometry{top=1.125in, bottom=1in, left=1in, right=1in}
      \singlespacing
      \TEMPlistoftables
      \doublespacing
        \thispagestyle{fancy}
        \restoregeometry

      % keep track of pages
      \setcounter{pagedifference}{\value{pagebegin} - \value{page}}
      \ifodd \value{pagedifference}
        \insertblankpage % insert blank page only if odd number of pages
      \fi
    }

 %Redefine the Bibliography to deal with a bookmarking issues
    \let\TEMPbibliography\bibliography
    \renewcommand{\bibliography}{%
      \let\TEMPvspace\vspace
      \renewcommand{\vspace}[1]{\relax}
      \clearpage
      \providecommand\phantomsection{} \phantomsection
      \addcontentsline{toc}{chapter}{\bibname}
      \inappendixfalse
      \let\vspace\TEMPvspace
      \TEMPbibliography
    }


% Define the macro for making preliminary pages
    \newcommand{\makepreliminarypages}{%
      % We insert the pages heres and adjust spacing and geometry
        \utrgvtitlepage
        \committeepage
        \copyrightpage
        \abstractpage
        \dedicationpage
        \acknowledgmentspage
         \setlength{\parindent}{0.5in}
    }



% The fancyhdr package allows you to easily customize the page header.
% The settings below produce a nice, well separated header.
\RequirePackage{fancyhdr}
\fancyhead{}
\renewcommand{\headrulewidth}{0pt}
  \pagestyle{fancy}



%%%% tips from http://texblog.org/2011/09/09/10-ways-to-customize-tocloflot/
%% Control the fonts and formatting used in the table of contents.
\RequirePackage[titles]{tocloft}
\RequirePackage{etoolbox}  % for \patchcmd

\patchcmd{\l@chapter}  % patch command provided by tocloft
  {\cftchapfont #1}%   search pattern
  {\uppercase{#1}}% replace by
  {}%                  success
  {}%                  failure

\renewcommand{\cftchappagefont}{\normalfont}
\renewcommand{\cftchapleader}{\cftdotfill{2.6}} % Add Table of Contents dots


%% Aesthetic spacing redefines that look nicer to me than the defaults.
%% this applies to table of contents
\setlength{\cftbeforechapskip}{1ex}
\setlength{\cftbeforesecskip}{1ex}
\setlength{\cftbeforesubsecskip}{1ex}
\renewcommand\cftfigafterpnum{\vskip5pt\par}
\renewcommand\cfttabafterpnum{\vskip5pt\par}

\addtocontents{toc}{\vspace{\baselineskip}~\hfill{Page}\par\vspace{2mm}}
\addtocontents{lof}{\vspace{\baselineskip}~\hfill{Page}\par\vspace{2mm}}
\addtocontents{lot}{\vspace{\baselineskip}~\hfill{Page}\par\vspace{2mm}}

% These add the words Figure or Table before entries in List of Figures/Tables
\renewcommand{\cftfigfont}{\hspace{-17pt}Figure } % fix margin of lof
\renewcommand{\cfttabfont}{\hspace{-17pt}Table } % fix margin of lot


% These add a colon after entries in List of Figures/Tables
\renewcommand{\cftfigaftersnum}{:}
\renewcommand{\cfttabaftersnum}{:}


\newcommand{\resetchapterspacing}[1]{
  \titlespacing{\chapter}
    {0in} % increases the left margin
    {#1} % vertical space before the title
    {.75\baselineskip} % separation between title and text
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  creates a boolean that indicates whether we are in appendix mode
\newif\ifinappendix

\let\TEMPappendix\appendix
\renewcommand{\appendix}{%
  \renewcommand\thefigure{\Alph{chapter}.\arabic{figure}}
  \inappendixtrue
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \gdef\@chapapp{APPENDIX}%
  \gdef\thechapter{\@Alph\c@chapter}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This macro redefines the \chapter command to
% count figures and tables before the counters are cleared
% http://tex.stackexchange.com/questions/60505/custom-chapter-definition
\renewcommand{\chaptername}{CHAPTER}
%% This was copied and modified from book.cls
\renewcommand\chapter{%
  \addtocounter{tablenum}{\value{table}}
  \addtocounter{figurenum}{\value{figure}}
  \setcounter{figure}{0}
  \setcounter{table}{0}
  \if@openright\cleardoublepage\else\clearpage\fi
  \thispagestyle{fancy}%
  \global\@topnum\z@
  \@afterindentfalse
  \ifinappendix % checks to see if appendix
    \preappendix  % inserts appendix prepage
  \fi
  \secdef\@chapter\@schapter
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  creates blank page with the APPENDIX A before appendix
\newcounter{appendixtracker}

\newcommand\preappendix{
  \setcounter{appendixtracker}{\value{chapter}} % captures chapter counter
  \stepcounter{appendixtracker} % uses correct chapter counter before it is set
  \newpage
  \thispagestyle{fancy}%
  \mbox{}  % empty box
  {\centering%
  \vfill
  APPENDIX~\Alph{appendixtracker}
  \vspace{1.25\baselineskip}
  \vfill
  \par
  }
  \newpage
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% This was copied and modified from book.cls
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                       \if@mainmatter
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
                         \ifinappendix  %% omits appendix title from TOC
                           \addcontentsline{toc}{chapter}%
                             {APPENDIX~\Alph{chapter}}%
                         \else
                           \addcontentsline{toc}{chapter}%
                             {CHAPTER~\Roman{chapter}.~#1}%
                         \fi
                       \else
                         \addcontentsline{toc}{chapter}{#1}%
                       \fi
                    \else
                      \addcontentsline{toc}{chapter}{#1}%
                    \fi
                    \chaptermark{#1}%
                    \@makechapterhead{\uppercase{#2}}%
                    \@afterheading
                    \doublespacing
                    }


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% This was copied and modified from book.cls
\renewenvironment{thebibliography}[1]
      {\doublespacing
      \chapter*{\bibname}%
      \singlespacing
      \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
      \vspace{-42pt}  % makes space between title and text zero
      \vspace{2\baselineskip}  % add two blank line spaces
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% this package is used to style the chapter, section, and subsection headings
%\RequirePackage[sc,center,tiny,compact]{titlesec}
\RequirePackage[center,tiny,compact,uppercase]{titlesec}


\titleformat{\chapter}
  [display] % shape
  {\filcenter} % format
  {{\chaptertitlename}~\thechapter} %label
  {0.75\baselineskip} % separation between label and title body
  {} % code preceding the title body
  [] % code following the title body

\titlespacing*{\chapter}
  {0in} % increases the left margin
  {0.625in} % the vertical space before the title
  {0.75\baselineskip} % the separation between title and text

\titleformat{\section}[block]
  {\bfseries\filcenter}
  {\arabic{chapter}.\arabic{section}~~}
  {0in}
  {}
  []

\titleformat{\subsection}[block]
  {\normalfont\bfseries}
  {\thesubsection~}{0in}{\bfseries}

\titleformat{\subsubsection}[runin]
  {\normalfont\bfseries}
  {}{0in}{\indent}[]

\titleformat{\paragraph}[runin]
  {\normalfont\bfseries\itshape}
  {}{0in}{\indent}[]

% load more packages
\RequirePackage[normalem]{ulem} % for underlining command \uline
\RequirePackage{totcount} % for citation and reference counts
\RequirePackage{lastpage} % to get the number of pages

\newtotcounter{tablenum}  % counter for counting tables
\newtotcounter{figurenum} % counter for counting figures

\newtotcounter{citesnum} % counter for counting citations
\def\oldcite{} \let\oldcite=\cite
\def\cite{\stepcounter{citesnum}\oldcite}

\newtotcounter{bibnum} % counter for counting titles in bibliography
\def\oldbibitem{} \let\oldbibitem=\bibitem
\def\bibitem{\stepcounter{bibnum}\oldbibitem}


% Change numbering style of chapters to Roman.  Keep Arabic for subsections
\renewcommand\thechapter{\Roman{chapter}}
\renewcommand\thesection{\arabic{chapter}.\arabic{section}}
\renewcommand\theequation{\arabic{chapter}.\arabic{equation}}
\renewcommand\thefigure{\arabic{chapter}.\arabic{figure}}
\renewcommand\thetable{\arabic{chapter}.\arabic{table}}


\newcommand{\margins}{%
  \ifdefined \tikz
    \relax
  \else
    \usepackage{tikz}
  \fi
    \usetikzlibrary{calc}
    \newcommand{\marginguides}{% For a logo drawn with TikZ
    \begin{tikzpicture}[remember picture,overlay,yscale=-1]
        \fill [fill=gray!10,line width=0pt] (0in,11in) rectangle (8.5in, 5.5in);
        \fill [fill=gray!20,line width=0pt] (7.5in,0in) rectangle (8.5in, 11in);
        \fill [fill=gray!20,line width=0pt] (7.5in,0in) rectangle (8.5in, 11in);
        \fill [fill=gray!20,line width=0pt] (0in,0in) rectangle (1in, 11in);
        \fill [fill=gray!30,line width=0pt] (0in,2in) rectangle (8.5in, 1in);
        \fill [fill=gray!30,line width=0pt] (0in,11in) rectangle (8.5in, 10in);
     \end{tikzpicture}%
   }

    \newcommand{\hhbar}[2]{% For a logo drawn with TikZ
    \begin{tikzpicture}[remember picture,overlay,yscale=-1]
      \fill [fill=blue!20,line width=0pt] (0in,##1) rectangle (8.5in,##1 + ##2);
    \end{tikzpicture}%
   }
    \usepackage[all]{background}
    \SetBgPosition{current page.north west}% Select location
    \SetBgOpacity{1.0}% Select opacity
    \SetBgAngle{0.0}% Select roation of logo
    \SetBgScale{1.0}% Select scale factor of logo
    \SetBgContents{%
      \hhbar{156pt}{1cm}%
      \hhbar{200pt}{1cm}%
      \marginguides%
    }%
}
