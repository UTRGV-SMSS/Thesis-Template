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


% Declare some variables to hold the text fields for the preliminary pages

    \newcommand{\Title}[1]{
      \gdef\UTPAField@Title{#1}
      \gdef\UTPAField@UppercaseTitle{\uppercase{#1}}
      \def\UTPAField@UlineTitle{%
        \def\\{\relax}%
        \protected@edef\tmp{\UTPAField@Title}%
        \expandafter\uline\expandafter{\tmp}%
      }
    }
    \newcommand{\AuthorLastFirst}[1]{\gdef\UTPAField@AuthorLastFirst{#1}}
    \newcommand{\Author}[1]{
      \gdef\UTPAField@Author{#1}
      \gdef\UTPAField@UppercaseAuthor{\uppercase{#1}}
    }
    \newcommand{\docname}[1]{\gdef\UTPAField@DocName{#1}}
    \newcommand{\degree}[1]{
      \gdef\UTPAField@Degree{#1}
      \gdef\UTPAField@UppercaseDegree{\uppercase{#1}}
    }
    \newcommand{\degreeabbrev}[1]{\gdef\UTPAField@DegreeAbbrev{#1}}
    \newcommand{\Advisor}[1]{\gdef\UTPAField@Advisor{#1}}
    \newcommand{\AdvisorTitle}[1]{\gdef\UTPAField@AdvisorTitle{#1}}
    \newcommand{\MemberA}[1]{\gdef\UTPAField@MemberA{#1}}
    \newcommand{\MemberATitle}[1]{\gdef\UTPAField@MemberATitle{#1}}
    \newcommand{\MemberB}[1]{\gdef\UTPAField@MemberB{#1}}
    \newcommand{\MemberC}[1]{\gdef\UTPAField@MemberC{#1}}
    \newcommand{\MemberD}[1]{\gdef\UTPAField@MemberD{#1}}
    \newcommand{\MemberE}[1]{\gdef\UTPAField@MemberE{#1}}
    \newcommand{\Month}[1]{\gdef\UTPAField@Month{#1}}
    \newcommand{\Year}[1]{\gdef\UTPAField@Year{#1}}
    \newcommand{\Abstract}[1]{\gdef\UTPAField@Abstract{#1}}
    \newcommand{\Dedication}[1]{\gdef\UTPAField@Dedication{#1}}
    \newcommand{\Acknowledgments}[1]{\gdef\UTPAField@Acknowledgments{#1}}
    \newcommand{\BiographicalSketch}[1]{\gdef\UTPAField@BiographicalSketch{#1}}
    \newcommand{\Major}[1]{\gdef\UTPAField@Major{#1}}

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

% define a command to insert a blank page
        \newcommand{\insertblankpage}{%
          \newpage
          \thispagestyle{empty}
          \mbox{}
        \addtocounter{page}{-1}
          \newpage
        }


    \newcommand{\chapterappendixname}[1]{\gdef\UTPAField@ChapterAppendixName{#1}}
    \chapterappendixname{CHAPTER~}

% Define the preliminary page layouts using the variables

    \newcommand{\utpatitlepage}{%
        \newgeometry{top=2in, bottom=1in, left=1in, right=1in}
        \thispagestyle{empty}
        {\centering
          \doublespacing
        \UTPAField@UppercaseTitle
        \singlespacing
        \vfill  % provides equal spacing
        A \UTPAField@DocName \\
        \vspace{\baselineskip}
        by \\
        \vspace{\baselineskip}
        \UTPAField@UppercaseAuthor\\
        \vfill  % provides equal spacing
        Submitted to the Graduate School of\\
        The University of Texas Rio Grande Valley\\
        In partial fulfillment of the requirements for the degree of\\
        \vspace{\baselineskip}
        \UTPAField@UppercaseDegree\\
        \vspace{7\baselineskip}  % skip 7 lines
        \UTPAField@Month~\UTPAField@Year\\
        \vspace{4\baselineskip}  % skip 4 lines
        Major Subject: \UTPAField@Major
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
            {\UTPAField@UppercaseTitle}\par
        \singlespacing
        \vspace{\baselineskip}
        A \UTPAField@DocName \\
        by \\
        \UTPAField@UppercaseAuthor\\
        \vfill
        \uppercase{Committee Members} \\
        \vfill
        \UTPAField@Advisor\\
        \UTPAField@AdvisorTitle\\
        \vfill
        \if \UTPAField@MemberA \relax \relax \else \mbox{\UTPAField@MemberA}\\
                \UTPAField@MemberATitle \\
                \vfill
        \fi
        \if \UTPAField@MemberB \relax \relax \else \mbox{\UTPAField@MemberB}\\
                Committee Member\\
                \vfill
        \fi
        \if \UTPAField@MemberC \relax \relax \else \mbox{\UTPAField@MemberC}\\
                Committee Member\\
                \vfill
        \fi
        \if \UTPAField@MemberD \relax \relax \else \mbox{\UTPAField@MemberD}\\
                Committee Member\\
                \vfill
        \fi
        \if \UTPAField@MemberE \relax \relax \else \mbox{\UTPAField@MemberE}\\
                Committee Member\\
                \vfill
        \fi
        \mbox{\UTPAField@Month~\UTPAField@Year} \\
        \par
      }
        \restoregeometry
        \insertblankpage
      }

    \newcommand{\copyrightpage}{%
        \newgeometry{top=0in, bottom=0in, left=1in, right=1in}
        \thispagestyle{empty}
        \mbox{}  % empty box
        \vfill
        {\centering%
        Copyright~\UTPAField@Year~\UTPAField@Author \\
        All Rights Reserved
        \par
        }
        \vfill


        \restoregeometry
        \insertblankpage
    }

    \newcommand{\abstractpage}{%
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
          \UTPAField@AuthorLastFirst,
          \UTPAField@UlineTitle.
          \UTPAField@Degree~\UTPAField@DegreeAbbrev,
          \UTPAField@Month,~\UTPAField@Year,
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
          \total{citesnum}~references,
          \total{bibnum}~titles.

        \UTPAField@Abstract\par
      }

        \vfill

        \restoregeometry
        \insertblankpage
    }


    \newcommand{\dedicationpage}{%
      \if \UTPAField@Dedication
       \relax
      \else
        \newgeometry{top=2in, bottom=1in, left=1in, right=1in}
        \thispagestyle{fancy}
        \singlespacing
        {\centering
        DEDICATION
        \par}
      \vspace{2\baselineskip}
         \small\normalsize%
        \addcontentsline{toc}{chapter}{Dedication}
          \doublespacing
        {\setlength{\parindent}{0.5in}
        \UTPAField@Dedication
      }
        \restoregeometry
        \insertblankpage
      \fi
        }


    \newcommand{\biographypage}{%
        \newgeometry{top=2in, bottom=1in, left=1in, right=1in}
        \thispagestyle{fancy}
        \singlespacing
        {\centering
        BIOGRAPHICAL SKETCH
        \par}
      \vspace{2\baselineskip}
         \small\normalsize%
        \addcontentsline{toc}{chapter}{Biographical Sketch}
          \doublespacing
        {\setlength{\parindent}{0.5in}
        \UTPAField@BiographicalSketch
      }

        \par\renewcommand{\baselinestretch}{1} \small\normalsize%
        \restoregeometry
        }

    \newcommand{\acknowledgmentspage}{%
      \if \UTPAField@Acknowledgments
        \relax
      \else
        \newgeometry{top=2in, bottom=1in, left=1in, right=1in}
        \thispagestyle{fancy}
        \singlespacing
        {\centering%
        ACKNOWLEDGMENTS\\
        \vspace{\baselineskip}
        \par
        }
        \addcontentsline{toc}{chapter}{Acknowledgments}
        {\setlength{\parindent}{0.5in}
        \doublespacing
        \UTPAField@Acknowledgments\par
      }
        \restoregeometry
        \insertblankpage
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
    \LoadClass[letterpaper,12pt, oneside]{book}

\renewcommand{\contentsname}{TABLE OF CONTENTS}
\renewcommand\listfigurename{LIST OF FIGURES}
\renewcommand\listtablename{LIST OF TABLES}
\renewcommand{\bibname}{BIBLIOGRAPHY}


% Set the margins to UTPA specifications

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
      \providecommand\phantomsection{} \phantomsection
      \addcontentsline{toc}{chapter}{Table of Contents}
      \singlespacing
      \TEMPtableofcontents
      \doublespacing
        \thispagestyle{fancy}
        \restoregeometry
        \insertblankpage
    }

 %Redefine the List of Figures to deal with some blank page
 %and bookmarking issues
    \let\TEMPlistoffigures\listoffigures
    \renewcommand{\listoffigures}{%
      \providecommand\phantomsection{} \phantomsection
      \addcontentsline{toc}{chapter}{List of Figures}
      \singlespacing
        \newgeometry{top=2in, bottom=1in, left=0.75in, right=1in}
      \TEMPlistoffigures
      \doublespacing
        \thispagestyle{fancy}
        \restoregeometry
        \insertblankpage
    }

 %Redefine the List of Tables to deal with some blank page
 %and bookmarking issues
    \let\TEMPlistoftables\listoftables
    \renewcommand{\listoftables}{%
      \providecommand\phantomsection{} \phantomsection
      \addcontentsline{toc}{chapter}{List of Tables}
      \singlespacing
        \newgeometry{top=2in, bottom=1in, left=0.75in, right=1in}
      \TEMPlistoftables
      \doublespacing
        \thispagestyle{fancy}
        \restoregeometry
        \insertblankpage
    }

 %Redefine the Bibliography to deal with a bookmarking issues
    \let\TEMPbibliography\bibliography
    \renewcommand{\bibliography}{%
      \clearpage
      \providecommand\phantomsection{} \phantomsection
      \addcontentsline{toc}{chapter}{Bibliography}
      \restoregeometry % restore geometry that was modified by appendix
      \TEMPbibliography
    }


% Define the macro for making preliminary pages
    \newcommand{\makepreliminarypages}{%
      % We insert the pages heres and adjust spacing and geometry
        \utpatitlepage
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
\RequirePackage{calc}  % load this for the \widthof command
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

\addtocontents{toc}{~\hfill{Page}\par}
\addtocontents{lof}{~\hfill{Page}\par}
\addtocontents{lot}{~\hfill{Page}\par}

% These add the words Figure or Table before entries in List of Figures/Tables
\renewcommand{\cftfigfont}{Figure }
\renewcommand{\cfttabfont}{Table }


% This macro redefines the \chapter command to
% count figures and tables before the counters are cleared
% http://tex.stackexchange.com/questions/60505/custom-chapter-definition
\renewcommand{\chaptername}{CHAPTER}
%% This was copied and modified from book.cls
\renewcommand\chapter{%
  \addtocounter{tablenum}{\value{table}}
  \addtocounter{figurenum}{\value{figure}}
  \if@openright\cleardoublepage\else\clearpage\fi
  \thispagestyle{plain}%
  \global\@topnum\z@
  \@afterindentfalse
  \secdef\@chapter\@schapter
}

%% This was copied and modified from book.cls
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                       \if@mainmatter
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
                         \addcontentsline{toc}{chapter}%
                                   {\UTPAField@ChapterAppendixName\thechapter~#1}%
                       \else
                         \addcontentsline{toc}{chapter}{#1}%
                       \fi
                    \else
                      \addcontentsline{toc}{chapter}{#1}%
                    \fi
                    \chaptermark{#1}%
                    \@makechapterhead{\uppercase{#2}}%
                    \@afterheading
                    }


% The following creates blank page before a chapter header
\def\@makeappendixhead#1{%
  \newpage
  \newgeometry{top=0in, bottom=0in, left=1in, right=1in}
  \mbox{}
  {\centering
    \vfill
    \normalsize
         APPENDIX\space \thechapter \par
    \vfill
    \newpage

    \vspace*{0.5in}
    APPENDIX\space \thechapter \par
    \vspace{\baselineskip}
    \uppercase{#1}\par\nobreak
    \vspace{\baselineskip}
  }
}

\g@addto@macro\appendix{%
  % The following redefines the chapter header
  \chapterappendixname{APPENDIX~}
\let\@makechapterhead\@makeappendixhead
  % The following fixes the prefix for appendices in TOC
  \addtocontents{toc}{%
    \protect\renewcommand{\protect\cftchappresnum}{\appendixname\space}%
  }%
}

% this package is used to style the chapter, section, and subsection headings
%\RequirePackage[sc,center,tiny,compact]{titlesec}
\RequirePackage[center,tiny,compact,uppercase]{titlesec}

\titleformat{\chapter}[display]{\filcenter}
{%
{\chaptertitlename}~\Roman{chapter} \vspace{0.75\baselineskip}
}
{0in}{}[]
\titlespacing{\chapter}{0in}{0.625in}{0.75\baselineskip}

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
\renewcommand\thechapter{\Roman{chapter}.}
\renewcommand\thesection{\arabic{chapter}.\arabic{section}}
\renewcommand\theequation{\arabic{chapter}.\arabic{equation}}
\renewcommand\thefigure{\arabic{chapter}.\arabic{figure}}
\renewcommand\thetable{\arabic{chapter}.\arabic{table}}
