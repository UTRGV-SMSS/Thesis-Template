 \NeedsTeXFormat{LaTeX2e}
 \ProvidesClass{UTPAthesis}[2013/12/14 UTPA Theses and Dissertations]

% The UTPAthesis class is for producing theses and dissertations
% that meet the UTPA requirements.
%
% The following class options are available
%
%   masters   : Produces the masters thesis preliminary pages
%   phd   : Produces the phd dissertation preliminary pages
%   noacknowledgments : Removes the acknowledgments page
%   nodedication: Removes the dedication page


% These packages typeset the thesis with Times Roman font
\usepackage{mathptmx}
%\usepackage[T1]{fontenc}

\usepackage{amsmath}  % for ams mathematical environments
\usepackage[letterpaper]{geometry} % for fixing margins
\usepackage{indentfirst}  % for indention of first paragraph
\usepackage{graphicx} % Allow the inclusion of graphics



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
    \newcommand{\Author}[1]{
      \gdef\UTPAField@Author{#1}
      \gdef\UTPAField@UppercaseAuthor{\uppercase{#1}}
    }
    \newcommand{\docname}[1]{\gdef\UTPAField@DocName{#1}}
    \newcommand{\degree}[1]{\gdef\UTPAField@Degree{#1}}
    \newcommand{\Advisor}[1]{\gdef\UTPAField@Advisor{#1}}
    \newcommand{\AdvisorTitle}[1]{\gdef\UTPAField@AdvisorTitle{#1}}
    \newcommand{\MemberA}[1]{\gdef\UTPAField@MemberA{#1}}
    \newcommand{\MemberATitle}[1]{\gdef\UTPAField@MemberATitle{#1}}
    \newcommand{\MemberB}[1]{\gdef\UTPAField@MemberB{#1}}
    \newcommand{\MemberC}[1]{\gdef\UTPAField@MemberC{#1}}
    \newcommand{\MemberD}[1]{\gdef\UTPAField@MemberD{#1}}
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
    \degree{\uppercase{Master of Science}}
    \AdvisorTitle{Chair of Committee}
    \MemberA{}
    \MemberATitle{Committee Member}
    \MemberB{}
    \MemberC{}
    \MemberD{}

% define a command to insert a blank page
        \newcommand{\insertblankpage}{%
          \newpage
          \thispagestyle{empty}
          \mbox{}
        \addtocounter{page}{-1}
          \newpage
        }

% Define the preliminary page layouts using the variables

    \newcommand{\UTPAtitlepage}{%
        \newgeometry{top=2in,bottom=1in}
        \thispagestyle{empty}
        {\centering
          \doublespace
        \UTPAField@UppercaseTitle
        \singlespace
        \vfill  % provides equal spacing
        A \UTPAField@DocName \\
        \vspace{\baselineskip}
        by \\
        \vspace{\baselineskip}
        \UTPAField@UppercaseAuthor\\
        \vfill  % provides equal spacing
        Submitted to the Graduate School of\\
        The University of Texas-Pan American\\
        In partial fulfillment of the requirements for the degree of\\
        \vspace{\baselineskip}
        \UTPAField@Degree \\
        \vspace{7\baselineskip}  % skip 7 lines
        \UTPAField@Month~\UTPAField@Year\\
        \vspace{4\baselineskip}  % skip 4 lines
        Major Subject: \UTPAField@Major
        \par}
      \restoregeometry
        \insertblankpage
        \addtocounter{page}{-1}  % don't increment page counter for this page
      }

    \newcommand{\Committeepage}{%
        \newgeometry{top=2in, bottom=1in}
        \thispagestyle{empty}
        \singlespace
        \centering
        \doublespace
            {\UTPAField@UppercaseTitle}\par
        \singlespace
        \vspace{\baselineskip}
        A \UTPAField@DocName \\
        by \\
        \UTPAField@UppercaseAuthor\\
        \vspace{3\baselineskip}
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
        \mbox{\UTPAField@Month~\UTPAField@Year} \\
        \par

        \restoregeometry
        \insertblankpage
      }

    \newcommand{\Copyrightpage}{%
        \newgeometry{top=0in, bottom=0in}
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
        \newgeometry{top=2in, bottom=1in}
        \thispagestyle{fancy}
        {\centering%
        ABSTRACT\\
        \vspace{\baselineskip}
        \par
        }
        \addcontentsline{toc}{chapter}{Abstract}
        \doublespace
        \raggedright
        {\setlength{\parindent}{0.5in}
          \noindent\UTPAField@UlineTitle\\
          \total{tablenum} tables,
          \total{figurenum} figures,
          \total{citesnum} references,
          \total{bibnum} titles.
        \UTPAField@Abstract\par
      }

        \vfill

        \restoregeometry
        \insertblankpage
    }


    \newcommand{\dedicationpage}{%
        \newgeometry{top=2in, bottom=1in}
        \thispagestyle{fancy}
        \singlespace
        {\centering
        DEDICATION
        \par}
      \vspace{2\baselineskip}
         \small\normalsize%
        \addcontentsline{toc}{chapter}{Dedication}
          \doublespace
        {\setlength{\parindent}{0.5in}
        \UTPAField@Dedication
      }
        \restoregeometry
        \insertblankpage
        }


    \newcommand{\biographypage}{%
        \newgeometry{top=2in, bottom=1in}
        \thispagestyle{fancy}
        \singlespace
        {\centering
        BIOGRAPHICAL SKETCH
        \par}
      \vspace{2\baselineskip}
         \small\normalsize%
        \addcontentsline{toc}{chapter}{Biographical Sketch}
          \doublespace
        {\setlength{\parindent}{0.5in}
        \UTPAField@BiographicalSketch
      }

        \par\renewcommand{\baselinestretch}{1} \small\normalsize%
        \restoregeometry
        }

    \newcommand{\acknowledgmentspage}{%
        \newgeometry{top=2in, bottom=1in}
        \thispagestyle{fancy}
        \singlespace
        {\centering%
        ACKNOWLEDGMENTS\\
        \vspace{\baselineskip}
        \par
        }
        \addcontentsline{toc}{chapter}{Acknowledgments}
        \raggedright
        {\setlength{\parindent}{0.5in}
        \doublespace
        \UTPAField@Acknowledgments\par
      }
        \restoregeometry
        \insertblankpage
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
      \degree{\uppercase{Master of Science}}
      \docname{Thesis}
      \AdvisorTitle{Chair of Committee}
    }

    \DeclareOption{phd}{%
      \degree{Doctor of Philosophy}
      \docname{Dissertation}
      \AdvisorTitle{Chair}
    }



% Load the class and needed packages
    \DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
    \ProcessOptions
    \relax
    \LoadClass[letterpaper,12pt, oneside]{book}


% A couple of useful macros for line spacing

    % The \singlespace macro switches to single spaced lines
    \newcommand{\singlespace}{\par\renewcommand{\baselinestretch}{1}\small\normalsize\par}

    % The \doublespace macro switches to double spaced lines
    \newcommand{\doublespace}{\par\renewcommand{\baselinestretch}{1.66}\small\normalsize\par}


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
      \renewcommand{\contentsname}{Table of Contents}
      \providecommand\phantomsection{} \phantomsection
      \addcontentsline{toc}{chapter}{Table of Contents}
      \singlespace
      \TEMPtableofcontents
      \doublespace
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
      \singlespace
      \TEMPlistoffigures
      \doublespace
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
      \singlespace
      \TEMPlistoftables
      \doublespace
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
      \TEMPbibliography
    }


% Define the macro for making preliminary pages
    \newcommand{\makepreliminarypages}{%
      % We insert the pages heres and adjust spacing and geometry
        \singlespace
        \UTPAtitlepage
        \Committeepage
        \Copyrightpage
        \abstractpage
        \dedicationpage
        \acknowledgmentspage
        \restoregeometry
        \doublespace
         \setlength{\parindent}{0.5in}
    }



% The fancyhdr package allows you to easily customize the page header.
% The settings below produce a nice, well separated header.
\usepackage{fancyhdr}
\fancyhead{}
\renewcommand{\headrulewidth}{0pt}
  \pagestyle{fancy}



%%%% tips from http://texblog.org/2011/09/09/10-ways-to-customize-tocloflot/
%% Control the fonts and formatting used in the table of contents.
\usepackage[titles]{tocloft}
\usepackage{calc}  % load this for the \widthof command

\renewcommand{\cftchapfont}{\scshape} % change fonts
\renewcommand{\cftchappagefont}{\normalfont}
\renewcommand{\cftchapleader}{\cftdotfill{2.6}} % Add Table of Contents dots
\renewcommand{\cftchappresnum}{Chapter~} % add the word "chapter" to toc entreis
\AtBeginDocument{\addtolength\cftchapnumwidth{\widthof{\scshape Chapter~}}}

\renewcommand{\contentsname}{Table of Contents}

%% Aesthetic spacing redefines that look nicer to me than the defaults.
%% this applies to table of contents
\setlength{\cftbeforechapskip}{1ex}
\setlength{\cftbeforesecskip}{1ex}
\setlength{\cftbeforesubsecskip}{1ex}



\makeatletter
  % The following creates blank page before a chapter header
\def\@makeappendixhead#1{%
  \newpage
% This macro redefines the \chapter command to
% count figures and tables before the counters are cleared
% http://tex.stackexchange.com/questions/60505/custom-chapter-definition
\renewcommand\chapter{%
  \addtocounter{tablenum}{\value{table}}
  \addtocounter{figurenum}{\value{figure}}
\if@openright\cleardoublepage\else\clearpage\fi
                    \thispagestyle{plain}%
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter
                  }



  \mbox{}
  {\centering
    \vfill
    \large \scshape
         \@chapapp\space \thechapter \par
    \vfill
    \newpage

    \vspace*{0.5in}
    \@chapapp\space \thechapter \par
    \vspace{\baselineskip}
    #1\par\nobreak
    \vspace{\baselineskip}
  }
}

\g@addto@macro\appendix{%
  % The following redefines the chapter header
\let\@makechapterhead\@makeappendixhead
  % The following fixes the prefix for appendices in TOC
  \addtocontents{toc}{%
    \protect\renewcommand{\protect\cftchappresnum}{\appendixname\space}%
  }%
}
\makeatother

% this package is used to style the chapter, section, and subsection headings
\usepackage[sc,center,tiny]{titlesec}

% load more packages
\usepackage[normalem]{ulem} % for underlining command \uline
\usepackage{totcount} % for citation and reference counts
\usepackage{lastpage} % to get the number of pages

\newtotcounter{tablenum}  % counter for counting tables
\newtotcounter{figurenum} % counter for counting figures

\newtotcounter{citesnum} % counter for counting citations
\def\oldcite{} \let\oldcite=\cite
\def\cite{\stepcounter{citesnum}\oldcite}

\newtotcounter{bibnum} % counter for counting titles in bibliography
\def\oldbibitem{} \let\oldbibitem=\bibitem
\def\bibitem{\stepcounter{bibnum}\oldbibitem}

\usepackage{hyperref}
\usepackage{showkeys}
