# Academic Writing Toolchain for VSCodium

Instructions for installing and integrating various tools for academic writing in VSCodium. This guide covers Markdown, Templates, Snippets, Pandoc, Python, and Jupyter Notebooks.

## LaTeX and Zotero

Core tools for academic writing with VSCodium:
- For LaTeX setup and configuration, see [LaTeX Documentation](latex.md)
- For Zotero reference management integration, see [Zotero Documentation](zotero.md)

## Markdown

Instead of taking notes in LaTeX, Word, or some other note-taking application, you can recover some of the elegance of LaTeX without any of the trouble by writing in Markdown.
The syntax for Markdown is by design as simple as possible, but can still produce a good looking document (think Notion) which you can then convert via Pandoc into other formats.

All that is required to use markdown is to create a file with the `.md` file extension in the "Explorer" tab.
For instance, you might create a 'TODO.md' or 'NOTES.md', etc.

More information on the markdown syntax can be found [here](https://www.markdownguide.org/basic-syntax/).

### Zotero Add-On

Zotero can be used not only to keep the PDFs associated with each citation organised, but to export the highlights and annotations you make with your preferred PDF viewer as markdown files.
In order to include these features, you will need to download the .xpi file for MdNotes as described here, as well as the .xpi file for ZotFile.
By then opening Zotero, navigating to the Tools –> Add-ons menu, clicking the gear symbol, and selecting 'Install add-on from file', you can select the .xpi files that you downloaded in order install these features.
You may then export your notes by: (1) right-clicking on the annotated PDF and selecting Manage Attachments –> Extract Annotations; followed by (2) right-clicking on the extraction that it generates and selecting MdNotes –> Export to Markdown, specifying the project folder you would like to save the notes in.

### Obsidian 

[Obsidian](https://obsidian.md/) is a powerful knowledge base that works on top of a local folder of plain text Markdown files. You can use VSCodium to work with your Obsidian vault files, combining Obsidian's knowledge management capabilities with VSCodium's editing features.

#### Setting Up VSCodium for Obsidian Integration

1. **Install Essential Extensions** (available in OpenVSX marketplace):
   - **Markdown All in One**: Provides keyboard shortcuts, table of contents, auto-preview and more
   - **Markdown Preview Enhanced**: Rich markdown preview with PlantUML, mermaid, LaTeX and more
   - **Foam**: Personal knowledge management and sharing system
   - **Markdown Links**: Provides navigation between markdown files with wiki links
   - **Path Intellisense**: Auto-completes filenames in your workspace

2. **Configure VSCodium for Markdown**:
   - Open Settings (JSON) with `Ctrl+Shift+P` and type "Preferences: Open User Settings (JSON)"
   - Add the following settings for improved Markdown editing:
   ```json
   "editor.wordWrap": "on",
   "markdown.preview.breaks": true,
   "markdown.links.openLocation": "beside",
   "markdown.extension.list.indentationSize": "inherit",
   "markdown.extension.toc.updateOnSave": false,
   ```

3. **Open Your Obsidian Vault**:
   - In VSCodium, use `File > Open Folder...` to open your Obsidian vault directory
   - This allows you to edit all your Obsidian Markdown files directly within VSCodium

4. **Working with Wikilinks**:
   - Obsidian uses `[[WikiLinks]]` syntax for internal linking
   - The Markdown Links extension helps with navigating these links in VSCodium

#### Limitations

- VSCodium cannot render Obsidian's proprietary features like graphs, kanban boards, or custom plugins
- You'll still need the Obsidian app for those specialized features
- VSCodium is best used for editing text content within your vault, leveraging VSCodium's powerful text editing capabilities

Using VSCodium alongside Obsidian gives you the best of both worlds: Obsidian's knowledge management system with VSCodium's powerful editing environment. This setup is particularly useful for developers who want to manage notes with the same tools they use for code.

## Templates

I have included a number of LaTeX templates [here](../templates/).

### Setting Up Folder Templates Extension in VSCodium

The "Folder Templates" extension by Huuums is an excellent tool for creating files and folders from customizable templates.
Here's how to set it up in VSCodium:

#### Installation

1. **Install the Extension**:
   - Open VSCodium and navigate to the Extensions panel (`Ctrl+Shift+X`)
   - Search for "Folder Templates" by Huuums in the OpenVSX marketplace
   - Click Install
   
2. If the extension is not available in OpenVSX:
   - Download the VSIX file from the [GitHub releases page](https://github.com/Huuums/vscode-folder-templates/releases)
   - In VSCodium, go to Extensions panel
   - Click the "..." menu (top-right) and select "Install from VSIX..."
   - Navigate to the downloaded VSIX file and install it

#### Creating Templates

There are two ways to create templates:

1. **File System Templates** (Recommended):
   - Create a `.fttemplates` folder in your workspace or user home directory
   - Inside this folder, create subfolders for each template
   - Add template files with placeholder variables like `<FTName>` in filenames and content

2. **Settings-Based Templates**:
   - Open Settings (`Ctrl+,`)
   - Search for "folderTemplates.structures"
   - Add your templates in JSON format

#### Example Template Structure

For a basic LaTeX document template:

```
.fttemplates/
  └─ LaTeX Paper/
     ├─ <FTName>.tex
     ├─ bibliography.bib
     └─ images/
```

The `<FTName>.tex` file might contain:

```tex
\documentclass{article}
\title{<FTName>}
\author{Your Name}

\begin{document}
\maketitle

\section{Introduction}
% Content here

\end{document}
```

#### Using Templates

1. Right-click in the Explorer panel
2. Select "Create New Folder from Template" or "Create New File from Template"
3. Choose your template from the list
4. Enter a name when prompted (this replaces `<FTName>` in your templates)
5. The extension will create all files and folders with the correct naming

#### Advanced Features

- **Transformers**: Modify variable output with transformers like `<FTName | uppercase>` or `<FTName | camelcase>`
- **Multiple Variables**: Use custom variables like `<CustomVar>` and they'll be prompted
- **Date Placeholders**: Use `<date:YYYY-MM-DD>` to insert the current date in your preferred format
- **Config File**: Create a `.ftsettings.json` file in your template folder for advanced configurations

The Folder Templates extension makes it easy to maintain consistent file structures across your LaTeX projects, saving time and ensuring standardization.

## Snippets

Snippets are reusable code fragments that can dramatically speed up your writing workflow.
VSCodium comes with built-in snippet support, and LaTeX Workshop (which we installed earlier) includes many useful LaTeX-specific snippets. 

### Setting Up Snippets Manager Extension

The "Snippets Manager" extension by zjffun provides a user-friendly interface for creating, editing, and managing snippets, making them much easier to work with.

#### Installation

1. **Install the Extension**:
   - Open VSCodium and navigate to the Extensions panel (`Ctrl+Shift+X`)
   - Search for "Snippets Manager" by zjffun in the OpenVSX marketplace
   - Click Install

2. If the extension is not available in OpenVSX:
   - Download the VSIX file from the [GitHub releases page](https://github.com/zjffun/vscode-snippets-manager/releases)
   - In VSCodium, go to Extensions panel
   - Click the "..." menu (top-right) and select "Install from VSIX..."
   - Navigate to the downloaded VSIX file and install it

#### Using Snippets Manager

1. **Open Snippets Manager**:
   - Use `Ctrl+Shift+P` and type "Snippets Manager: Open"
   - Or click the Snippets Manager icon in the activity bar

2. **Create New Snippets**:
   - Click the "+" button in Snippets Manager
   - Select the language (e.g., latex, markdown)
   - Fill in the snippet details:
     - Name: A descriptive name
     - Prefix: The text you'll type to trigger the snippet
     - Body: The content that will be inserted
     - Description: Optional explanation

3. **Create Snippets from Selection**:
   - Select text in your editor
   - Right-click and choose "Create Snippet from Selection"
   - Complete the snippet details

4. **Edit Existing Snippets**:
   - Double-click on any snippet in Snippets Manager
   - Modify any field as needed
   - Save your changes

### LaTeX Snippets

LaTeX Workshop provides many helpful snippets out of the box.
Here are some useful examples:

1. **Environment Snippets**:
   - Type `BEQ` + Tab → Creates an equation environment
   - Type `BSEQ` + Tab → Creates an equation* environment
   - Type `BAL` + Tab → Creates an align environment
   - Type `BSAL` + Tab → Creates an align* environment

2. **Sectioning Snippets**:
   - `SCH` + Tab → `\chapter{}`
   - `SSE` + Tab → `\section{}`
   - `SSS` + Tab → `\subsection{}`

3. **Math Snippets**:
   - `__` + Tab → Creates subscript `_{}`
   - `**` + Tab → Creates superscript `^{}`
   - `...` + Tab → Inserts `\dots`

4. **Font Commands**:
   - `FBF` + Tab → `\textbf{}`
   - `FIT` + Tab → `\textit{}`
   - `MRM` + Tab → `\mathrm{}`

### Creating Custom Snippets Manually

If you prefer not to use Snippets Manager, you can create snippets manually:

1. Open Command Palette (`Ctrl+Shift+P`)
2. Type "Snippets: Configure User Snippets"
3. Select "New Global Snippets file" or a language-specific one
4. Enter a name for your snippets file
5. Add your snippets in JSON format:

```json
{
  "My Theorem Environment": {
    "prefix": "thm",
    "body": [
      "\\begin{theorem}",
      "\t$1",
      "\\end{theorem}",
      "$0"
    ],
    "description": "Create a theorem environment"
  }
}
```

In snippet bodies:
- `$1, $2, etc.` are tab stops
- `$0` is the final cursor position
- `${1:default}` provides default text
- `$TM_SELECTED_TEXT` inserts selected text when triggered

The combination of Snippets Manager and LaTeX Workshop's built-in snippets makes writing LaTeX documents in VSCodium much faster and more efficient.

## Pandoc

[Pandoc](https://pandoc.org/) is a powerful universal document converter that can transform files between dozens of formats including Markdown, LaTeX, HTML, Word documents (DOCX), and PDF. It's especially valuable for academic writing, providing robust support for citations, cross-references, and complex document structures.

### Setting Up Pandoc

Before using Pandoc extensions in VSCodium, you need to install Pandoc itself:

#### Installation

1. **Install Pandoc**:
   - **Windows**: 
     - Download the installer from [Pandoc's download page](https://pandoc.org/installing.html)
     - Alternatively, use Chocolatey: `choco install pandoc`
   - **MacOS**:
     - Download the package installer from [Pandoc's download page](https://pandoc.org/installing.html)
     - Alternatively, use Homebrew: `brew install pandoc`
   - **Linux**:
     - Use your distribution's package manager (e.g., `sudo apt install pandoc`)
     - Or download from [Pandoc's download page](https://pandoc.org/installing.html)

2. **Install LaTeX for PDF Output** (Optional but Recommended):
   - **Windows**: Install [MiKTeX](https://miktex.org/)
   - **MacOS**: Install [BasicTeX](https://www.tug.org/mactex/morepackages.html) or [MacTeX](https://www.tug.org/mactex/)
   - **Linux**: Install TeX Live with your package manager (e.g., `sudo apt install texlive`)

3. **Verify Installation**:
   Open the VSCodium terminal and run:
   ```bash
   pandoc --version
   ```

### VSCodium Pandoc Integration

For streamlined document conversion in VSCodium, you can use the Pandemics extension available on Open VSX.

#### 1. Installing the Pandemics Extension

1. **Install the Extension**:
   - Open VSCodium and navigate to the Extensions panel (`Ctrl+Shift+X`)
   - Search for "pandemics" in the OpenVSX marketplace
   - Click Install to add the extension by "pandemics"

   If you have any issues finding the extension:
   - Visit [Open VSX Registry](https://open-vsx.org/extension/pandemics/pandemics) directly
   - Download the VSIX file
   - In VSCodium, click the "..." menu (top-right of Extensions panel)
   - Select "Install from VSIX..." and navigate to the downloaded file

2. **Verify Installation**:
   - After installation, you should see Pandoc-related commands in the command palette
   - Open the command palette with `Ctrl+Shift+P`
   - Type "pandoc" to see available commands

#### 2. Using Pandemics for Document Conversion

1. **Basic Usage**:
   - Open a Markdown file in VSCodium
   - Access the command palette (`Ctrl+Shift+P`)
   - Type "pandoc" and select the desired output format:
     - PDF
     - Word document (DOCX)
     - HTML
     - Other supported formats
   - The converted file will be created in the same directory as your source file

2. **Configure Conversion Options** (if available):
   - Open User Settings (JSON) with `Ctrl+Shift+P` → "Preferences: Open User Settings (JSON)"
   - Add Pandoc-specific settings to customize output:
   ```json
   "pandemics.pandocOptions": {
     "pdf": "--pdf-engine=xelatex -V geometry:margin=1in",
     "docx": "",
     "html": "-s --mathjax --toc"
   }
   ```

#### 3. Citation Management

For academic writing with citations, you can use BibTeX files with Pandoc:

1. **Create a Bibliography File**:
   - Create a `.bib` file with your references (or export from Zotero)
   - Example `references.bib`:
   ```bibtex
   @article{smith2020,
     author = {Smith, John},
     title = {Example Title},
     journal = {Journal of Examples},
     year = {2020},
     volume = {1},
     pages = {1--10}
   }
   ```

2. **Using Citations in Markdown**:
   - In your Markdown file, add a YAML header:
   ```yaml
   ---
   title: "My Academic Paper"
   author: "Your Name"
   bibliography: ["references.bib"]
   csl: "chicago-author-date.csl"
   ---
   ```
   - Add citations in your text:
     - `@smith2020` for in-text citation (Smith 2020)
     - `[@smith2020]` for parenthetical citation [(Smith 2020)]
     - `[@smith2020, p. 23]` to include page numbers

3. **Process with Pandoc**:
   - When converting, include the `--citeproc` flag:
   ```bash
   pandoc document.md -o document.pdf --citeproc
   ```
   - This will automatically process the citations and generate a bibliography

### Academic Workflow Tips

1. **Document Structure**:
   - Use Markdown headings (`#`, `##`, etc.) for document structure
   - Pandoc will convert these to appropriate sectioning in output formats

2. **Cross-References**:
   - Use `{#sec:id}` after headings to create section IDs
   - Reference them with `@sec:id` in your text

3. **Bibliography Management**:
   - Keep your BibTeX (.bib) files in your project directory
   - Use Zotero with Better BibTeX for easy bibliography management
   - Specify citation style with CSL files (available at [Zotero Style Repository](https://www.zotero.org/styles))

4. **Common Conversion Commands**:
   - PDF: `pandoc input.md -o output.pdf --citeproc --bibliography=references.bib`
   - DOCX: `pandoc input.md -o output.docx --citeproc --bibliography=references.bib`
   - LaTeX: `pandoc input.md -o output.tex --citeproc --bibliography=references.bib`

5. **Templates and Styling**:
   - Create a reference DOCX file for Word styling: `pandoc -o reference.docx --print-default-data-file reference.docx`
   - Create a custom LaTeX template: `pandoc -D latex > template.latex`
   - Customize templates for consistent academic formatting

The combination of Pandoc with these VSCodium extensions provides a powerful academic writing environment that balances the simplicity of Markdown with the formatting capabilities of professional document systems.

## Python

If you are unsure if you have Python 3 already, run the following command in the terminal (open the terminal in VSCodium with `ctrl + backtick`):

```bash
python3 --version
```

If you get a version number, that is the version you have installed.

### Installation

Install [Python 3](https://www.python.org/downloads/) for your operating system.
Once this process completes, run the command given above to confirm installation by checking the version number.

If you have not already, add the following extensions to VSCodium:

- Python
- Pylint

These will allow you to easily run Python scripts as well as detect syntax/type errors.

### Jupyter Notebooks

[Jupyter Notebooks](https://jupyter.org/) provide an interactive way to write and execute code, create visualizations, and document your work all in one place. VSCodium offers excellent support for Jupyter Notebooks through extensions.
You can find more information about Jupyter Notebooks in the [Jupyter Notebooks Documentation](jupyter.md).

To get started with Jupyter Notebooks in VSCodium:

1. Install the required packages:
```bash
pip install jupyter notebook ipykernel
```

2. Install VSCodium extensions:
   - Open the Extensions tab (`ctrl + shift + x`) and install the following extension:
     * "Jupyter" by ms-toolsai (provides core Jupyter notebook support)
   - Optional but recommended extensions:
     * "Jupyter Keymap" by ms-toolsai (adds Jupyter keyboard shortcuts)
     * "Jupyter Slide Show" (for creating presentations from notebooks)

Once installed, you can:
- Create new notebooks using `ctrl + shift + p` and typing "Jupyter: Create New Blank Notebook"
- Open existing `.ipynb` files directly in VSCodium
- Run code cells using `shift + enter`
- Add markdown cells for documentation
- View rich output including plots and visualizations directly in VSCodium