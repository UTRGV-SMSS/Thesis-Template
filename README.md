# UTRGV Thesis Template

This is a LaTeX thesis template that attempts to conform to the guidelines
published by UTRGV's Graduate School office.

Please report any issues to
[https://github.com/UTRGV-SMSS/Thesis-Template/issues](https://github.com/UTRGV-SMSS/Thesis-Template/issues)

## Getting Started

To use this template, download as a zip file  from [Github](https://github.com/UTRGV-SMSS/Thesis-Template/archive/master.zip).  Optionally, you can upload this zip file to [Overleaf](https://overleaf.com) to get started right away.

After unzipping you should see many files, but the most important files are the 
`main.tex` file and the `UTRGV.cls` file.
The main formatting commands are defined in the `UTRGV.cls` file.  However, it
is likely that you
will not need to modify or even look at the contents of this file.

To really get started, open the `main.tex` file and start editing.  This file is mostly
self-documenting.  Look at the comments in this file for directions on how to
produce the desired content and formatting of your thesis. 

Apart from the commands documented in the `main.tex` file, try to use the
regular LaTeX formatting commands.  Avoid loading packages that change the
layout of your document.

## Help With LaTeX

The following are two video series on getting started with LaTeX: from [Vincent Knight](https://www.youtube.com/playlist?list=PLnC5h3PY-znyDQKn3knfXfekZLgWyL7QW)
and from
[Grand Valley State](www.youtube.com/playlist?list=PLF975D9D3C9B50FF7)

Here is a link on how to split your thesis up into several files:
[https://web.science.mq.edu.au/~rdale/resources/writingnotes/latexstruct.html](https://web.science.mq.edu.au/~rdale/resources/writingnotes/latexstruct.html)


## Common Issues


1. **Font is Not Times New Roman**:  When compiling with LaTeX (or pdfLaTeX) your paper will be typeset with a font that is almost
identical to Times New Roman but is not actually named that.  To typeset your
paper with Times New Roman, change the compiler that your editor uses from LaTeX (or pdfLaTeX) to XeLaTeX.  
2. **Figures Do Not Show Up**: When compiling in draft mode, figures do not show and you will also see red labels
on equations and figures.
To have the figures show and the red labels disappear, change the `\documentclass` options from `draft` to
`final`.
3. **Compiling for PhD dissertation**: To compile for a PhD dissertation, you can change the `\documentclass` options from `masters` to `phd`.  Alternatively, you can use the following code in your `main.tex` file.
```latex
\degree{Doctor of Philosophy}
\degreeabbrev{(PhD)}
\docname{Dissertation}
```
4. **Compiling for a Master of Arts Thesis**:
To compile for a  Master of Arts thesis use the following code in `main.tex`

```latex
\degree{Master of Arts}
\degreeabbrev{(MA)}
\docname{Thesis}
``` 
5. **Text Needs to be Aligned Left instead of Justified**: Sometimes a reviewer
   will ask that the text of your thesis be Aligned Left (which is the default
in Microsoft Word) instead of Justified (which is the default in LaTeX).  To
switch to Aligned Left, uncomment the line with `\usepackage[document]{ragged2e}` in `main.tex` to
activate Aligned Left.
6. **Bibliography Requires Hanging Indentation**:  Sometimes a reviewer will ask
   that the entries of your Bibliography have hanging indentation after the
first line. To enable
this, add the lines below to the file `main.tex`  before the beginning of the
bibliography code. You can adjust the size of the indentation by changing `2em`
to a more suitable value.
```latex
\makeatletter
\def\bibhanging{2em}
\let\old@biblabel\@biblabel
\def\@biblabel#1{\old@biblabel{#1}\kern\bibhanging}
\let\old@bibitem\bibitem
\def\bibitem#1{\old@bibitem{#1}\leavevmode\kern-\bibhanging}
\makeatother
``` 


## Authors
The author of this template is Guillermo Garza.
