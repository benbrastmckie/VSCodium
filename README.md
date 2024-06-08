# Introduction

This repository aims to gather resources for using VSCode to write in LaTeX, Markdown, and python.
Whereas TexShop and TexMaker are painfully austere, offering none of the resources of a modern editor (e.g., LSP support, snippets, git integration, etc.), Overleaf leaves its users stuck in the browser, and [NeoVim](https://github.com/benbrastmckie/.config) is much more difficult to install, configure, and learn to use, VSCode offers a nice sweet of features while being extremely accessible.
The instructions below will aim to streamline the process of adopting VSCode as your daily driver for working with LaTeX and Mardown with Python as a bonus.
This configuration provides a place to start and easily adaptable and extensible.

# Installation

VSCode is a free and open source project with a large ecosystem of plugins.
Download and install [VSCode](https://code.visualstudio.com/) for your operating system.
Once installed, open the "Extensions" tab on the top left, or hit `ctrl + shif + x`.
Search for and install the following plugins:
  - LaTeX Workshop
  - Gruvbox Theme
There are many other themes and plugins which you can explore.
For instance, 'Toggle Zen mode' eliminates distractions or you can install 'Pomodoro Timer' if you want.
Some other popular themes include 'Tokyo Night', 'Atom One Dark', and 'Catppuccin'.
It is easy to switch between the themes that you have installed with `ctrl + shift + p` and typing 'Color Theme'.

# Configuration

Once installed, you can configure VSCode in one of two ways:

1. Cut and paste the contents of `settings.json` into the appropriate configuration file in VSCode.
2. Fork this repository, cloning the contents into the appropriate folder on your machine.

Option 2 will copy the contents of this repository into a repository that is all your own.
This will allow you to backup your configuration by pushing any changes that you make to the fork that you created.
Additionally, you can easily clone your custom configuration down onto other machines, making your configuration reproducible.

Option 1 will achieve similar results but will not allow you to backup your configuration on GitHub.
Of course, you could always create a new repository to backup your configuration at a later date, or you could backup your configuration in some other way.
This option avoids having to run git commands in the terminal.

## Option 1: Cut and Paste

Open VSCode, hitting `ctrl + shift + p` and typing 'Preferences: Open User Settings (JSON)'.
Copy the contents of [settings.json](https://github.com/benbrastmckie/VSCode/blob/master/settings.json) into this file (you can replace the empty braces).
Save the document, confirming that the changes have taken place (e.g., numbered lines should wrap).

## Option 2: Forked Repository

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

## SSH Key

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

# Snippets

# Markdown

# Python
