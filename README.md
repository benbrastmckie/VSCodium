# [Introduction](#Table-of-Contents)

This repository gathers resources for using [VSCodium](https://vscodium.com/) (the open source and **private** fork of [VS Code](https://code.visualstudio.com/)) to write in [LaTeX](https://www.latex-project.org/), [Markdown](https://www.markdownguide.org/), [Python](https://www.python.org/), or any programming languages that you might want to use.

## Motivation

VSCodium offers a nice suite of features while being extremely accessible and easy to configure.
By contrast, TexShop and TexMaker do not offer the resources provided by modern IDEs (e.g., LSP support, snippets, Git integration, syntax highlighting, etc.), Overleaf is limited to the browser and requires internet access, and [NeoVim](https://github.com/benbrastmckie/.config) is much more difficult to install, configure, and learn to use.

The instructions below aim to streamline the process of adopting VSCodium as your daily driver for composing and editing text of all kinds.
Even if you are new to LaTeX, this configuration provides a place to start with all the information and instructions that you will need in one place.
The configuration is modular and easy to extend to include further utilities for writing, taking notes, managing your workflow, staying organized, or for working with other languages such as Python etc. (there is a large ecosystem of plugins).

### Topics

Resources will be provided for how to use the following with VSCodium:

- [LaTeX](https://www.latex-project.org/): A document preparation system for high-quality typesetting
- [Zotero](https://www.zotero.org/): A free reference manager to organize your research papers and citations
- [Git](https://git-scm.com/): Version control system for tracking changes and collaborating with others
- [Python](https://www.python.org/): Popular programming language for data analysis and scientific computing
- [Jupyter Notebooks](https://jupyter.org/): Interactive computing environment for data science and research

### Issues

If you run into trouble you can open an issue by clicking the [issues tab](https://github.com/benbrastmckie/VSCodium/issues) above, checking first to see that your issue was not already answered (search for both open and closed issues).
Since future users may find the responses to your issue helpful, GitHub issues are a nice way to not only solve the problems that you are facing, but to contribute to the project by expanding its surrounding documentation.
With this in mind, make sure to appropriately name the issue you create, providing a careful description of the problem and what you have tried already.
It is also important to stay on topic, opening new issues if you have separate problems rather than lumping them altogether.

If you find any errors in this documentation, you are welcome to submit a pull request by directly editing this `README.md` [document](https://github.com/benbrastmckie/VSCodium/blob/master/README.md) (click the edit icon in the top right corner).
That way your changes will be able to be easily reviewed and integrated into the project.
If you feel that certain information is missing or would otherwise be helpful to include as a part of this project, don't hesitate to create an issue with your suggestions.

### LaTeX Screenshot

![Screenshot of the configuration](images/latex.png)

## [Table of Contents](#Introduction)

> **Note:** To facilitate navigation, section headers are linked back to the table of contents.

This guide covers the installation and configuration of VSCodium along with a variety of tools for academic writing and research.

### Main Sections

- [Introduction](#Introduction): Overview of the VSCodium academic writing setup
  - [Motivation](#Motivation): Why choose VSCodium over other editors
  - [Topics](#Topics): Key technologies covered in this guide
  - [Issues](#Issues): How to get help and contribute
- [Installation](#Installation): Install VSCodium and essential extensions
- [Configuration](#Configuration): Add the `settings.json` file
- [Customization](#Customization): Personalize your VSCodium environment
  - [Themes](#Themes): Visual customization options
  - [Custom Keyboard Shortcuts](#Custom-Keyboard-Shortcuts): Improve your workflow
- [Toolchain](#Toolchain): A comprehensive collection of tools for academic writing

### Extended Documentation

You can find detailed guides on specific topics here:

- **[LaTeX Guide](docs/latex.md)**: Complete setup and configuration for LaTeX document preparation
- **[Zotero Integration](docs/zotero.md)**: Connect your reference manager with VSCodium
- **[Git Workflow](docs/git.md)**: Version control and collaboration
- **[Theme Gallery](docs/themes.md)**: Visual customization options for your editor
- **[Keyboard Shortcuts](docs/keymaps.md)**: Custom keybindings for improved productivity
- **[Tools Reference](docs/tools.md)**: Detailed guide to Markdown, Templates, Snippets, Pandoc, Python, and Jupyter
- **[Jupyter Notebooks](docs/jupyter.md)**: Interactive computing and data visualization

### Directory Structure

This repository is organized as follows:

```
VSCodium/
├── README.md                     # Main documentation
├── settings.json                 # Main configuration file
├── docs/                         # Detailed documentation
│   ├── git.md                    # Git integration guide
│   ├── jupyter.md                # Jupyter notebooks
│   ├── keymaps.md                # Keyboard shortcuts
│   ├── latex.md                  # LaTeX setup and usage
│   ├── themes.md                 # Theme configuration
│   ├── tools.md                  # Tools reference
│   └── zotero.md                 # Zotero integration
├── images/                       # Screenshots and images
│   └── latex.png                 # LaTeX editor screenshot
├── templates/                    # LaTeX templates
│   ├── Glossary.tex              # Template for glossaries
│   ├── HandOut.tex               # Handout template
│   ├── Letter.tex                # Letter template
│   ├── PhilBeamer.tex            # Beamer presentation
│   ├── PhilPaper.tex             # Academic paper template
│   ├── formal_template/          # Formal paper structure
│   └── subfiles_template/        # Multi-file document template
└── texmf/                        # TeX resources
    ├── bibtex/                   # Bibliography resources
    └── tex/                      # LaTeX classes and styles
```

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

## [Configuration](#Table-of-Contents)

> **NOTE:** If you are familiar with Git or interested in giving it a try, the best way to proceed is to fork this repository, using Git to clone your fork onto your machine.
> These details will be described in the documentation for [Git](https://github.com/benbrastmckie/VSCodium/blob/master/docs/git.md).
> In addition to streamlining the process, this method will allow you to easily backup your configuration as you make changes, tracking its complete history.
> Alternatively, the following brute-force method is very easy, but does not backup your configuration (this can be added later with a little extra hassle).

Open VSCodium and hit `ctrl + shift + p`, typing 'Preferences: Open User Settings (JSON)'.
This will open the `settings.json` file where you can declare your configuration.
Replace the entire contents of `settings.json` (including the empty braces) with the entire contents of [this](https://github.com/benbrastmckie/VSCodium/blob/master/settings.json) file.
Save the document with `ctrl + s`, confirming that the changes have taken place (e.g., note that the theme should change).

This completes the basic configuration of VSCodium.

## [Customization](#Table-of-Contents)

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

#### Themes

VSCodium's appearance can be completely transformed with themes, which affect not just colors but also icons and the overall user experience. A well-chosen theme can reduce eye strain during long writing sessions and create a more aesthetically pleasing environment for academic writing.

Some popular themes for academic writing include:

- **Gruvbox Theme**: Warm, retro colors that are easy on the eyes
- **Tokyo Night**: Elegant dark theme with subtle blues and purples
- **Atom One Dark**: Clean, modern interface with good contrast
- **Catppuccin**: Pastel theme with multiple variations

You can switch between installed themes by pressing `Ctrl+Shift+P` and typing "Color Theme".

For detailed instructions on finding, installing, and customizing themes, including theme-specific settings for LaTeX, see our [Themes Guide](docs/themes.md).

### Custom Keyboard Shortcuts

Custom keyboard shortcuts can dramatically improve your workflow for academic writing and LaTeX editing. VSCodium allows you to create custom key combinations for frequently used operations, including:

- Formatting text in LaTeX and Markdown
- Inserting commonly used environments and structures
- Running build commands and previewing documents
- Converting documents using Pandoc

You can access the keyboard shortcuts editor by pressing `Ctrl+K Ctrl+S` or through the Command Palette.

For a comprehensive guide on setting up custom keyboard shortcuts for academic writing, including detailed examples and step-by-step instructions, see our [Keymapping Guide](docs/keymaps.md).

# [Toolchain](#Table-of-Contents)

VSCodium provides a comprehensive toolset for academic writing and research.
For detailed instructions on each tool, refer to the [tools documentation](docs/tools.md) which includes the following sections:

- **[LaTeX](docs/latex.md)**: Setup and configuration for LaTeX document preparation
- **[Zotero](docs/zotero.md)**: Reference management and citation integration
- **[Markdown](docs/tools.md#markdown)**: Simple markup language for notes and documents
- **[Templates](docs/tools.md#templates)**: Ready-to-use LaTeX templates for academic papers
- **[Snippets](docs/tools.md#snippets)**: Reusable code fragments to speed up your writing
- **[Pandoc](docs/tools.md#pandoc)**: Universal document converter for multiple formats
- **[Python](docs/tools.md#python)**: Programming language support for data analysis
- **[Jupyter Notebooks](docs/tools.md#jupyter-notebooks)**: Interactive computing environment

If there is a tool that you are interested in that is not on the list, feel free to open an [issue](https://github.com/benbrastmckie/VSCodium/issues).
