# LaTeX

This document will provide information for installing LaTeX and setting up the `texmf` directory.
When relevant, the instructions will be divided by operating system.
If your operating system is not represented, or you are having trouble with any of the commands, consider opening an issue above, checking to make sure that your issue has not already been raised (search for both "open" and "closed" issues).

## Introduction

If you have not already set up LaTeX, you will have to install [MacTex](https://www.tug.org/mactex/) if you are on MacOS, [TexLive](https://www.tug.org/texlive/windows.html) if you are on Windows, or run the following if you are on Debian or Arch Linux, respectively:

```
sudo apt-get install texlive-full
sudo pacman -S texlive-most
```

It is preferable to install the "full" as opposed to "basic" set of LaTeX packages so that you never need to think about what `.sty` files you have installed ("full" should be installed by default if you are not presented with an option).

If you have installed LaTeX in the past but are uncertain whether you have the right packages installed, you can run the following commands in the terminal (on MacOS, hit `Cmd + Space` and type 'terminal'):

```
latexmk -v
biblatex -v
biber -v
synctex -v
```

So long as each of these commands returns a version number, you should not need to install LaTeX (though you may still be missing packages if you installed "basic" in the past).
Otherwise, you may need to install LaTeX as described above, or uninstall and reinstall to clean things up if it has been a while.
Note that LaTeX is fairly big, so wait to do this when you have time and a stable internet connection.

The final step is to create the `texmf` directory in the appropriate location depending on your operating system.
This way you can store global files of the following kinds:

  - `.bst` style files for generating bibliographies.
  - `.cls` class files for generating documents that conform to a formatting standard (often provided by journals).
  - `.bib` file with your complete Zotero database.

Whereas the `bst` subdirectory contains some bibliographic style files (you may wish to add others), the `latex` subdirectory contains the class files which you can use to typeset LaTeX documents (often provided by journals).
Alternatively, you can always include the relevant style or class files in the local project directory.

The following subsections will describe how to set up the `texmf` directory for the following operating systems:

- [MacOS](#MacOS)
- [Windows](#Windows)
- [Linux](#Linux)

<!-- TODO: simplify below -->

An option will be provided to use [Git](https://github.com/benbrastmckie/VSCodium/blob/master/docs/git.md) as well as a method that avoids using the terminal.

## MacOS

The `texmf` directory lives in the (user) `Library` directory (as opposed to the system `Library` directory) which is hidden by default on MacOS.
To locate the `Library` directory in Finder, hit `cmd + shift + h` to go to the `Home` directory, `cmd + j` to open an options window, and check ‘show Library folder’.

You will now need to copy the [texmf](https://github.com/benbrastmckie/VSCodium/tree/master/texmf) directory into your `Library` directory if it does not exist already.
The best way to do this is to begin by forking this repository on GitHub as described in the documentation for [Git](https://github.com/benbrastmckie/VSCodium/blob/master/docs/git.md).
If you have not already forked the repository and don't want to do so now, you could clone this repository or download a zip.
These latter methods will be described below.

### Clone

To clone this repository and move the `texmf` directory to the appropriate location, begin by opening the terminal with `Cmd + Space` typing 'terminal'.
You can then run the following commands, cutting and pasting each line into the terminal and hitting `return` before proceeding to the next line:

```
cd ~/Downloads
git clone https://github.com/benbrastmckie/VSCodium.git
mv VSCodium/texmf ~/Library/texmf
find ~/Library/texmf -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'
```

The final command will display the contents of the `texmf` directory and is optional.
The `bst` subdirectory contains some bibliographic style files (you may wish to add others).
The `latex` subdirectory contains the class files which you can use to typeset LaTeX documents (often provided by journals).
Alternatively, you can always include the relevant style or class files in the local project directory.

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

For some reason Windows does not come with Git installed by default.
Go to the [Git Website](https://git-scm.com/) to download and install the version for Windows.
Once the installation is complete, open the terminal and run `git --version` to confirm that the installation was successful.

Next you will need to copy the [texmf](https://github.com/benbrastmckie/VSCodium/tree/master/texmf) directory into your home directory if it does not exist already.
The best way to do this is to begin by forking this repository on GitHub as described [below](#Git).

If you don't want to fork this repository, another option is to directly clone this repository, moving the `texmf` directory to the appropriate location (this is slightly easier but does not backup your configuration).
To do so, open the terminal and run the following commands:

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

The `texmf` directory lives in the user's home directory on both Linux and Windows.
You will need to copy the [texmf](https://github.com/benbrastmckie/VSCodium/tree/master/texmf) directory into your home directory if it does not exist already.
The best way to do this is to begin by forking this repository on GitHub as described [below](#Git).

If you don't want to fork this repository, another option is to directly clone this repository, moving the `texmf` directory to the appropriate location (this is slightly easier but does not backup your configuration).
To do so, open the terminal and run the following commands:

```
cd ~/Downloads
git clone https://github.com/benbrastmckie/VSCodium.git
mv VSCodium/texmf ~/texmf
find ~/texmf -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'
```

The final command will display the contents of the `texmf` directory and is optional.
The `bst` subdirectory contains some bibliographic style files (you may wish to add others).
The `latex` subdirectory contains the class files which you can use to typeset LaTeX documents (often provided by journals).
Alternatively, you can always include the relevant style or class files in the local project directory.

You are now free to delete the remnants of the 'VSCodium' repository that you cloned into 'Downloads' with the following command:

```
rm -r ~/Downloads/VSCodium
```
