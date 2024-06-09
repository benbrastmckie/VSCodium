# Introduction

This repository aims to gather resources for using VSCode to write in LaTeX, Markdown, and python.
VSCode offers a nice sweet of features while being extremely accessible.
By contrast, TexShop and TexMaker are painfully austere, offering none of the resources of a modern editor (e.g., LSP support, snippets, git integration, etc.), Overleaf leaves its users stuck in the browser, and [NeoVim](https://github.com/benbrastmckie/.config) is much more difficult to install, configure, and learn to use.

The instructions below aim to streamline the process of adopting VSCode as your daily driver for working with LaTeX and Mardown files with Python as a bonus.
This configuration provides a place to start and is easily adaptable and extensible.
If you run into trouble, feel free to open an issue, checking to see that your issue was not already answered.

![Screenshot of the configuration](images/screenshot.png)

## Installation

VSCode is free and open source with a large plugin ecosystem.
Download and install [VSCode](https://code.visualstudio.com/) for your operating system.
Once installed, open the "Extensions" tab on the top left, or hit `ctrl + shif + x`.
Search for and install the plugin 'LaTeX Workshop'.

There are many other themes and plugins which you can explore.
For instance, 'Toggle Zen mode' eliminates distractions or you can install 'Pomodoro Timer' if you want.
You can even install 'Vim' (by vscodevim) to simulate Vim motions in VSCode as well as 'Learn Vim' (by vintharas) to learn how to use Vim.
Some other popular themes include 'Gruvbox Theme', 'Tokyo Night', 'Atom One Dark', and 'Catppuccin'.
It is easy to switch between the themes that you have installed with `ctrl + shift + p` and typing 'Color Theme'.

If you have not already, you will also have to install [MacTex](https://www.tug.org/mactex/) if you are on MacOS, [TexLive](https://www.tug.org/texlive/windows.html) if you are on Windows, or run the following if you are on Debian or Arch Linux, respectively:

```
sudo apt-get install texlive-full
sudo pacman -S texlive-most
```

You can skip this last step if you have already been using LaTeX on your machine.

## Configuration

Once installed, you can configure VSCode in one of three ways:

1. Cut and paste the contents of `settings.json` into the appropriate configuration file in VSCode.
2. Use VSCode's git integration to add a fork of this repository as a remote, pulling down changes.
3. Fork this repository, using the git CLI to clone the contents into the appropriate folder on your machine.

Option 2 and 3 will copy the contents of this repository into a repository that is all your own.
This will allow you to backup your configuration by pushing any changes that you make to the fork that you created.
Additionally, you can easily clone your custom configuration down onto other machines, making your configuration reproducible.

Option 1 will achieve similar results but will not allow you to backup your configuration on GitHub.
Of course, you could always create a new repository to backup your configuration at a later date, or you could backup your configuration in some other way.

### Option 1: Cut and Paste

Open VSCode, hitting `ctrl + shift + p` and typing 'Preferences: Open User Settings (JSON)'.
Copy the contents of [settings.json](https://github.com/benbrastmckie/VSCode/blob/master/settings.json) into this file (you can replace the empty braces).
Save the document, confirming that the changes have taken place (e.g., the theme should change to 'One Monokai').

In case you would like to also backup your configuration using git, you can proceed to Option 2.

### Option 2: Git Integration

In order to create your own copy of this repository, click `Fork` in the top right of this repository.
You will be presented with the choice to make yourself the owner which you should accept.
There is no need to include other branches besides the master branch which will be selected by default.
Do not select "Keep this repository private" unless you want to setup an SSH key (not a bad idea but requires another [few steps](##SSH-Key)) or want to type in you password every time.
It is also nice to keep configuration files public so that you can easily share them with others.

Once you have forked the repository, you can click the `Code` button in the fork that you have created (you should see your username in the address).
If you have setup an SSH Key, you can select the SSH address, copying it to the clipboard.
Otherwise, copy the HTTPS address to the clipboard.

Open `setting.json` in VSCode with `ctrl + shift + p` and typing 'Preferences: Open User Settings (JSON)'. 
Right-click on the file tab to 'Copy Path' to the `settings.json` file.
Open the "Explorer" tab on the top left, navigating to the directory which contains `settings.json`.
Note that you may need to show hidden files by right-clicking inside the search menu that VSCode will open.

Open the "Source Control" tab also on the top left and select "Initialize Repository".
You can then add a remote by clicking the three dots in the top right of the "Source Control" panel, selecting `remote -> add`.
You can then enter the address copied to the clipboard from before, naming the remote "VSCode" or whatever you like.
In the bottom left corner, you will see which branch you are on currently, clicking this branch to change to 'master'.
Next, click on the three dots in the top right corner of the "Source Control" pane to select `Pull, Push -> Pull`.
By changing back to the "Explorer" tab you should be able to see a host of new files.
Open `settings.json` to confirm that this file has been populated with settings.

If you go on to make any changes, you can save the changes by opening the "Source Control" tab, adding a message, and committing your changes.
Once committed, you can push your commits up to your repository with `Pull, Push -> Push`.
Note that unless you have added an [SSH key](##SSH-Key), you will need to enter you GitHub password.
You may also need to configure git by adding your email (whatever you used to open a GitHub account).
To do so, open the terminal in VSCode with `ctrl + backtick` and enter the following:

```
git config --global user.email "your_email@example.com"
```

Once this information has been provided, you should be able to push the changes that you make up to your repository so that they are available to pull down anywhere.

### Option 3: Git CLI

For completeness, here is the manual option, using the standard git command line interface.

Open VSCode, hitting `ctrl + shift + p` and typing 'Preferences: Open User Settings (JSON)'.
Once open, you can hover the mouse over the `settings.json` file to see its path.
Right-click the tab and select 'Copy Path' or hit `alt + ctrl + c` to do the same.
Open the terminal (on MacOS, hit `Cmd + Space` and type 'terminal') and run the following commands, replacing `PATH/TO` with the copied path minus 'settings.json':

```
cd PATH/TO/
ls -a
```

On MacOS, the `PATH/TO/` should be `~/Library/Application Support/Code/User`.
The `ls` command should show the `settings.json` file.
Next remove this file with:

```
rm settings.json
ls -a
```

In order to replace this file, click `Fork` in the top right of this repository.
You will be presented with the choice to make yourself the owner which you should accept.
There is no need to include other branches besides the master branch which will be selected by default.
Do not select "Keep this repository private" unless you want to setup an SSH key (not a bad idea but requires another [few steps](##SSH-Key)) or want to type in you password every time.
It is also nice to keep configuration files public so that you can easily share them with others.

Once you have forked the repository, you can click the `Code` button in the fork that you have created (you should see your username in the address).
If you have setup an SSH Key, you can select the SSH address, copying it to the clipboard.
Otherwise, copy the HTTPS address to the clipboard.

Now initialize git, link the remote repository, and pull down its contents by running each of the following commands:

```
git init
git remote add origin YOUR-FORK'S-ADDRESS
git remote -v
git pull origin master
ls -a
```

You should now see the new `settings.json` file appear along with the `.git` directory.
The `git remote -v` command is optional but will confirm that you succeeded in adding a remote.
If you make any changes to your config, you can push these up to you repository with:

```
git add . 
git commit -m "commit message of your choice"
git push origin master
```

Although it is good to know how to push and pull changes manually, VSCode will automate all of this for you.
Instead of working in the terminal, you can open the "Explorer" tab in VSCode on the top left, navigating to the directory containing `settings.json`.
You may need to turn on hidden files by right-clicking in the menu and selecting "Show Hidden Files".
VSCode should automatically detect that this is a tracked directory.
You can then open the "Source Control" tab on the top left to commit changes, pushing commits up to your repository.

### SSH Key

If you have not already, you can add an SSH key by amending and running the following in the terminal:

```
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```

Hit `return` once, entering your GitHub passphrase in response to the prompt.
Next run:

```
bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
```

Run the following to copy the SSH key to your system clipboard and return to fish:

```
pbcopy < ~/.ssh/id_rsa.pub
fish
```

In the top right corner of your GitHub page, click `Profile -> Settings -> SSH and GPG Keys` selecting `New SSH Key`.
Name the authentication key after the devise you are using, pasting the SSH key from the clipboard into the appropriate field.
Saving the key completes the addition.

Check to make sure that the SSH key is working by pushing commits up to one of your repositories as directed above.
If your SSH key stops working after rebooting, run the following command:

```
ssh-add -K ~/.ssh/id_rsa
```

If you get an error, retry the command above with a lower-case 'k' or without the 'K' altogether.

# Customization

One way to explore further customization is to click the settings gear in the bottom left corner.
By scrolling through, you can explore the many different features that you can change about VSCode where the list will get longer with each plugin that you add.
Although the settings menu is a nice way to see all the options at once, this is not the easiest way to reproduce your configuration.
However, any changes that you make in the settings menu will be stored in the `settings.json` file.
It is by backing up this file with a git repository that you can easily reproduce your configuration without having to remember what settings you had before.

A further avenue for exploring customization is to use ChatGPT.
For instance, if there is something that you would like to change about VSCode, you can ask ChatGPT what you should include in `settings.json` in order to make that change.
In case ChatGPT hallucinates, the false setting will not break anything, but rather will be dimmed with a warning that this setting does not exist.

The following sections will include more specific information about setting up bibliographic support, using markdown, snippets, and pandoc.

## Zotero

## Markdown

## Snippets

## Pandoc

# Git

# Python
