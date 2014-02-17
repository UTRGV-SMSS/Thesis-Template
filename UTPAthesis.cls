 \NeedsTeXFormat{LaTeX2e}
 \ProvidesClass{UTPAthesis}[2013/12/14 UTPA Theses and Dissertations]

% The UTPAthesis class is for producing theses and dissertations
% that meet the UTPA requirements.
%
% The following class options are available
%
%   masters   : Produces the masters thesis preliminary pages
%   noacknowledgments : Removes the acknowledgments page


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
    \docname{thesis}
    \degree{\uppercase{Master of Science}}
    \AdvisorTitle{Chair of Committee}


% Define the preliminary page layouts using the variables

    \newcommand{\UTPAtitlepage}{%
        \newgeometry{top=2in,bottom=1in}
        \thispagestyle{empty}
        {\centering
          \doublespace
        \UTPAField@UppercaseTitle
        \singlespace
        \vfill  % provides equal spacing
        A Thesis \\
        \vspace{\baselineskip}
        by \\
        \vspace{\baselineskip}
        \UTPAField@UppercaseAuthor\\
        \vspace{\baselineskip}
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
      \newpage
      \restoregeometry
      }

    \newcommand{\Committeepage}{%
        \newgeometry{top=2in, bottom=2in}
        \thispagestyle{empty}
        \singlespace
        \centering
        \providecommand\pdfbookmark[3][]{} \pdfbookmark[0]{Title Page}{bm:Title}
        \doublespace
            {\UTPAField@UppercaseTitle}\par
        \singlespace
        \vspace{\baselineskip}
        A Thesis \\
        by \\
        \UTPAField@UppercaseAuthor\\
        \vspace{3\baselineskip}
        \uppercase{Committee Members} \\
        \vfill
        \UTPAField@Advisor\\
        \UTPAField@AdvisorTitle\\
        \vfill
        \if \UTPAField@MemberA \relax \relax \else \mbox{\UTPAField@MemberA}\\
                Committee Member\\
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
      }

    \newcommand{\Copyrightpage}{%
        \newgeometry{top=2in, bottom=2in}
        \thispagestyle{empty}
        \vspace*{\fill}
        {\centering%
        Copyright~\UTPAField@Year~\UTPAField@Author \\
        All Rights Reserved
        \par
        }
        \vspace{\fill}


        \restoregeometry
    }

    \newcommand{\abstractpage}{%
        \newgeometry{top=2in, bottom=2in}
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
        \UTPAField@Abstract\par
      }

        \vfill

        \restoregeometry
    }


    \newcommand{\dedicationpage}{%
        \newgeometry{top=2in, bottom=2in}
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
        \par\renewcommand{\baselinestretch}{1} \small\normalsize%
        \addtocounter{page}{-1}
        \insertblankpage
        \restoregeometry
        }


    \newcommand{\biographypage}{%
        \newgeometry{top=2in, bottom=2in}
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
        \newgeometry{top=2in, bottom=2in}
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
        }

        \newcommand{\insertblankpage}{%
          \newpage
          \thispagestyle{empty}
          \mbox{}
        }


% Allow opt-out on acknowledgments
    \DeclareOption{noacknowlegments}{%
      \renewcommand{\acknowledgmentspage}{}
    }



    \DeclareOption{masters}{%
      \degree{\uppercase{Master of Science}}
      \docname{thesis}
      \AdvisorTitle{Chair of Committee}
    }

    \DeclareOption{phd}{%
      \degree{Doctor of Philosophy}
      \docname{dissertation}
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
        \addtocounter{page}{-1}
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
        \addtocounter{page}{-1}
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
        \addtocounter{page}{-1}
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
        \addtocounter{page}{-1}
        \insertblankpage
        \Committeepage
        \addtocounter{page}{-1}
        \insertblankpage
        \Copyrightpage
        \addtocounter{page}{-1}
        \insertblankpage
        \abstractpage
        \addtocounter{page}{-1}
        \insertblankpage
        \dedicationpage
        \acknowledgmentspage
        \insertblankpage
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



% The following fixes the prefix for appendices in TOC
\makeatletter
\g@addto@macro\appendix{%
  \addtocontents{toc}{%
    \protect\renewcommand{\protect\cftchappresnum}{\appendixname\space}%
  }%
}
\makeatother

% this package is used to style the chapter, section, and subsection headings
\usepackage[sc,center,tiny]{titlesec}
