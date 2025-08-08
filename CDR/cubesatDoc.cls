\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cubesatDoc}[Clase para documentos del proyecto Cubesat UTN]

\LoadClass[12pt,openany]{report}

% Paquetes esenciales
\RequirePackage{emptypage}
\RequirePackage[utf8]{inputenc}
\RequirePackage{graphicx}
\RequirePackage{amsmath, amsfonts}
\RequirePackage{xfrac}
\RequirePackage[table]{xcolor}
\RequirePackage{longtable}
\RequirePackage{float}
\RequirePackage{enumitem}
\RequirePackage{booktabs}
\RequirePackage{indentfirst}
\RequirePackage{tikz}
\RequirePackage{titlesec}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage{geometry}
\RequirePackage[main=spanish, provide=*]{babel}
\RequirePackage{hyperref}
\RequirePackage{eso-pic}
\RequirePackage{tabularx}
\RequirePackage{array}
\RequirePackage{wrapfig}
\RequirePackage{pdflscape}
\RequirePackage{pgfgantt}
\RequirePackage{biblatex}
\RequirePackage[toc]{glossaries}
\RequirePackage{caption}
\RequirePackage{pgfplots}
\RequirePackage{circuitikz}
\RequirePackage{multirow}

% configuracion de hipervinculos
\hypersetup{
    colorlinks,
    citecolor=black,
    filecolor=black,
    linkcolor=black,
    urlcolor=black
}

% Márgenes y geometría
\geometry{
  a4paper,
  left=2.5cm, right=2.5cm,
  top=0.5cm, bottom=2cm, headheight=3cm, headsep=0cm,
  nomarginpar, includehead
}
% Encabezados y pies de página

\newcommand{\setCustomPageStyle}{
  \pagestyle{fancy}
  \fancyhf{}
  \fancyhead[C]{
    \parbox{\textwidth}{
      \begin{tabularx}{\textwidth}{|>{\centering\arraybackslash}p{0.23 \textwidth}|
                                       >{\centering\arraybackslash}X|
                                       >{\centering\arraybackslash}p{0.23 \textwidth}|}
        \hline
        \begin{minipage}[c][1.1cm][c]{1cm}
          \includegraphics[height=1cm]{cls/utn.png}
        \end{minipage}
        \begin{minipage}[c][1.1cm][c]{1.6cm}
        Regional Córdoba
        \end{minipage}
        &
        \begin{minipage}[c][1.1cm][c]{0.9 \linewidth}
          \centering
          \textbf{CUBESAT UTN 2025}
        \end{minipage}
        &
        \begin{minipage}[c][1.1cm][c]{1cm}
          \includegraphics[height=1cm]{cls/electronica.jpeg}
        \end{minipage}
        \\
        \hline
        \begin{minipage}[c][1.1cm][c]{0.85 \linewidth}
          \centering
          \textbf{\textit{DOC.N°:\@docn}}
        \end{minipage}
        &
        \begin{minipage}[c][1.1cm][c]{0.9 \linewidth}
          \centering
          \textit{\@titulo}
        \end{minipage}
        &
        \begin{minipage}[c][1.1cm][c]{0.85 \linewidth}
          \centering
          \textbf{\textit{\@fecha}}
        \end{minipage} \\
        \hline
      \end{tabularx}
    }
  }
  \fancyfoot[C]{Página \thepage\ de \pageref{LastPage}}
  \renewcommand{\headrulewidth}{0pt}
}
\setCustomPageStyle

