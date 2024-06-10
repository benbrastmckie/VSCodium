# Introduction

This repository aims to gather resources for using VSCode to write in LaTeX, Markdown, and Python.
VSCode offers a nice sweet of features while being extremely accessible.
By contrast, TexShop and TexMaker are painfully austere, offering none of the resources of a modern editor (e.g., LSP support, snippets, Git integration, etc.), Overleaf leaves its users stuck in the browser, and [NeoVim](https://github.com/benbrastmckie/.config) is much more difficult to install, configure, and learn to use.

The instructions below aim to streamline the process of adopting VSCode as your daily driver for working with LaTeX and Mardown files with Python as a bonus.
This configuration provides a place to start and is easily adapted and extended.
Note that if you want to collaborate with others using Overleaf, it is possible to add Overleaf projects as remotes from which you can push and pull changes right from within VSCode.
These details will be described [below](#Overleaf).

If you run into trouble, feel free to open an [issue](https://github.com/benbrastmckie/VSCode/issues) in this repository, checking first to see that your issue was not already answered (search for both closed and open issues).
Since future users may find the answer to your problem helpful, GitHub issues are a nice way to not only solve the problems that you are facing, but also to contribute to the project by expanding its documentation.
With this in mind, make sure to adequately name the issue you create, providing a careful description of the problem and what you have tried already.
It is also important to stay on topic, opening new issues if you have separate problems.

If you find any errors in this documentation, you are welcome to submit a pull request by directly editing the `README.md` (click the pencil in the top right corner of the document).
That way you changes will be able to be reviewed and integrated.
If you feel that certain information is missing or would otherwise be helpful to include as a part of this project, don't hesitate to create an issue with your suggestions.

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

> **NOTE:** If you prefer to use Git to clone a fork of this repository, see the [Git](#Git) section below.
> In addition to streamlining the process, using Git will allow you to easily backup your configuration as you make changes, tracking its complete history.
> Alternatively, the following method is very easy, but does not backup your configuration (this can be added later with a little extra hassle).

Open VSCode and hit `ctrl + shift + p`, typing 'Preferences: Open User Settings (JSON)'.
This will open the `settings.json` file where you can declare your configuration.
Replace the entire contents of `settings.json` (i.e., you can replace the empty braces) with the contents of [this](https://github.com/benbrastmckie/VSCode/blob/master/settings.json) file.
Save the document with `ctrl + s`, confirming that the changes have taken place (e.g., the theme should change to 'One Monokai').

Before making any changes to `settings.json`, it is advisable to fork this repository, backing up your configuration as described in [Git](#Git) below.
Alternatively, if you do make changes to `settings.json`, details will be provided below if you later wish to backup your configuration.

### Customization

In order to get a better sense of what the options are within VSCode, click the settings gear in the bottom left corner.
By scrolling through, you can explore the many different features that you can change about VSCode where the list will get longer with each plugin that you add.

Although the settings menu is a nice way to see all the options at once, this is not the easiest way to _reproduce_ your configuration.
However, any changes that you make in the settings menu will be stored in the `settings.json` file.
It is by backing up this file with a Git repository that you can easily reproduce your configuration without having to remember what settings you had before.
Although you could attempt to backup `settings.json` manually, the Git integration included in VSCode provides an elegant way to stay backed up as you make changes to your configuration.
Accordingly, the [Git](#Git) section below will describe how to use Git to backup your configuration as well as your academic projects.

A further avenue for exploring customization is to use ChatGPT.
For instance, if there is something that you would like to change about VSCode, you can ask ChatGPT what you should include in `settings.json` in order to make that change.
In case ChatGPT hallucinates, the false setting will not break anything, but rather will be dimmed with a warning that this setting does not exist.
You may also find helpful tutorials on YouTube.

# Academic Toolchain

The following sections will provide information about how to set up LaTeX, reference management with Zotero, as well as how to make use of templates, snippets, Markdown, Pandoc, and Python.

## LaTeX

Create the ‘texmf’ folder tree in your directory.
For Mac users:
You will first need to locate your main ‘Library’ folder in Finder. Begin by opening a new Finder window. Press cmd+shift+h to go to the home folder, and cmd+j to open an options window. Check ‘show Library folder’.
Then create a folder called ‘texmf’ in your Library if it is not already there, and another folder called ‘bibtex’ inside texmf. Inside bibtex, create folders called ‘bib’ and ‘bst’. Inside bst, place this style file (you can cut and paste the contents into a new file with the same name and extension to be saved in your bst folder if you do not intend to clone the full repository).
Now add this template to Library -> TexShop -> Templates. This template includes the commands \bibliographystyle{Phil_Review} and \bibliography{Zotero} at the end of the document which will look up the file you placed in the bst folder as well as the bibliography you will place in the bib folder in Civ below.
Note: if you are using my NeoVim config, you can find this template by hitting ‘space+T’ followed by ‘p’.
For Windows users:
In C, create a folder called ‘texmf’, and another folder called ‘bibtex’ inside texmf. Inside bibtex, create folders called ‘bib’ and ‘bst’. Inside bst, place this style file which comes from here.
Now add this template to Users -> {user name} -> AppData -> Local -> MikTex -> 2.9 -> TexWorks -> 0.4 -> Templates. This template includes the commands \bibliographystyle{C:/texmf/bibtex/bst/Phil_Review} and \bibliography{C:/texmf/bibtex/bib/Zotero} at the end of the document which will look up the file you placed in the bst folder as well as the bibliography you will place in the bib folder.
If you want to save the bst and bib files elsewhere, you will need to change the path in the template file. Note the forward slashes in place of backslashes. You can also substitute other bst (bibliography style) files for Phil_Review.bst such as this one.
You can now integrate Zotero and LaTeX as follows (also see this video):
Download and install Better BibTex by following these instructions, restarting Zotero after completed.
Under ‘Edit’ in the Zotero menu bar, select ‘Preferences’ and open up the ‘Better BibTex’ tab. Under the ‘Citation’ sub-tab, replace the citation key format with this:  auth + year. There are a lot more options for citation key style here (this is just the look up key, not the citation style included in your bibliography). Also check ‘On item change’ at the bottom left.
Now switch to the ‘Automatic Export’ sub-tab and check ‘On Change’. This means that the instant you update your database with a new bib entry, or edit an old bib entry, Zotero will update the .bib files where your database is exported. If your library is extremely large, this could be slow, and so you might want to select the ‘When Idle’ option. But I have no troubles with the ‘On Change’ feature.
Close the Preferences window, returning to the main Zotero window. Right-click the main library folder in the left-most blue column, select ‘Export Library’ (alternatively you can export other project folders, but I like to keep things simple). Under the ‘Format’ dropdown menu, select ‘Better BibTex’. Then check the ‘Keep Updated’ box. Save the file as ‘Zotero’ (the extension will be added automatically) to the bib folder that you previously created.
You can now run a test that everything is working.
Open TexShop and create a new file (or create a file from template in TexWorks). In the ‘Templates’ drop-down menu, select PhilArticle. Press cmd+T (or click ‘Typeset’). Save the document in a new folder with the appropriate project name.
Note: If the file does not run, open TexLive Utility in the Tex folder in the Applications folder, and update. Restart everything and try to typeset the file again.
Note: Occasionally, it can also help to click Trash Aux Files in the error console, if the pdf is not generating properly.
Once your file typesets, open Zotero and click on one of the files in your library, and look for the ‘Citation Key’ in the details. If no key is present, or the key data is not of the form [auth][year], you can right-click the file in your library and click ‘Generate BibTex Key’. Once you have the key, you can cite that paper by writing ‘\citet{CITEKEY}’ in the new tex file.
Note: To list multiple sources by the same, or different authors, separate the cite keys with a comma. For other citation styles, refer to the preamble of the PhilArticle template for further commands, e.g., ‘\citep’, etc.
Note: It can also be helpful to customize commands as exemplified in the preamble of the PhilArticle template provided above. I have included a definition of \citepos which is useful for making citation names possessive.
In TexShop, you will need to hit cmd+T, then cmd+shift+b, then cmd+T, and the cmd+T for a final time. You should see both the citation you added in the text as well as the full citation in the references. Why all the command combinations? The first cmd+T will update the .tex file you are working on, adding the citation key. The cmd+shift+b will look up the citation key in your master Zotero.bib file saved in the bib folder. Then another cmd+T will import the citation data, and the final cmd+T will typeset it altogether. Sound clunky? It is, and that’s not the least of it. However, there are much better text editors out there (see below).
Note: Want to check how many words your document has? Open the ‘Macros Editor’ under the ‘Macros’ toolbar in TexShop. Select ‘New Item’ giving it a name like ‘TexCount’ and dragging it from the bottom of the list (left column) up to the top. Then cut and paste this into the content. Many more macros can be found here. (TexWorks does not include a word count macro for some reason.)
Now you are ready to tex! If you get stuck, get used to googling things and reading the bottom of the error console. YouTube also has many helpful tutorials. As you figure things out, I highly suggest making notes in the preamble of your template file of the really useful bits. By adding a ‘%’ symbol after the new bit of code you add to the preamble, you can explain what it does so that next time you will remember. Lots of helpful information is also available here including a nice lookup guide.

## Zotero

Even if you have no interest in using LaTeX, Zotero is a must for managing your pdf database as well as bibliographic data.
Zotero is an open-source reference management software which does all the work for you of saving bibliography data, pdfs, notes, or other files.
Rather than ending up with an dizzying array of folders on your hard drive (or desktop!) crammed with documents, Zotero lets you easily create and destroy project folders without creating multiple versions of each paper (unless you want that).
Additionally, Zotero will download and organise the associated pdf with the reference, all with the click of a single button in your web browser.
That way, building your reference database is the passive result of sorting through papers that interest you online.
Most importantly, this software allows you to generate bibliographies from any selected project folders or files, and is compatible with most word processors.
I’ve given detailed instructions below on how to install Zotero.
(Cost: 3 minute installation, with another 10 minutes to get it linked to your LaTeX editor.)

Download and install Zotero together with a plugin for your preferred browser.
If you use Word, you can follow these tutorials to both install and use.
Now run a simple test:
Find a paper you would like to download.
If you use a VPN provided by your research institution, make sure that it is turned on, and if you use an AdBlocker, make sure that it is not blocking pop-ups for the journal’s website.
Before downloading the paper as you normally would, notice the small Zotero icon in the top-right of your browser.
If Zotero has located a single paper, the icon will look like a paper; if it has located multiple, it will look like a folder.
Click the icon and, if need be, select the desired paper.
If all goes as it should, a small banner will pop up in the lower right-hand side of the screen that indicates that it has scraped the bib data and downloaded your file, giving you the chance to file the paper in a project folder if you desire.
(Alternatively, if you open a project folder in Zotero by clicking on it on the left side of Zotero, then any papers you download will be automatically filed in that project folder.)
Now switch from your browser to Zotero to check if the bib info (with the pdf) showed up.
If it did not work, or did not grab the pdf with the bib data, make sure you are appropriately logged on to the journal website and repeat.
For instance, if you are unable to download the pdf in the old fashioned way, then Zotero will not be able to download the pdf either.
If problems persist, you can look for further answers here.
You can also always add the file manually to the bib info by right-clicking the paper in question in Zotero.
Some of the journal websites work better than others.
For books, Amazon is a good resource for scraping bib data, though of course no pdf will be downloaded.
Once you are able to capture bib data, you can check that the website provided complete and correct information, making any changes that are needed.
I don’t typically do this if I trust the source.
(PhilPapers is pretty inconsistent, and so I mostly avoid getting bib data from there. For books, Amazon is not half-bad.)
Markdown Add-ons
Zotero can be used not only to keep the pdfs associated with each citation organised, but to export the highlights and annotations you make with your preferred pdf viewer as markdown files.
In order to include these features, you will need to download the .xpi file for MdNotes as described here, as well as the .xpi file for ZotFile.
By then opening Zotero, navigating to the Tools –> Add-ons menu, clicking the gear symbol, and selecting ‘Install add-on from file’, you can select the .xpi files that you downloaded in order install these features.
You may then export your notes by: (1) right-clicking on the annotated pdf and selecting Manage Attachments –> Extract Annotations; followed by (2) right-clicking on the extraction that it generates and selecting MdNotes –> Export to Markdown, specifying the project folder you would like to save the notes in.

## Templates

## Snippets

## Markdown

Instead of taking notes in LaTeX, Word, or some other note-taking application, you can recover some of the elegance of LaTeX without any of the trouble by writing in Markdown.
The syntax for Markdown is by design as simple as possible, but can still produce a good looking document which you can then convert via Pandoc into other formats.

<!-- provide guide -->

## Pandoc

Pandoc is a convenient utility for converting between different text formats.

<!-- provide guide -->

## Python

# Git

This section will describe how to: 

  1. Create a fork of this repository, using Git to pull its contents on an appropriate directory on your computer.
  2. Add an SSH key to streamline pushing and pulling changes.
  3. Use VSCode's Git integration to version control your academic projects as well as your config.

## Forking the Repository

In order to create your own copy of this repository, click `Fork` in the top right of this repository on GitHub.
You will then be presented with the choice to make yourself the owner which you should accept.
There is no need to include other branches besides the master branch which will be selected by default.
Do not select "Keep this repository private" unless you want to setup an SSH key (not a bad idea but requires another [few steps](#SSH-Key)) or want to type in you password every time.
It is also nice to keep configuration files public so that you can easily share them with others.

The next sections will describe the following two ways to use Git to backup your configuration:

  1. Use VSCode's Git integration to add a fork of this repository as a remote, pulling down changes.
  2. Use the Git CLI to clone the contents into the appropriate folder on your machine.

### Option 1: Git Integration

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

Note that if you have already made changes to the `settings.json` file on your machine, you will want to save those before proceeding.
One easy way to do this is to temporarily rename `settings.json` as `save.settings.json`.
That way, when you pull down the repository it will not replace your settings.
Instead, you can go on to delete the `settings.json` file that you pull down, changing the name of `save.settings.json` back to `settings.json`.
These extra steps can safely be ignored if you have not yet made any changes to `settings.json` as recommended above.

In the bottom left corner, you will see which branch you are on currently, clicking this branch to change to 'master'.
Next, click on the three dots in the top right corner of the "Source Control" pane to select `Pull, Push -> Pull`.
By changing back to the "Explorer" tab you should be able to see a host of new files.
Open `settings.json` to confirm that this file has been populated with settings.

If you go on to make any changes, you can save the changes by opening the "Source Control" tab, adding a message, and committing your changes.
Once committed, you can push your commits up to your repository with `Pull, Push -> Push`.
Note that unless you have added an [SSH key](#SSH-Key), you will need to enter you GitHub password.
You may also need to configure Git by adding your email (whatever you used to open a GitHub account).
To do so, open the terminal in VSCode with `ctrl + backtick` and enter the following:

```
git config --global user.email "your_email@example.com"
```

Once this information has been provided, you should be able to push the changes that you make up to your repository so that they are available to pull down anywhere.

### Option 2: Git CLI

For completeness, here is the manual option, using the standard Git command line interface.

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
If you have made extensive changes to `settings.json` that you want to preserve, you can create a backup with:

```
mv settings.json save.settings.json
ls -a
```

Click the `Code` button in the fork that you created previously (you should see your username in the address).
If you have an SSH Key (see [SSH Key](#SSH-Key) below), you can select the SSH address, copying it to the clipboard.
Otherwise, copy the HTTPS address to the clipboard.

Now initialize Git, link the remote repository, and pull down its contents by running each of the following commands:

```
git init
git remote add origin YOUR-FORK'S-ADDRESS
git remote -v
git pull origin master
ls -a
```

The `git remote -v` command is optional but will confirm that you succeeded in adding a remote.
The final command should show the new `settings.json` file along with the `.git` directory you initialized.
If you wanted to preserve your previously saved settings, you can now run the following commands:

```
rm settings.json
mv save.settings.json settings.json
```

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
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
```

Run the following to copy the SSH key to your system clipboard:

```
pbcopy < ~/.ssh/id_rsa.pub
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

## Version Control

### Overleaf

Open Overleaf, click on the Git icon or go to `Menu -> Git -> Sync` and get the Git URL `https://git.overleaf.com/your-project-id`.
You will then be able to add the remote with:

```
git remote add overleaf https://git.overleaf.com/your-project-id
```

