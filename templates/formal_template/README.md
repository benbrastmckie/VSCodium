# LaTeX Documentation for Modal Logic Final Projects

This document outlines the structure of the [`final_template.tex`](final_template.tex) LaTeX template for _The Modern History of Modal Logic_ seminar.
The directory contents are given below:

```
latex_example/
├── README.md
├── assets/
│   ├── bib_style.bst
│   ├── formatting.sty
│   ├── modal_history.bib
│   └── notation.sty
└── final_template.tex
```

Create a copy of the `latex_examples/` directory in the `final_projects/` directory using your name as in `final_projects/YOUR_NAME_final/`.
Since you will be the only one working in this directory, feel free to make any changes you like.
It is nevertheless good to commit often so that you can always easily revert without losing work.
Hopefully this template will be helpful to you in your other work.

## Template Structure

The following sections provide details about the structure of the template for reference.

### Main Components

1. **Document Class and Packages**
   ```latex
   \documentclass[11pt, a4paper]{article}  % Document class with paper size and font size
   \usepackage{assets/formatting}          % Main styling package
   \usepackage{assets/notation}            % Mathematical notation for logic
   ```

2. **Document Information**
   ```latex
   \title{Project Title}                              % Document title
   \class{The Modern History of Modal Logic}          % Course name
   \author{Your Name}                                 % Author name 
   \pset{--- Final Project ---}                       % Project/assignment information
   \date{\today}                                      % Current date
   \setheader{MIT, The Modern History of Modal Logic} % Sets page header
   ```

3. **Document Structure**
   ```latex
   \begin{document}
   % Title page with custom formatting
   \papertitle
   
   % Optional abstract
   \begin{abstract}
   \noindent
   Your abstract text here...
   \end{abstract}
   
   % Main content with sections
   \hypsection{Introduction}\label{sec:intro}
   % ...
   
   % Bibliography
   \newpage
   \begin{small}
     \singlespacing
     \bibliographystyle{assets/bib_style}
     \bibliography{assets/modal_history}
     \thispagestyle{empty}
   \end{small}
   \end{document}
   ```

## Style Files

The template relies on two primary style files:

### 1. `assets/formatting.sty`

This file contains most of the document formatting and defines:

- **Package imports** - All necessary LaTeX packages
- **Citation commands** - Custom citation formatting including `\citepos` for possessive citations
- **Section commands** - Hyperlinked sections with `\hypsection`, `\hypsubsection`
- **Footnote formatting** - Customized footnote appearance
- **Title styling** - Custom title formatting with `\papertitle`
- **Header/footer** - Page header customization with `\setheader`
- **Box styling** - Solution boxes with customizable colors via `\setanswerboxcolors`
- **Hyperlink styling** - Color schemes for URLs and references
- **Theorem environments** - Customized theorem, lemma, corollary, and definition environments
- **Proof environments** - Hilbert-style proof formatting

### 2. `assets/notation.sty`

This file defines extensive mathematical notation for modal logic, including:

- **Delimiters and brackets** - Various specialized brackets and quote symbols
- **Logical connectives** - Symbols for standard and modal logical operators
- **Tense operators** - Special symbols for tensed logic
- **Metalogical symbols** - Various function symbols and notation
- **Mathematical sets** - Common sets and structures
- **Modal logic systems** - Notation for various modal systems (K, T, S4, S5)
- **TikZ diagram styles** - Support for modal logic world diagrams

## Theorem and Proof Environments

The template includes several environments for formal mathematical content:

1. **Theorems** - `\begin{Tthm} ... \end{Tthm}`
2. **Lemmas** - `\begin{Lthm} ... \end{Lthm}`
3. **Corollaries** - `\begin{Cthm} ... \end{Cthm}`
4. **Rules** - `\begin{Rthm} ... \end{Rthm}`
5. **Definitions** - `\begin{Dthm} ... \end{Dthm}`
6. **Proofs** - Standard `\begin{proof} ... \end{proof}`
7. **Hilbert Proofs** - `\begin{hilbert} ... \end{hilbert}` with `\from{Rule}{Formula}` for each line

All theorem-like environments support optional names, automatic numbering by section, and cross-referencing.

## TikZ Diagrams for Modal Logic

The template supports creating modal logic diagrams using TikZ with predefined styles:

```latex
\begin{tikzpicture}
  \node[world] (w1) at (0,0) {$w_1$};
  \node[world] (w2) at (2,0) {$w_2$};
  \draw[arrow] (w1) to (w2);
\end{tikzpicture}
```

The template includes examples for:
- System T (reflexive) models
- System S4 (reflexive and transitive) models
- System S5 (equivalence relation) models
- Branching time models

## Bibliography

The template is configured to use:

- **Bibliography style**: `assets/bib_style.bst`
- **Bibliography database**: `assets/modal_history.bib`

## Usage Tips

1. **Title Setup**:
   - Set document information with `\title{}`, `\class{}`, `\author{}`, `\pset{}`, and `\date{}`
   - Use `\papertitle` to generate the formatted title

2. **Mathematical Notation**:
   - Refer to `notation.sty` for available math symbols
   - Common modal operators: `\always`, `\sometimes`
   - Logical connectives: `\eand`, `\eor`, `\eif`, `\eiff`, `\enot`
   - For tense logic: `\past`, `\Past`, `\future`, `\Future`
   - Modal systems: `\K`, `\T`, `\Sfour`, `\Sfive`

3. **Theorem Environments**:
   - Add labels to theorems for cross-referencing: `\begin{Tthm} \label{thm:name} ... \end{Tthm}`
   - Optional theorem names: `\begin{Tthm}{(Optional Name)} ... \end{Tthm}`
   - Reference theorems with `\ref{thm:name}`

4. **Citations**:
   - Standard citations: `\cite{key}`, `\citep{key}`, `\citet{key}`
   - Possessive citations: `\citepos{key}` (Jones's 1990 theory)
   - Page citations: `\citet[p.~7]{key}`

5. **Diagrams**:
   - Use the predefined `world` and `arrow` styles in TikZ
   - Place diagrams inside `figure` environments for proper positioning and referencing

## Template Features Overview

| Feature | Command/Environment | Example |
|---------|-------------------|---------|
| Title | `\papertitle` | Places formatted title with class, name, etc. |
| Sections | `\hypsection{Title}` | Creates a section with hyperlink support |
| Theorem | `\begin{Tthm} ... \end{Tthm}` | Creates a theorem environment |
| Lemma | `\begin{Lthm} ... \end{Lthm}` | Creates a lemma environment |
| Definition | `\begin{Dthm} ... \end{Dthm}` | Creates a definition environment |
| Proof | `\begin{proof} ... \end{proof}` | Standard proof environment |
| Hilbert Proof | `\begin{hilbert} ... \end{hilbert}` | Numbered proof lines |
| Modal Diagrams | TikZ with `world` and `arrow` styles | Creates Kripke frames/models |
| Citation | `\citet{key}`, `\citepos{key}` | Various citation styles including possessive |