% Comandos personalizados
\newcommand{\titulo}[1]{\def\@titulo{#1}}
\newcommand{\@subtitulo}{}  % Inicialmente vacío
\newcommand{\subtitulo}[1]{\def\@subtitulo{#1}}
\newcommand{\grupo}[1]{\def\@grupo{#1}}
\newcommand{\fecha}[1]{\def\@fecha{#1}}
\newcommand{\docn}[1]{\def\@docn{#1}}

% UNIDADES UTILES
% --- Resistencias ---
\newcommand{\ohm}{\,\Omega}
\newcommand{\kohm}{\,\mathrm{k}\Omega}
\newcommand{\Mohm}{\,\mathrm{M}\Omega}

% --- Capacitancias ---
\newcommand{\nF}{\,\mathrm{nF}}
\newcommand{\uF}{\,\mathrm{\mu F}}
\newcommand{\mF}{\,\mathrm{mF}}
\newcommand{\F}{\,\mathrm{F}}

% --- Tensión ---
\newcommand{\uV}{\,\mathrm{\mu V}}
\newcommand{\mV}{\,\mathrm{mV}}
\newcommand{\V}{\,\mathrm{V}}
\newcommand{\kV}{\,\mathrm{kV}}

% --- Corriente ---
\newcommand{\uA}{\,\mathrm{\mu A}}
\newcommand{\mA}{\,\mathrm{mA}}
\newcommand{\A}{\,\mathrm{A}}

% --- Inductancias ---
\newcommand{\mH}{\,\mathrm{mH}}
\newcommand{\uH}{\,\mathrm{\mu H}}
\newcommand{\nH}{\,\mathrm{nH}}

% --- Frecuencia ---
\newcommand{\Hz}{\,\mathrm{Hz}}

% --- Potencia ---
\newcommand{\W}{\,\mathrm{W}}       % Watt
\newcommand{\mW}{\,\mathrm{mW}}     % miliWatt
\newcommand{\kW}{\,\mathrm{kW}}     % kiloWatt

% --- Energía ---
\newcommand{\J}{\,\mathrm{J}}       % Joule
\newcommand{\mJ}{\,\mathrm{mJ}}     % miliJoule
\newcommand{\kJ}{\,\mathrm{kJ}}     % kiloJoule
\newcommand{\Wh}{\,\mathrm{Wh}}     % Watt-hora
\newcommand{\kWh}{\,\mathrm{kWh}}   % kiloWatt-hora

% --- Temperatura ---
\newcommand{\Celsius}{\,^\circ\mathrm{C}}    % Grados Celsius
\newcommand{\Kelvin}{\,\mathrm{K}}           % Kelvin

% --- Tiempo ---
\newcommand{\s}{\,\mathrm{s}}
\newcommand{\ms}{\,\mathrm{ms}}              % milisegundos
\newcommand{\us}{\,\mathrm{\mu s}}           % microsegundos
\newcommand{\ns}{\,\mathrm{ns}}

% --- distancia ---
\newcommand{\um}{\,\mathrm{\mu m}}
\newcommand{\mm}{\,\mathrm{mm}}
\newcommand{\m}{\,\mathrm{m}}
\newcommand{\km}{\,\mathrm{km}}

% --- Otros ---
\newcommand{\percent}{\,\%}
\newcommand{\degree}{^{\circ}}

% Estilo de capítulos y secciones
\titleformat{name=\chapter,numberless}[block]
  {\normalfont\LARGE\bfseries}{}{0pt}{}
\titleformat{\chapter}[block]{\normalfont\LARGE\bfseries }{\thechapter\hspace{1em}}{0pt}{}
\titlespacing*{\chapter}{10pt}{0pt}{20pt}
\patchcmd{\chapter}{\thispagestyle{plain}}{\thispagestyle{fancy}}{}{}

\titleformat{\section} {\normalfont\Large\bfseries } {\thesection  \hspace{1em}}{0pt}{}
\titlespacing*{\section} {12pt}{18pt plus 2pt minus 2pt}{8pt}

\titleformat{\subsection} {\normalfont\large\bfseries}{\thesubsection  \hspace{1em}}{0pt}{}
\titlespacing*{\subsection} {15pt}{12pt plus 1pt minus 1pt}{6pt}

% Índice
\renewcommand{\contentsname}{Tabla de Contenidos}

% Interlineado de las tablas
\renewcommand{\arraystretch}{1.5}

% Carátula automática
\AddToShipoutPictureBG*{%
  \put(0,0){%
    \makebox[0pt][l]{%
      \includegraphics[width=\paperwidth,height=\paperheight]{cls/titleback.png}%
    }%
  }%
}
\def\maketitle{
  \begin{titlepage}
    \AddToShipoutPictureBG*{ }
    \hspace{80.5mm}
    \begin{minipage}[t][17.5cm][t]{0.45 \paperwidth}
      \centering
      \vspace{45mm}
      {\Huge\bfseries \@titulo \par}
      \vspace{15mm}
      {\LARGE\bfseries Facultad Regional Córdoba \par}
      \vspace{15mm}
      {\Large\bfseries \@grupo \par}
      \vfill
      {\Large\bfseries \@subtitulo \par}
      \vfill
      {\large\bfseries \@fecha\par}
      \vspace{10mm}
    \end{minipage}
  \end{titlepage}
}


\newcommand{\presentacion}[4]{
  \noindent
  \begin{minipage}{\textwidth}
  \underline{\textbf{\large #1}}\\
  \begin{minipage}[c]{0.65\textwidth}
    \vspace{2mm}
    \textbf{Áreas de Conocimiento:}\\
    #2\\
    \textbf{Experiencia:}\\
    #3
  \end{minipage}
  \begin{minipage}[c]{0.35\textwidth}
    \centering
    \begin{tikzpicture}
      \clip (2cm,-2cm) circle (2cm);
      \node[anchor=north west, inner sep=0pt, outer sep=0pt] at (0,0)
        {\includegraphics[width=4cm]{#4}};
    \end{tikzpicture}
  \end{minipage}
  \end{minipage}
  \vspace{5mm}
}

