%% IDENTIFICATION %%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{homework}[2023/06/04 A class I use for formatting my homework and such.]

% This is based off of the `report` class.
\LoadClass{report}

%% REQUIRED PACKAGES %%

\RequirePackage{graphicx} % Required for inserting images
\RequirePackage{amsmath} % Mathematical symbols and such
\RequirePackage{amssymb} % More mathematical symbols
\RequirePackage{amsthm} % Mathematical proof-writing and such
\RequirePackage{geometry} % Aligning the page
\RequirePackage[indent]{parskip} % Spacing for paragraphs
\RequirePackage{indentfirst} % Indent first paragraph after section heading
\RequirePackage[inline]{asymptote} % For drawing graphics and images
\RequirePackage{hyperref} % For linking to chapters, sections, etc.
\RequirePackage{titlesec} % For custom sections and such
\RequirePackage{mathtools} % Math tools to make my life easier

%% PACKAGE SETUP %%

% Set the page dimensions/margins.
\geometry{
    letterpaper,
    portrait,
    margin=1in,
    includehead,
}

% Set link colors and such
\hypersetup{
    colorlinks=true,
    linkcolor=black,
    filecolor=blue,      
    urlcolor=blue,
    pdfpagemode=FullScreen,
}

%% COMMANDS/MACROS %%

% Make lectures easy to work with.
% TODO: Make this less awful!
\newcommand{\lecture}[1]{
    % The original chapter
    \def\ogchap{\chaptername}

    % Make this a lecture!
    \renewcommand{\chaptername}{Lecture}
    \chapter{#1}

    % Return things back to normal
    \renewcommand{\chaptername}{\ogchap}
}

% Problems or examples that are given. Note that lables to questions are of the form
% `ch:<chapter #>:q:<question # in chapter>`. Also, `hyperref` works better for 
% referencing problems than `ref`.
\newcounter{problem}
\counterwithin{problem}{chapter}
\renewcommand\theproblem{\arabic{problem}}
\newcommand{\problem}[1]{
    \refstepcounter{problem}%
    \phantomsection
    \noindent\large\textbf{#1}
    \label{ch:\thechapter:q:\theproblem}
}

% Make floor and ceiling functions easier to write.
\DeclarePairedDelimiter{\floor}{\lfloor}{\rfloor}
\DeclarePairedDelimiter{\ceil}{\lceil}{\rceil}

% Make mathematical sets easier to define and use.
\newcommand{\N}{\mathbb{N}}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\R}{\mathbb{R}}
\newcommand{\Q}{\mathbb{Q}}
\newcommand{\C}{\mathbb{C}}
