\ProvidesClass{twentysecondcv}[2015/02/28 CV class]
\LoadClass{article}
\NeedsTeXFormat{LaTeX2e}

%----------------------------------------------------------------------------------------
%	 REQUIRED PACKAGES
%----------------------------------------------------------------------------------------

\RequirePackage[quiet]{fontspec}
\RequirePackage[sfdefault]{ClearSans}
\RequirePackage{tikz}
\RequirePackage{xcolor}
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{ragged2e}
\RequirePackage{etoolbox}
\RequirePackage{ifmtarg}
\RequirePackage{ifthen} 
\RequirePackage{pgffor}
\RequirePackage{marvosym}
\RequirePackage{parskip}

\usetikzlibrary{patterns}
\usepackage{enumitem}
\setlist[itemize]{leftmargin=*}
\RequirePackage[colorlinks=true, allcolors=mainorange]{hyperref}
\hypersetup{
    pdftitle={Michael Mustaine - Behavioural Data Scientist},
    pdfauthor={Michael Mustaine},
    pdfsubject={Resume},
    pdfkeywords={data science, psychology, machine learning, music, resume},
    pdfborderstyle={/S/U/W 1}
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\ifxetex
  \usepackage{letltxmacro}
  \setlength{\XeTeXLinkMargin}{1pt}
  \LetLtxMacro\SavedIncludeGraphics\includegraphics
  \def\includegraphics#1#{% #1 catches optional stuff (star/opt. arg.)
    \IncludeGraphicsAux{#1}%
  }%
  \newcommand*{\IncludeGraphicsAux}[2]{%
    \XeTeXLinkBox{%
      \SavedIncludeGraphics#1{#2}%
    }%
  }%
\fi

%----------------------------------------------------------------------------------------
%	 COLOURS
%----------------------------------------------------------------------------------------

\definecolor{white}{RGB}{255,255,255}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{sidecolor}{HTML}{233D45}
\definecolor{mainblue}{HTML}{0E5484}
\definecolor{maingray}{HTML}{B9B9B9}
\definecolor{mainorange}{HTML}{FF8B43}

%%%%% Other defined colors not used.
% \definecolor{black}{HTML}{000000}
% \definecolor{darkgray}{HTML}{333333}
% \definecolor{lightgray}{HTML}{999999}
% \definecolor{green}{HTML}{C2E15F}
% \definecolor{orange}{HTML}{FDA333}
% \definecolor{purple}{HTML}{D3A4F9}
% \definecolor{red}{HTML}{FB4485}
% \definecolor{blue}{HTML}{6CE0F1}
% \definecolor{pblue}{HTML}{41B1BD}
% \definecolor{materialpurple}{HTML}{9C27B0}
% \definecolor{materialindigo}{HTML}{3F51B5}
% \definecolor{materialblue}{HTML}{2196F3}
% \definecolor{materialcyan}{HTML}{00BCD4}
% \definecolor{materialteal}{HTML}{009688}
% \definecolor{materialgreen}{HTML}{4CAF50}
% \definecolor{materiallime}{HTML}{CDDC39}
% \definecolor{materialamber}{HTML}{FFC107}
% \definecolor{materialbrown}{HTML}{795548}
% \definecolor{materialred}{HTML}{FF4436}
% \definecolor{materialorange}{HTML}{FF5722}

\ifdefined\@cv@print
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\else
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\fi
\colorlet{textcolor}{black}
\colorlet{headercolor}{black}

%----------------------------------------------------------------------------------------
%	 MISC CONFIGURATIONS
%----------------------------------------------------------------------------------------
\pagestyle{empty} % Disable headers and footers
\setlength{\parindent}{0pt} % Disable paragraph indentation

%----------------------------------------------------------------------------------------
%	 SIDEBAR DEFINITIONS
%----------------------------------------------------------------------------------------

\setlength{\TPHorizModule}{1cm} % Left margin
\setlength{\TPVertModule}{1cm} % Top margin

\newlength\imagewidth
\newlength\imagescale
\pgfmathsetlength{\imagewidth}{5cm}
\pgfmathsetlength{\imagescale}{\imagewidth/600}

\newcommand{\profilesection}[2]{\vspace{8pt}
    {\color{white} \huge #1  \rule[0.15\baselineskip]
    {#2}{1pt}}}

% Define custom commands for CV info
\newcommand{\cvdate}[1]{\renewcommand{\cvdate}{#1}}
\newcommand{\cvlinkedin}[1]{\renewcommand{\cvlinkedin}{#1}}
\newcommand{\cvmail}[1]{\renewcommand{\cvmail}{#1}}
\newcommand{\cvnumberphone}[1]{\renewcommand{\cvnumberphone}{#1}}
\newcommand{\cvaddress}[1]{\renewcommand{\cvaddress}{#1}}
\newcommand{\cvsite}[1]{\renewcommand{\cvsite}{#1}}
\newcommand{\cvgit}[1]{\renewcommand{\cvgit}{#1}}
\newcommand{\aboutme}[1]{\renewcommand{\aboutme}{#1}}
\newcommand{\profilepic}[1]{\renewcommand{\profilepic}{#1}}
\newcommand{\cvname}[1]{\renewcommand{\cvname}{#1}}
\newcommand{\cvjobtitle}[1]{\renewcommand{\cvjobtitle}{#1}}

% Command for printing the contact information icons
\newcommand*\icon[1]{\tikz[baseline=(char.base)]{\node[shape=circle,draw,inner sep=1pt, fill=mainblue,mainblue,text=white] (char) {#1};}}

% Command for printing skill progress bars
\newcommand\skills{ 
	\smartdiagram[bubble diagram]{
        \textbf{Data}\\\textbf{~~~~Science~~~~},
        \textbf{SQL/}\\\textbf{~~~~~~~~~NoSQL~~~~~~~~~},
        \textbf{~~~~~~~~~~~Python~~~~~~~~~~~},
        \textbf{~~~~~~~~~~~~R~~~~~~~~~~~~},
        \textbf{~~~~~~MatLab~~~~~~},
        \textbf{~~~~~~~~~~Unix~~~~~~~~~},
        \textbf{JavaScript}
    }
}

% Command for printing skill progress bars. Must make each subcategory separate.
\newcommand\interests[1]{ 
	\renewcommand{\interests}{
		\begin{tikzpicture}
			\foreach [count=\i] \x/\y in {#1}{
				\draw[fill=white, opacity=0.75] (0,\i-0.5) rectangle (6,\i);
				\draw[draw=mainorange,fill=mainorange,opacity=1=mainorange](0,\i-0.5) rectangle (\y,\i);
				\node [above right,text=white] at (0,\i-.55) {\x};
			}
		\end{tikzpicture}
	}
}

\newcommand\psych[1]{ 
	\renewcommand{\psych}{
		\begin{tikzpicture}
			\foreach [count=\i] \x/\y in {#1}{
				\draw[fill=white, opacity=0.75] (0,\i-0.5) rectangle (6,\i);
				\draw[draw=mainorange,fill=mainorange,opacity=1=mainorange](0,\i-0.5) rectangle (\y,\i);
				\node [above right,text=white] at (0,\i-.55) {\x};
			}
		\end{tikzpicture}
	}
}

\newcommand\code[1]{ 
	\renewcommand{\code}{
		\begin{tikzpicture}
			\foreach [count=\i] \x/\y in {#1}{
				\draw[fill=white, opacity=0.75] (0,\i-0.5) rectangle (6,\i);
				\draw[draw=mainorange,fill=mainorange,opacity=1=mainorange](0,\i-0.5) rectangle (\y,\i);
				\node [above right,text=white] at (0,\i-.55) {\x};
			}
		\end{tikzpicture}
	}
}

%%% Original version of skill bars
% \newcommand\interests[1]{ 
% 	\renewcommand{\interests}{
% 		\begin{tikzpicture}
% 			\foreach [count=\i] \x/\y in {#1}{
				% \draw[fill=white, draw=white, opacity=0.85] (0,\i-0.5) rectangle (6,\i);
				% \draw[draw=white, fill=mainorange, opacity=1=mainorange](0,\i-0.5) rectangle (\y,\i);
				% \node [above right,text=white] at (0,\i-.525) {\x};
% 			}
% 		\end{tikzpicture}
% 	}
% }

%----------------------------------------------------------------------------------------
%  SIDEBAR LAYOUT
%----------------------------------------------------------------------------------------

\newcommand{\makeprofile}{
  \begin{tikzpicture}[remember picture,overlay]
      \node [rectangle, fill=sidecolor, anchor=north, minimum width=9cm, minimum height=\paperheight+1cm] (box) at (-5cm,0.5cm){};
  \end{tikzpicture}

  %------------------------------------------------

  \begin{textblock}{6}(0.5, 0.2)

    %------------------------------------------------
    
    {\huge\color{white}\cvname}

    %------------------------------------------------
    
    {\Large\color{white}\cvjobtitle}

    %------------------------------------------------
    
        \vspace{.4cm}
    \renewcommand{\arraystretch}{1.6}
    \begin{tabular}{p{1cm} @{\hskip 0.4cm}p{5cm}}
      \ifthenelse{\equal{\cvnumberphone}{}}{}{
        {$
          \begin{array}{l}
          {\href{}{}}
          \end{array}
          $} \color{white} \LARGE \faPhoneSquare & 
            \href{tel:\cvnumberphone}{\color{white}\cvnumberphone} \\
        }
      \ifthenelse{\equal{\cvmail}{}}{}{
        {$
          \begin{array}{l}
          {\href{mailto:\cvmail}{}}
          \end{array}
          $} \color{white} \Large \faEnvelope & 
            \href{mailto:\cvmail}{\color{white}\cvmail} \\
        }            
    %   \ifthenelse{\equal{\cvsite}{}}{}{
    %     {$
    %       \begin{array}{l}
    %       {\href{\cvsite}{}}
    %       \end{array}
    %       $}  \color{white} \LARGE \faGlobe & 
    %       \href{\cvsite}{\color{white}/michael-mustaine} \\
    %     }        
        
        
      \ifthenelse{\equal{\cvlinkedin}{}}{}{
        {$
          \begin{array}{l}
          {\href{\cvlinkedin}{}}
          \end{array}
          $}  \color{white} \LARGE \faLinkedinSquare & 
           \href{\cvlinkedin}{\color{white}/michael-mustaine} \\
        }
      \ifthenelse{\equal{\href{\cvgit}{\cvgit}}{}}{}{
        {$
          \begin{array}{l}
          {\href{\cvgit}{}}
          \end{array}
          $} \color{white} \LARGE \faGithub  &
            \href{\cvgit}{\color{white}/mmustaine}\\
        }
    \end{tabular}

%------------------------------------------------
        \profilesection{{\color{mainorange}{\textbf{P}}}roficiencies}{1.5cm}
              \begin{figure}
              \vspace{-.5cm}
              \hspace{-2.25cm} \includegraphics[scale=0.15]{img/spider.png}\end{figure}      

\vspace{-1.75cm}

%------------------------------------------------    
        \subsection{{\color{mainorange}{\textbf{P}}}\color{white}{sychology}}
        \\
		\interests{{\faWpforms~: Experimental Design/5.5},{\faCommenting~: Teaching, Presentation/5.6},{\faFileTextO~:  Documentation, Interpretation/5.9},{\faUsers~: Cognition, Behaviour, Preference/6}}
		
        \interests
        \\
        
%------------------------------------------------  
 \subsection{{\color{mainorange}{\textbf{A}}}\color{white}{nalysis}}
        \\
		\psych{ {\faLineChart~: Forecasting, Modelling/5},{\faAndroid~: Machine Learning, AI/5.5},{\faCogs~: Dashboards, BCIs, Crawlers /6}}
        \psych
        \\
        
%------------------------------------------------            
 \subsection{{\color{mainorange}{\textbf{C}}}\color{white}{oding}}
        \\
		\code{{\faDatabase~: SQL, NoSQL, HDFS /5.5},{\faHeart~: EEG, MoCap, Eye-tracking/5.8},{\faCode~: Python, R, MatLab, Bash/5.8}}
		
        \code


  \end{textblock}
  
  
}


%----------------------------------------------------------------------------------------
%	 COLOURED SECTION TITLE BOX
%----------------------------------------------------------------------------------------

% Command to create the rounded boxes around the first three letters of section titles
\newcommand*\round[2]{%
	\tikz[baseline=(char.base)]\node[anchor=north west, draw,rectangle, rounded corners, inner sep=1.6pt, minimum size=5.5mm, text height=3.6mm, fill=#2,#2,text=white](char){#1};%
}

%%%% Sets section letters to specific color
\def\@sectioncolor#1{%
	{%
		\color{mainorange} \textbf{#1}%
	}%
}


\renewcommand{\section}[1]{
  \par\vspace{\parskip}
	{%
		\LARGE\headingfont\color{headercolor}%
		\@sectioncolor #1%
	}
  \par\vspace{\parskip}
}

\renewcommand{\subsection}[1]{
	\par\vspace{.25\parskip}{%
		\Large\headingfont\color{headercolor} #1%
	}
	\par\vspace{.125\parskip}%
}

\pagestyle{empty}

%----------------------------------------------------------------------------------------
%	 LONG LIST ENVIRONMENT
%----------------------------------------------------------------------------------------

\setlength{\tabcolsep}{0pt}

% New environment for the long list
\newenvironment{twenty}{%
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
	\end{tabular*}
}

\newcommand{\expitem}[5]{%
	#1&\parbox[t]{0.83\textwidth}{\vspace{-.675cm}%
		\textbf{#2}% 
		\hfill%
		{\small\textbf{#3}}\\%
        \ifblank{#4}{}{#4 }
		#5\vspace{0.5cm}%
	}\\
}

% New environment for the small list
\newenvironment{portfolio}{%
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
	\end{tabular*}
}

\newcommand{\portfolioitem}[4]{%
	#1&\parbox[t]{0.83\textwidth}{%
		\textbf{#2}
		\hfill%
		{\small\textbf{\color{mainorange}#3}}\\%\\%
		{#4}\vspace{0.5cm}%
	}\\
}

%----------------------------------------------------------------------------------------
%	 MARGINS AND LINKS
%----------------------------------------------------------------------------------------

\RequirePackage[left=7.6cm,top=0.1cm,right=1cm,bottom=0.2cm,nohead,nofoot]{geometry}

%------------------------------------------------    
%%% Bubble graph from original template.
% \usepackage{smartdiagram}
% \tikzset{
% bubble center node/.append style={text=white},
% bubble node/.append style={text=white}
% }
% \smartdiagramset{
%     bubble center node font = \footnotesize,
%     bubble node font = \footnotesize,
%     % specifies the minimum size of the bubble center node
%     bubble center node size = 1cm,
%     %  specifies the minimum size of the bubbles
%     bubble node size = 0.5cm,
%     % specifies which is the distance among the bubble center node and the other bubbles
%     distance center/other bubbles = 0.5cm,
%     % sets the distance from the text to the border of the bubble center node
%     distance text center bubble = 0.5cm,
%     % set center bubble color
%     bubble center node color = pblue,
%     % define the list of colors usable in the diagram
%     set color list = {lightgray, materialcyan, orange, green, materialorange, materialteal, materialamber, materialindigo, materialgreen, materiallime},
%     % sets the opacity at which the bubbles are shown
%     bubble fill opacity = 0.8,
%     % sets the opacity at which the bubble text is shown
%     bubble text opacity = 1,
% }

