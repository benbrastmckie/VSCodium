# [Introduction](#Table-of-Contents)

This repository gathers resources for using [VSCodium](https://vscodium.com/) (the open source and **private** but otherwise identical version of [VS Code](https://code.visualstudio.com/)) to write in [LaTeX](https://www.latex-project.org/), [Markdown](https://www.markdownguide.org/), or any programming languages that you might want to use.
VSCodium offers a nice suite of features while being extremely accessible and easy to configure.
By contrast, TexShop and TexMaker are painfully austere, offering none of the resources of a modern text editor (e.g., LSP support, snippets, Git integration, syntax highlighting, etc.), Overleaf is limited to the browser and requires internet access, and [NeoVim](https://github.com/benbrastmckie/.config) is much more difficult to install, configure, and learn to use.

The instructions below aim to streamline the process of adopting VSCodium as your daily driver for composing and editing text of all kinds.
Even if you are new to LaTeX and Mardown or do not already have LaTeX installed, this configuration provides a place to start with all the information and instructions that you will need in one place.
The configuration is modular and easy to extend to include further utilities for writing, taking notes, managing your workflow, staying organized, or for working with other languages such as Python etc. (there is a large ecosystem of plugins).

Further resources will also be provided for how to use [Zotero](https://www.zotero.org/) to manage your references with associated PDFs, providing citation key autocompletion within VSCodium.
Additionally, information will be included for how to use [Git](https://git-scm.com/) (a sophisticated version control software that is widely used and already integrated into VSCodium) to manage your projects, backup your work as you go, work on the same project from multiple computers, collaborate with others, and maintain your configuration of VSCodium.
Note that if you want to collaborate with others using Overleaf, it is possible to [add Overleaf projects as a remote](https://www.overleaf.com/learn/how-to/Git_integration#Synchronizing_with_another_remote) from which you can easily push and pull changes without leaving VSCodium.

This repository also aims to provide community support.
For instance, if you run into trouble you can open an issue by clicking the [issues tab](https://github.com/benbrastmckie/VSCodium/issues) above, checking first to see that your issue was not already answered (search for both open and closed issues).
Since future users may find the responses to your issue helpful, GitHub issues are a nice way to not only solve the problems that you are facing, but to contribute to the project by expanding its surrounding documentation.
With this in mind, make sure to appropriately name the issue you create, providing a careful description of the problem and what you have tried already.
It is also important to stay on topic, opening new issues if you have separate problems rather than lumping them altogether.

If you find any errors in this documentation, you are welcome to submit a pull request by directly editing this `README.md` [document](https://github.com/benbrastmckie/VSCodium/blob/master/README.md) (click the edit icon in the top right corner).
That way your changes will be able to be easily reviewed and integrated into the project.
If you feel that certain information is missing or would otherwise be helpful to include as a part of this project, don't hesitate to create an issue with your suggestions.

### LaTeX Screenshot

![Screenshot of the configuration](images/latex.png)

## [Table of Contents](#Introduction)

The follow sections will be devoted to installing and configuring VSCodium.
Additional documentation is provided for installing [LaTeX](https://github.com/benbrastmckie/VSCodium/blob/master/docs/latex.md), [Zotero](https://github.com/benbrastmckie/VSCodium/blob/master/docs/zotero.md), and using [Git](https://github.com/benbrastmckie/VSCodium/blob/master/docs/git.md).

- [Installation](#Installation): install VSCodium and some extensions
  - [Configuration](#Configuration): add the `settings.json` file
  - [Customization](#Customization): methods for customizing your configuration
- [Toolchain](#Toolchain): a collection of tools for academic writing
  - [Templates](#Templates): save and use LaTeX templates
  - [Snippets](#Snippets): save and use snippets
  - [Markdown](#Markdown): use markdown to take notes and export quotes
  - [Pandoc](#Pandoc): convert between file types
  - [Python](#Python): install python along with some extensions
  - [Jupyter Notebooks](#jupyter-notebooks): install python along with some extensions

> **Note:** To facilitate navigation, headers are linked back to the table of contents given here.

## [Installation](#Table-of-Contents)

Although [VS Code](https://code.visualstudio.com/) is free and open source, it is owned by Microsoft and so your data is not private as a result.
By contrast, VSCodium is a community-driven distribution of VS Code that is otherwise identical (compare Chromium to Google Chrome).
To get started, download and install [VSCodium](https://vscodium.com/) for your operating system.

> **Note:** If you prefer to install VS Code, all the same settings will continue to apply, though some of the paths will differ.
> For instance, on MacOS, VS Code stores the `settings.json` file in `~/Library/Application Support/Code/User` instead of in `~/Library/Application Support/VSCodium/User`.

Once installed, open the "Extensions" tab on the top left, or hit `ctrl + shift + x`.
Search for and install the plugins 'LaTeX Workshop' as well as 'Two Monokai Theme' (this is required for the `settings.json` configuration to "just work").
It is easy to switch between themes, where these details will be covered [below](#Customization).

There are many other themes and plugins which you can try out.
You can even install a NeoVim plugin (by asvetliakov) to simulate the Vim motions in VSCodium. 
Here are some additional [resources](https://github.com/benbrastmckie/.config/blob/master/CheatSheet.md#Learning-Vim).
If you are serious about learning to use the Vim motions, you would do best to use [NeoVim](https://github.com/benbrastmckie/.config).

### [Configuration](#Table-of-Contents)

> **NOTE:** If you are familiar with Git or interested in giving it a try, the best way to proceed is to fork this repository, using Git to clone your fork onto your machine.
> These details will be described in the documentation for [Git](https://github.com/benbrastmckie/VSCodium/blob/master/docs/git.md).
> In addition to streamlining the process, this method will allow you to easily backup your configuration as you make changes, tracking its complete history.
> Alternatively, the following brute-force method is very easy, but does not backup your configuration (this can be added later with a little extra hassle).

Open VSCodium and hit `ctrl + shift + p`, typing 'Preferences: Open User Settings (JSON)'.
This will open the `settings.json` file where you can declare your configuration.
Replace the entire contents of `settings.json` (including the empty braces) with the entire contents of [this](https://github.com/benbrastmckie/VSCodium/blob/master/settings.json) file.
Save the document with `ctrl + s`, confirming that the changes have taken place (e.g., note that the theme should change).

This completes the basic configuration of VSCodium.

### [Customization](#Table-of-Contents)

In order to get a better sense of what the options are within VSCodium, click the settings gear in the bottom left corner.
By scrolling through, you can explore the many different features that you can change about VSCodium where the list will get longer with each plugin that you add.

Although the settings menu is a nice way to see all the options at once, this is not the easiest way to save or reproduce your configuration.
However, any changes that you make in the settings menu will be stored in the `settings.json` file.
It is by backing up this settings file that you can easily reproduce your configuration without having to remember what settings you had before or scroll through endless options.

Although you could attempt to backup `settings.json` manually, the Git integration included in VSCodium provides an elegant way to stay backed up as you make changes to your configuration.
These details are described in the documentation provided for [Git](https://github.com/benbrastmckie/VSCodium/blob/master/docs/git.md).

A further avenue for exploring the different ways of customizing VSCodium is to use an LLM.
For instance, if there is something that you would like to change about VSCodium, you can ask what you should include in `settings.json` in order to make that change.

You can easily remove any false settings by deleting those lines from your configuration.
You may also find helpful tutorials on YouTube.

### Themes

VSCodium's appearance can be completely transformed with themes, which affect not just colors but also icons and the overall user experience. Customizing your theme can reduce eye strain during long writing sessions and create a more aesthetically pleasing environment for academic writing.

#### Finding and Installing Themes

1. **Browse Available Themes**:
   - Open the Extensions panel (`Ctrl+Shift+X`)
   - Type "theme" in the search box
   - Use the filters to sort by popularity or rating
   - Preview themes by clicking on them to see screenshots

2. **Recommended Themes for Academic Writing**:
   - **Gruvbox Theme**: Warm, retro colors that are easy on the eyes for long writing sessions
   - **Tokyo Night**: Elegant dark theme with subtle blues and purples
   - **Atom One Dark**: Clean, modern interface with good contrast
   - **Catppuccin**: Pastel theme with multiple variations (Mocha, Macchiato, Frappé, Latte)
   - **Dracula**: Popular dark theme with vibrant accent colors
   - **GitHub Theme**: Light and dark variants matching GitHub's appearance
   - **Winter is Coming**: High-contrast theme with several color variants
   - **Nord**: Arctic-inspired cool color palette

3. **Install a Theme**:
   - Click the "Install" button on the theme's extension page
   - VSCodium may require a reload after installation

#### Switching Between Themes

1. **Using Command Palette**:
   - Press `Ctrl+Shift+P` to open the Command Palette
   - Type "Color Theme" and select "Preferences: Color Theme"
   - Browse the list of installed themes
   - Themes are previewed in real-time as you navigate the list

2. **Using Settings**:
   - Click the gear icon in the bottom left corner
   - Select "Color Theme" from the menu
   - Choose your preferred theme from the list

3. **Quick Switching for Different Times of Day**:
   - Consider setting keybindings to switch between light and dark themes
   - Example keybinding for your `keybindings.json`:
   ```json
   [
     {
       "key": "ctrl+alt+l",
       "command": "workbench.action.selectTheme",
       "args": { "theme": "GitHub Light" }
     },
     {
       "key": "ctrl+alt+d",
       "command": "workbench.action.selectTheme",
       "args": { "theme": "Tokyo Night" }
     }
   ]
   ```

#### Customizing Themes

1. **Fine-Tuning Colors**:
   - Open your `settings.json` file (`Ctrl+Shift+P` → "Preferences: Open User Settings (JSON)")
   - Add a `workbench.colorCustomizations` section:
   ```json
   "workbench.colorCustomizations": {
     "[Tokyo Night]": {
       "editor.background": "#1a1b26",
       "editor.foreground": "#a9b1d6",
       "activityBar.background": "#1a1b26",
       "sideBar.background": "#16161e",
       "editor.lineHighlightBackground": "#292e42"
     }
   }
   ```

2. **Customizing Syntax Highlighting**:
   - Adjust specific syntax elements with `editor.tokenColorCustomizations`:
   ```json
   "editor.tokenColorCustomizations": {
     "[Gruvbox Dark Hard]": {
       "comments": "#928374",
       "strings": "#b8bb26",
       "functions": "#fabd2f",
       "keywords": "#fb4934",
       "variables": "#83a598",
       "textMateRules": [
         {
           "scope": "entity.name.type",
           "settings": {
             "foreground": "#d3869b"
           }
         }
       ]
     }
   }
   ```

3. **Creating Theme-Specific Settings**:
   - Apply specific settings only when using a particular theme:
   ```json
   "[GitHub Light]": {
     "editor.fontSize": 16,
     "editor.lineHeight": 1.6
   },
   "[Tokyo Night]": {
     "editor.fontSize": 15,
     "editor.lineHeight": 1.5
   }
   ```

#### Optimizing Themes for Academic Writing

1. **Font Considerations**:
   - Install a programming font with ligatures for better readability:
     - Fira Code, JetBrains Mono, Cascadia Code, or Iosevka
   - Configure the font in settings:
   ```json
   "editor.fontFamily": "'JetBrains Mono', 'Fira Code', Consolas, monospace",
   "editor.fontLigatures": true,
   "editor.fontSize": 15,
   "editor.lineHeight": 1.6
   ```

2. **Visual Enhancements**:
   - Enable smooth cursor animation for more pleasant writing:
   ```json
   "editor.cursorSmoothCaretAnimation": "on",
   "editor.cursorBlinking": "phase"
   ```
   
   - Configure line highlighting for better focus:
   ```json
   "editor.renderLineHighlight": "all",
   "editor.occurrencesHighlight": true
   ```

3. **LaTeX-Specific Theme Settings**:
   - Some themes offer specific settings for LaTeX syntax highlighting
   - Add these LaTeX-specific customizations to improve the visualization of LaTeX elements:
   ```json
   "editor.tokenColorCustomizations": {
     "[Tokyo Night]": {
       "textMateRules": [
         {
           "scope": "support.function.latex",
           "settings": {
             "foreground": "#bb9af7"
           }
         },
         {
           "scope": "support.function.section.latex",
           "settings": {
             "foreground": "#f7768e",
             "fontStyle": "bold"
           }
         }
       ]
     }
   }
   ```

By selecting and customizing themes to suit your preferences and writing needs, you can create an ideal environment for academic writing in VSCodium that reduces eye strain and enhances productivity.

### Custom Keyboard Shortcuts

One of VSCodium's most powerful customization features is the ability to create custom keyboard shortcuts, which can dramatically improve your workflow for academic writing and LaTeX editing.

#### Viewing and Editing Keyboard Shortcuts

1. **Open the Keyboard Shortcuts Editor**:
   - Press `Ctrl+K Ctrl+S` (press `Ctrl+K`, release, then press `Ctrl+S`)
   - Or via Command Palette (`Ctrl+Shift+P`): type "Preferences: Keyboard Shortcuts"

2. **In the Keyboard Shortcuts Editor**:
   - Browse all available commands
   - Search for specific actions or existing shortcuts
   - See what keys are already assigned
   - Edit or create new bindings

#### Creating Custom Shortcuts

1. **Using the GUI**:
   - Locate the command you want to assign a shortcut to
   - Click the `+` icon that appears when you hover over the command 
   - Press the key combination you want to use
   - Press Enter to confirm

2. **Using JSON for Advanced Configuration**:
   - Open the keybindings JSON file by clicking the `{}` icon in the top-right of the shortcuts editor
   - Or via Command Palette: "Preferences: Open Keyboard Shortcuts (JSON)"
   - Add your custom shortcuts in the JSON format

#### Keyboard Shortcuts JSON Format

The `keybindings.json` file uses the following format:

```json
[
  {
    "key": "ctrl+shift+b",
    "command": "workbench.action.tasks.build",
    "when": "editorTextFocus"
  },
  {
    "key": "alt+l",
    "command": "latex-workshop.build",
    "when": "editorLangId == 'latex'"
  },
  {
    "key": "ctrl+k p",
    "command": "pandoc.renderDocument",
    "when": "editorLangId == 'markdown'"
  }
]
```

Each entry requires:
- `key`: The key combination (required)
- `command`: The command to execute (required)
- `when`: Context when the binding is active (optional but recommended)

To remove an existing keybinding, add a `-` before the command:

```json
{
  "key": "ctrl+b",
  "command": "-editor.action.toggleBold",
  "when": "editorTextFocus"
}
```

#### Context-Specific Keybindings for Academic Writing

For academic writing, you can create shortcuts that only work in specific file types using the `when` clause:

```json
// LaTeX-specific shortcuts
{
  "key": "ctrl+alt+b",
  "command": "editor.action.insertSnippet",
  "args": { "snippet": "\\textbf{${TM_SELECTED_TEXT}$0}" },
  "when": "editorLangId == 'latex'"
},

// Markdown-specific shortcuts
{
  "key": "ctrl+alt+b",
  "command": "editor.action.insertSnippet",
  "args": { "snippet": "**${TM_SELECTED_TEXT}$0**" },
  "when": "editorLangId == 'markdown'"
}
```

Common context conditions include:
- `editorTextFocus`: When the text editor has focus
- `editorHasSelection`: When text is selected
- `resourceExtname == .tex`: When a LaTeX file is open
- `editorLangId == 'latex'`: When editing LaTeX
- `editorLangId == 'markdown'`: When editing Markdown

#### Useful Academic Writing Shortcuts

Here are some examples of helpful keyboard shortcuts for academic writing:

1. **LaTeX Formatting Shortcuts**:
```json
[
  {
    "key": "ctrl+alt+b",
    "command": "editor.action.insertSnippet",
    "args": { "snippet": "\\textbf{${TM_SELECTED_TEXT}$0}" },
    "when": "editorTextFocus && editorLangId == 'latex'"
  },
  {
    "key": "ctrl+alt+i",
    "command": "editor.action.insertSnippet", 
    "args": { "snippet": "\\textit{${TM_SELECTED_TEXT}$0}" },
    "when": "editorTextFocus && editorLangId == 'latex'"
  },
  {
    "key": "ctrl+alt+m",
    "command": "editor.action.insertSnippet",
    "args": { "snippet": "\\begin{math}${TM_SELECTED_TEXT}$0\\end{math}" },
    "when": "editorTextFocus && editorLangId == 'latex'"
  }
]
```

2. **Markdown Shortcuts**:
```json
[
  {
    "key": "ctrl+alt+b",
    "command": "editor.action.insertSnippet",
    "args": { "snippet": "**${TM_SELECTED_TEXT}$0**" },
    "when": "editorTextFocus && editorLangId == 'markdown'"
  },
  {
    "key": "ctrl+alt+i",
    "command": "editor.action.insertSnippet",
    "args": { "snippet": "*${TM_SELECTED_TEXT}$0*" },
    "when": "editorTextFocus && editorLangId == 'markdown'"
  },
  {
    "key": "ctrl+alt+c",
    "command": "editor.action.insertSnippet",
    "args": { "snippet": "`${TM_SELECTED_TEXT}$0`" },
    "when": "editorTextFocus && editorLangId == 'markdown'"
  }
]
```

3. **Pandoc Document Conversion**:
```json
[
  {
    "key": "ctrl+alt+p",
    "command": "workbench.action.terminal.sendSequence",
    "args": { "text": "pandoc \"${file}\" -o \"${fileDirname}/${fileBasenameNoExtension}.pdf\" --pdf-engine=xelatex\n" },
    "when": "editorLangId == 'markdown'"
  },
  {
    "key": "ctrl+alt+d",
    "command": "workbench.action.terminal.sendSequence",
    "args": { "text": "pandoc \"${file}\" -o \"${fileDirname}/${fileBasenameNoExtension}.docx\"\n" },
    "when": "editorLangId == 'markdown'"
  }
]
```

#### Tips for Academic Writing Keybindings

1. **Use consistent patterns across file types**:
   - Maintain the same key combinations for similar actions (like formatting)
   - For example, use `Ctrl+Alt+B` for bold in both LaTeX and Markdown

2. **Leverage snippets in your keybindings**:
   - Create shortcuts that insert frequently used structures
   - Example: Create a shortcut for inserting a new theorem environment

3. **Document your keybindings**:
   - Add comments to your JSON file to remember what each shortcut does
   ```json
   // Citation shortcut
   {
     "key": "ctrl+alt+c",
     "command": "editor.action.insertSnippet",
     "args": { "snippet": "\\cite{$0}" },
     "when": "editorLangId == 'latex'"
   }
   ```

4. **Backup your keybindings file**:
   - Located at:
     - Windows: `%APPDATA%\VSCodium\User\keybindings.json`
     - macOS: `~/Library/Application Support/VSCodium/User/keybindings.json`
     - Linux: `~/.config/VSCodium/User/keybindings.json`
   - Include it in your Git backup alongside settings.json

Custom keyboard shortcuts can significantly enhance your academic writing productivity in VSCodium, especially when working with LaTeX, Markdown, and Pandoc for document conversion.

# [Toolchain](#Table-of-Contents)

Instructions for installing and integrating [LaTeX](https://github.com/benbrastmckie/VSCodium/blob/master/docs/latex.md) and [Zotero](https://github.com/benbrastmckie/VSCodium/blob/master/docs/zotero.md) into your configuration of VSCodium are provided separately for ease.
If you have not already installed those elements, you can do so now.

The following optional sections will provide additional information about how make use of Markdown, templates, snippets, Pandoc, and Python.

## [Markdown](#Table-of-Contents)

Instead of taking notes in LaTeX, Word, or some other note-taking application, you can recover some of the elegance of LaTeX without any of the trouble by writing in Markdown.
The syntax for Markdown is by design as simple as possible, but can still produce a good looking document (think Notion) which you can then convert via Pandoc into other formats.

All that is required to use markdown is to create a file with the `.md` file extension in the "Explorer" tab.
For instance, you might create a 'TODO.md' or 'NOTES.md', etc.

More information on the markdown syntax can be found [here](https://www.markdownguide.org/basic-syntax/).

### Zotero Add-On

Zotero can be used not only to keep the PDFs associated with each citation organised, but to export the highlights and annotations you make with your preferred PDF viewer as markdown files.
In order to include these features, you will need to download the .xpi file for MdNotes as described here, as well as the .xpi file for ZotFile.
By then opening Zotero, navigating to the Tools –> Add-ons menu, clicking the gear symbol, and selecting ‘Install add-on from file’, you can select the .xpi files that you downloaded in order install these features.
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

## [Templates](#Table-of-Contents)

I have included a number of LaTeX templates [here](templates/).

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

## [Snippets](#Table-of-Contents)

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
    ]
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

## [Pandoc](#Table-of-Contents)

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

## [Python](#Table-of-Contents)

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
You can find more information about Jupyter Notebooks in the [Jupyter Notebooks Documentation](docs/jupyter.md).

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

