# LaTeX

This document will provide information for installing LaTeX and setting up the `texmf` directory.
When relevant, the instructions will be divided by operating system.
If your operating system is not represented, or you are having trouble with any of the commands, consider opening an issue above, checking to make sure that your issue has not already been raised (search for both "open" and "closed" issues).

> **Note for beginners**: Many instructions in this guide use terminal commands. If you're new to using the terminal, see our [Terminal Guide](terminal.md) for help opening and using the terminal on your operating system.

## Installation

If you have not already set up LaTeX, you will have to install [MacTex](https://www.tug.org/mactex/) if you are on MacOS, [TexLive](https://www.tug.org/texlive/windows.html) if you are on Windows, or run the following if you are on Debian or Arch Linux, respectively:

```
sudo apt-get install texlive-full
sudo pacman -S texlive-most
```

It is preferable to install the "full" as opposed to "basic" set of LaTeX packages so that you never need to think about what `.sty` files you have installed ("full" should be installed by default if you are not presented with an option).

If you have installed LaTeX in the past but are uncertain whether you have the right packages installed, you can run the following commands line by line in the terminal:

```
latexmk -v
biblatex -v
biber -v
synctex -v
```

So long as each of these commands returns a version number, you should not need to install LaTeX (though you may still be missing packages if you installed "basic" in the past).
Otherwise, you may need to install LaTeX as described above, or uninstall and reinstall to clean things up if it has been a while.
Note that LaTeX is fairly big, so wait to do this when you have time and a stable internet connection.

## Texmf

The next step is to create the `texmf` directory in the appropriate location depending on your operating system.
This way you can store global files of the following kinds:

  - `.bst` style files for generating bibliographies.
  - `.cls` class files for generating documents that conform to a formatting standard (often provided by journals).
  - `.bib` file with your complete Zotero database.

Whereas the `bst` subdirectory contains some bibliographic style files (you may wish to add others), the `latex` subdirectory contains the class files which you can use to typeset LaTeX documents (often provided by journals).
Alternatively, you can always include the relevant style or class files in the local project directory.

The subsections below will describe how to set up the `texmf` directory for the following operating systems:

- [MacOS](#MacOS)
- [Windows](#Windows)
- [Linux](#Linux)

An option will be provided to use [Git](https://github.com/benbrastmckie/VSCodium/blob/master/docs/git.md) as well as a method that avoids using the terminal.

## MacOS

The `texmf` directory lives in the (user) `Library` directory (as opposed to the system `Library` directory) which is hidden by default on MacOS.
To locate the `Library` directory in Finder, hit `cmd + shift + h` to go to the `Home` directory, `cmd + j` to open an options window, and check ‘show Library folder’.

You will now need to copy the [texmf](https://github.com/benbrastmckie/VSCodium/tree/master/texmf) directory into your `Library` directory if it does not exist already.
The following sections will describe how to clone the repository (or your fork of it) or else download a zip.

### Clone

> **Note:** If you have already cloned a fork of this repository as described in [Git](https://github.com/benbrastmckie/VSCodium/blob/master/docs/git.md), you can run `mv location/of/clone ~/Library/texmf` in place of the four command below, replacing 'location/to/clone' with appropriate path.
> Alternatively, no harm will come from cloning another copy into `Downloads` as described below.

To clone this repository and move the `texmf` directory to the appropriate location, run the following commands in the terminal:

```
cd ~/Downloads
git clone https://github.com/benbrastmckie/VSCodium.git
mv VSCodium/texmf ~/Library/texmf
find ~/Library/texmf -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'
```

The final command will display the contents of the `texmf` directory and is optional.
You are now free to delete the remnants of the `VSCodium` repository that you cloned into `Downloads` with the following command:

```
rm -r ~/Downloads/VSCodium
```

### Zip

If you don't want to use the terminal command above, you can download a `.zip` file by clicking the 'Code' button [here](https://github.com/benbrastmckie/VSCodium/tree/master).
You will then need to run the `.zip` file, extracting the contents to your `Downloads` directory, or elsewhere.
Navigate to this directory, opening it to find the `texmf` directory.
You can then move this directory to `~/Library/`.

## Windows

> **Note:** If you have already cloned a fork of this repository as described in [Git](https://github.com/benbrastmckie/VSCodium/blob/master/docs/git.md), you can run `move location/of/clone ~/texmf` in place of the four command below, replacing 'location/to/clone' with appropriate path.
> Alternatively, no harm will come from cloning another copy into `Downloads` as described below.

Windows does not come with Git installed by default.
Go to the [Git Website](https://git-scm.com/) to download and install the version for Windows.
Once the installation is complete, open the terminal and run `git --version` to confirm that the installation was successful.

To clone this repository and move the `texmf` directory to the appropriate location, run the following commands in the terminal:

```
cd ~/Downloads
git clone https://github.com/benbrastmckie/VSCodium.git
move VSCodium/texmf ~/texmf
tree /F
```

The final command will display the contents of the `texmf` directory and is optional.
You are now free to delete the remnants of the 'VSCodium' repository that you cloned into 'Downloads' with the following command:

```
rmdir /S ~/Downloads/VSCodium
```

## Linux

> **Note:** If you have already cloned a fork of this repository as described in [Git](https://github.com/benbrastmckie/VSCodium/blob/master/docs/git.md), you can run `mv location/of/clone ~/Library/texmf` in place of the four command below, replacing 'location/to/clone' with appropriate path.
> Alternatively, no harm will come from cloning another copy into `Downloads` as described below.

To clone this repository and move the `texmf` directory to the appropriate location, run the following commands in the terminal:

```
cd ~/Downloads
git clone https://github.com/benbrastmckie/VSCodium.git
mv VSCodium/texmf ~/texmf
find ~/texmf -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'
```

The final command will display the contents of the `texmf` directory and is optional.
You are now free to delete the remnants of the 'VSCodium' repository that you cloned into 'Downloads' with the following command:

```
rm -r ~/Downloads/VSCodium
```

## Latexmk Configuration

The `.latexmkrc` file allows you to customize how LaTeX compiles your documents, providing powerful control over the build process.
A reference configuration file is provided in [`assets/.latexmkrc`](https://github.com/benbrastmckie/VSCodium/blob/master/assets/.latexmkrc) with optimized settings for organizing build artifacts.

### Key Features

The provided `.latexmkrc` configuration includes:

- **Build Directory Organization**: All auxiliary files (`.aux`, `.log`, `.synctex.gz`, etc.) are automatically created in a `build/` subdirectory, keeping your project root clean.
- **Draft Mode Support**: Enable faster compilation during editing by setting `LATEXMK_DRAFT_MODE=1`.
- **Automatic Cleanup**: Failed builds automatically clean auxiliary files to prevent corruption from propagating.
- **File Watcher Debounce**: 2-second delay after file changes prevents race conditions during rapid saves.
- **Compilation Loop Prevention**: Maximum of 5 recompilation attempts to avoid infinite loops.
- **Build Logging**: Success and failure events are logged to `build/compile.log` for diagnostics.

### Installation Options

You can use the `.latexmkrc` file either globally (for all your LaTeX projects) or locally (per-project basis).

#### Global Installation

To apply these settings to all your LaTeX projects, copy the file to your home directory:

**MacOS and Linux:**

```bash
cp assets/.latexmkrc ~/.latexmkrc
```

**Windows:**

```cmd
copy assets\.latexmkrc %USERPROFILE%\.latexmkrc
```

With a global `.latexmkrc`, all LaTeX projects will use the `build/` directory for auxiliary files by default.

#### Local Installation (Per-Project)

To apply settings to a specific project, copy the file to the project's root directory:

**MacOS and Linux:**

```bash
cp assets/.latexmkrc /path/to/your/project/.latexmkrc
```

**Windows:**

```cmd
copy assets\.latexmkrc C:\path\to\your\project\.latexmkrc
```

Local `.latexmkrc` files override global settings, allowing per-project customization.

### Usage Examples

**Standard compilation:**

```bash
latexmk -pdf document.tex
```

This will compile `document.tex` and place all auxiliary files in the `build/` subdirectory.

**Draft mode (faster compilation):**

```bash
LATEXMK_DRAFT_MODE=1 latexmk -pdf document.tex
```

**Continuous preview mode:**

```bash
latexmk -pvc -pdf document.tex
```

This watches for file changes and automatically recompiles (with 2-second debounce).

**Clean auxiliary files:**

```bash
latexmk -c
```

Removes all generated auxiliary files from the `build/` directory.

**Clean all generated files (including PDF):**

```bash
latexmk -C
```

### VS Codium Integration

The LaTeX Workshop extension in VS Codium automatically respects `.latexmkrc` settings.
With the provided configuration, the extension will:

- Create a `build/` directory automatically
- Place all auxiliary files in `build/`
- Keep your project root clean with only source files
- Use the configured PDF viewer settings

No additional VS Codium configuration is needed - the extension reads `.latexmkrc` automatically.

### Customization

You can modify the `.latexmkrc` file to suit your workflow:

**Change build directory name:**

```perl
$out_dir = 'output';    # Use 'output' instead of 'build'
$aux_dir = 'output';
```

**Use biber instead of bibtex:**

```perl
$bibtex_use = 2;  # Use biber (for biblatex)
```

**Adjust debounce delay:**

```perl
$sleep_time = 3;  # Wait 3 seconds instead of 2
```

**Disable draft mode:**

Remove or comment out the draft mode section if not needed.

### Troubleshooting

**Build directory not created:**

If the `build/` directory isn't automatically created, run:

```bash
mkdir -p build
```

**VS Codium not using .latexmkrc:**

Ensure your VS Codium LaTeX Workshop settings use `latexmk`:

```json
"latex-workshop.latex.recipes": [
  {
    "name": "latexmk",
    "tools": ["latexmk"]
  }
]
```

**Auxiliary files still in root directory:**

Check that you don't have conflicting settings in VS Codium's `settings.json` that override `$out_dir`.

**Permission errors:**

Ensure the project directory has write permissions for creating the `build/` subdirectory.
