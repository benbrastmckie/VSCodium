# Git

[Git](https://git-scm.com/) is an extremely powerful and versatile tool for version controlling projects, managing the development of selected contents of your project's root directory, keeping their entire history backed up and synchronized between your local machine, a remote repository on GitHub or elsewhere, as well as the local machines of the other collaborators on the project if any.
The following sections will introduce some of the most basic functionality that Git provides, describing specific functions that Git provides for maintaining your configuration and version controlling your projects, perhaps in collaboration with others:

- [Forking the Repository](#Forking-the-Repository): make a copy of this repository to stay backed up.
- [Version Control](#Version-Control): using Git to backup and collaborate on projects.
- [Collaborating with Git](#Collaborating-with-Git): how to use Git to collaborate on projects with others.
- [Overleaf](#Overleaf): how to add Overleaf remote repositories.
- [Pull Requests](#Pull-Requests): how to contribute changes to this repository.
- [SSH Key](#SSH-Key): avoid having to enter your password when pushing changes.
- [Further Resources](#Further-Resources): a collection links for finding out more about how to use Git.

## [Forking the Repository](#Table-of-Contents)

Although this configuration provides a collection of basic settings that will help you to get started with VSCodium, you may wish to make certain changes both now and in the future, adapting the configuration to your own needs.
In order to do so while backing up your configuration on GitHub, you will want to create a copy of [this repository](https://github.com/benbrastmckie/VSCodium) by clicking `Fork` in the top right-hand corner.
If you have not already created an account on GitHub, you will need to do so in order to host the repository.
This will make it easy to not only to maintain your configuration (keeping it backed up as it evolves), but also streamline the process of reproducing this configuration on other machines (or if you reformat your computer), as well as making it easy to share your configuration with others.

Upon clicking `Fork`, you will be presented with the choice to make yourself the owner which you should accept.
There is no need to include other branches besides the master branch which will be selected by default (branches allow for the project to develop in different directions simultaneously and will be discussed below).
You do not need to "Keep this repository private". 
In general, it is nice to keep configuration files public so that you can easily share them with others.
The configuration will not (and should not) include any personal or private data, just settings and documentation.

The next subsections will describe the following two ways to use Git to backup your configuration:

- [Option 1](#Option-1:-VSCodium): Use Git within VSCodium to add a fork of this repository as a remote, pulling down changes.
- [Option 2](#Option-2:-Git-CLI): Use the Git CLI (command line interface) from the terminal to clone the contents of your fork into the appropriate directory on your machine.

In addition to being easier, the first option will provide an opportunity to practice using Git from within VSCodium which will make it easy to continue using Git in the future.
The second option has been included only for completeness so that you can get some sense of what VSCodium is automating for you, giving you a better sense of what Git is actually doing to manage your project as it changes.

### Option 1: VSCodium

Once you have forked the repository (this creates a remote repository on GitHub which you will sync with), you can click the `Code` button in the fork that you have created (you should see your username in the address that you copy).
If you have already set up an [SSH Key](#SSH-Key), you can select the SSH address, copying it to the clipboard.
The SSH Key will allow you to push and pull changes from your remote repository without having to enter your password every time.
Although it is recommended that you take the time to set up an SSH Key now as described in the [SSH Key](#SSH-Key) section below (should only take a few minutes), this is step is optional.
If you have not created an SSH Key, copy the HTTPS address to the clipboard upon clicking `Code`.

Open `setting.json` in VSCodium with `ctrl + shift + p` and typing 'Preferences: Open User Settings (JSON)'. 
Right-click on the file tab to 'Copy Path' for the `settings.json` file.
Open the "Explorer" tab on the top left, navigating to the directory which contains `settings.json` provided by the path you just copied.
Note that you may need to show hidden files by right-clicking inside the search menu that VSCodium will open.

Once you have opened the right directory in the "Explorer" tab, open the "Source Control" tab also on the top left and select "Initialize Repository".
You can then add a remote by clicking the three dots in the top right of the "Source Control" panel, selecting `remote -> add`.
You can then enter the address copied to the clipboard from before, naming the remote "VSCodium" or whatever you like.

> **Note:** If you have not yet made changes to your configuration `settings.json` file, you can ignore this note. 
> If, however, you have already made changes to the `settings.json` file on your machine, you will want to save those before proceeding.
> Otherwise, when you pull down your fork of this repository, you will overwrite current `settings.json` file.
> Although this won't break anything, you will lose the changes that you have already made.
> If you have made changes to your `settings.json` file that you want to preserve, one easy way to avoid losing changes is to temporarily rename `settings.json` as `save.settings.json`.
> That way, when you pull down the repository it will not replace your configuration.
> After pulling down the configuration, you can go on to delete the `settings.json` file that you just pulled down, changing the name of `save.settings.json` back to `settings.json`.

If you have not done so already, you will also need to configure Git by adding your email (whatever you used to open a GitHub account).
To do so, open the terminal in VSCodium with `ctrl + backtick` and enter the following:

```
git config --global user.email "your_email@example.com"
```

Once this information has been provided, you should be able to push the changes that you make to your configuration so that they are available to pull down from anywhere.
To do so, look in the bottom left corner of VSCodium where you will see the branch that you are on currently, clicking the current branch and changing to 'master'.
Next, click on the three dots in the top right corner of the "Source Control" tab to select `Pull, Push -> Pull`.
By changing back to the "Explorer" tab you should be able to see a host of new files that you have just pulled down.
Open `settings.json` to confirm that this file has been populated with settings.

If you go on to make any changes to your configuration, you can save the changes by opening the "Source Control" tab, adding a message, and "committing" your changes (this creates a save point in its history).
Once committed, you can click 'Sync' to automatically pull and push changes from/to your remote.
Note that you will either have to add an [SSH key](#SSH-Key) and link your GitHub account to VSCodium or enter your GitHub password each time you sync.

> **Note:** By creating a fork, you are no longer tethered to the original repository that you forked, allowing you to make changes that depart from what is included in the repository that you forked.
> If changes are made to the original repository (the repository that is "upstream" of your fork), you will be notified on your GitHub repository when new commits have been added to the original repository.
> If you want to update your fork to include these changes, click `Sync Fork` in your GitHub repository (this is not necessary).
> You do not need to keep your fork up to date with the upstream repository, and doing so could potentially cause conflicts that you will have to resolve.
> Although it is useful to know that it is possible to sync your remote with the upstream repository, this option can be safely ignored.

### Option 2: Git CLI

For completeness, here is the manual option, using the standard Git command line interface.

Open VSCodium, hitting `ctrl + shift + p` and typing 'Preferences: Open User Settings (JSON)'.
Once open, you can hover the mouse over the `settings.json` file to see its path.
Right-click the tab and select 'Copy Path' or hit `alt + ctrl + c` to do the same.
Open the terminal (on MacOS, hit `Cmd + Space` and type 'terminal') and run the following commands, replacing `PATH/TO` with the copied path minus 'settings.json':

```
cd PATH/TO/
ls -a
```

On MacOS, the `PATH/TO/` should be `~/Library/Application Support/VSCodium/User`.
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

If you make any changes to your config, you can push these up to your repository with:

```
git add . 
git commit -m "commit message of your choice"
git push origin master
```

Although it is good to know how to push and pull changes manually, VSCodium will automate all of this for you.
Instead of working in the terminal, you can open the "Explorer" tab in VSCodium on the top left, navigating to the directory containing `settings.json`.
You may need to turn on hidden files by right-clicking in the menu and selecting "Show Hidden Files".
VSCodium should automatically detect that this is a tracked directory.
You can then open the "Source Control" tab on the top left to commit changes, pushing commits up to your repository by clicking 'Sync'.

## [Version Control](#Table-of-Contents)

Git is integrated into VSCodium by default, providing convenient utilities for:
  - Maintaining a history of all versions of your project.
  - Backing up the project on free repositories online.
  - Managing different ways of developing the project in branches.
  - Working on the same project from different computers.
  - Collaborating with others on a shared project.
The following subsection will describe some of the basic protocols for using Git effectively in VSCodium.

### Initialize Repository

In order to use Git to track a project, make sure you are in the right project directory by opening the "Explorer" tab.
Next, you can open the "Source Control" tab, selecting 'Initialize Repository'.

> **Note:** Alternatively, you can click "Publish to GitHub" to both create a local repository and to add a remote repository on GitHub.
> You will be asked to verify your account, select between public and private for the repository you are creating, and will be given the option to have Git occasionally fetch (detecting if there have been changes) which you can accept.

### Staging Changes

As you make changes, you can commit those changes locally by first staging them.
In the "Source Control" tab you will see all modified files (indicated with an 'M').
If you click on the file, you can see the changes that have been made.
If you click the '+', all changes will be staged.
If you click the arrow, all changes will be discarded.

### Making Commits

Once you have staged the changes that you want to commit (you don't have to stage everything), you can add a short message and click "Commit".
It is good practice to add make commits often, marking any milestone in the project.

### Ignoring Files

Open the "Extensions" tab and install the 'gitignore' plugin.
After restarting VSCodium, you will be able to ignore files by opening them and hitting `Ctrl + Shift + p` and typing 'Git: add to .gitignore' and hitting `Return`.
Ignore all files are not text files (e.g., PDFs) as well as those which you do not wish to track.

> **Note:** If you accidentally ignore a file that you did not mean to, open the `.gitignore` file in the "Explorer" tab, deleting the appropriate line (at the end) which names the file or directory that you accidentally ignored.

### Diff Commits

If you open the "Source Control" tab, under 'main' you should see the commit history.
Clicking on a commit should reveal all files included in that commit.
Clicking on a file will show the `diff`, i.e., what changes at that commit.

### Adding Remote Repositories

If you have not already published to GitHub, you can add a remote repository at any point by clicking the three dots in the top right corner of the "Source Controls" tab, followed by `Remote -> Add Remote`.
You will then need to add a URL, or select "Add Remote from GitHub" which (assuming you have linked VSCodium to GitHub) will present all of the repositories that you have already created.
You may then choose a remote name (can be the same as on GitHub).

If you have not already created a repository for your current project, you will need to do so now by navigating to your account on GitHub and clicking the "Repositories" tab, followed by clicking the 'New' button in green on the top right.
You will be asked to add a name, description, and select between 'Private' and 'Public'.
Once you have created your repository, you can copy the address by clicking the 'Code' button on the top right and selecting 'HTTPS' and copying the link to the clipboard.
You can then past this address into VSCodium after selecting `Remote -> Add Remote` as described just above.

### Pushing Changes

You should always make sure to pull changes before pushing.
VSCodium streamlines this process by adding a 'Sync' button which is activated once you commit new changes.

### Pulling Changes

Pulling down changes is typically just as easy as pushing changes.
Assuming new changes have been made to the remote repository, VSCodium will detect the existence of these changes, presenting you with the option to 'Sync' as before.

### Merge Conflicts

Occasionally, pulling down changes will conflict with the changes that you have made locally.
Accordingly, you may have to configure Git so that it knows how to attempt to resolve the conflict.
To do so, open the terminal in VSCodium with `Ctrl + backtick` and enter:

```
git config pull.rebase false
```

You can then try to click 'Sync' again.
If there is a merge conflict, you will have to edit the files which have conflicts, removing the erroneous lines used to mark the conflicts.
VSCodium will provide links which may streamline this process, but you can also make these changes manually, committing the changes once you have finished.

### Creating Branches

If you click the branches tab in the bottom left corner, a drop-down menu will appear giving you the option to create a new branch.
You can then develop your project on this new branch, publishing it to GitHub to keep it backed up.
If the changes that you make in your branch don't end up working out, you can always switch back to the 'Main' branch, saving the branch you created to perhaps return to later.

### Merging Branches

Once you are satisfied with the development of your branch, you can merge those changes back into the 'Main' branch.
To do so, select the 'Main' branch in the lower left corner.
Then select the three dots in the top right of the "Source Controls" tab, clicking `Branch -> Merge`.
You will then be given the chance to select the branch that you want to merge into 'Main', adding the commits from the selected branch to 'Main'.
Once you have merged your branch into 'Main', you are free to delete that branch with `Branch -> Delete Branch` after clicking the three dots in "Source Controls".

If you published your branch to GitHub, it will remain on GitHub.
At some point you may want to delete old branches so that it is easier to find branches that you may wish to return to develop further.

## [Collaborating with Git](#Table-of-Contents)

In order to add a collaborator to an existing repository, open the repository in GitHub and navigate to `Settings -> Manage acess` and click `invite a collaborator`, entering their GitHub username or email address.
Your collaborator will then be able open the repo in GitHub, copying the address by clicking the `Code` drop-down menu, selecting SSH, and hitting the icon for copy-to-clipboard.
They may then navigate in the terminal to the directory in which they want the project folder to live with:

```
cd ~/<path to folder where the project folder should live>
```

The collaborator may then pull down the repo by running:

```
git clone <address from the clipboard>
```

By then running `ls -a` in the terminal, the collaborator may check whether the project directory has appeared.
If the collaborator is using the same configuration, then the project may be edited by moving into the project directory with `cd <project directory name>`, running `nvim` and hitting `<space>e` to open the explorer in the project folder, selecting the files to be edited.
However, even without using the present configuration of NeoVim, collaborators may avoid manually entering git commands by running LazyGit in the terminal.
In order to install LazyGit and add an SSH key, follow the instructions provided in the [README.md](https://github.com/benbrastmckie/.config/blob/master/README.md).

### Git Protocol

Assume collaborator A creates a repo inviting collaborator B as above.
Upon first cloning the repo, collaborator B will be up to date with the remote repository on GitHub, and may begin making changes.
At the same time, collaborator A may also make changes, leading to possible conflicts.
These are to be negotiated by both collaborators running the following procedure in order to make and commit changes to the project.

- Open LazyGit, checking in the local branches window whether the right-most number next to the active branch marked by a `*` is 0.
- If the right-most number is greater than 0, pull down the most recent commits by hitting `p`.
- If there are conflicts, hit `<return>` upon being asked by LazyGit whether to proceed.
- Close LazyGit, searching through the files with conflicts for `HEAD`, choosing which alternative is preferable and deleting the other alternative along with all marker syntax.
- Once all conflicts have been resolved, return to LazyGit.
- Attempting to stage the files with conflicts should register a message which asks if all conflicts have been resolved, where hitting `<return>` will stage the file in question.
- If conflicts remain, the staging will fail, requiring that you return to resolve whatever conflicts have been missed, perhaps in another file in the project.
- Once the staging is successful, commit the changes with `c` noting that you have resolved conflicts in your message in addition to noting the most recent changes you made to the project.
- Push these commits to the remote repository by hitting `P`.

In order to reduce the number of conflicts, collaborators can may choose to avoid working on the same parts of the project, though this is not required.

### GitHub CLI

Especially while collaborating with others on a common project, it is convenient to use GitHub Issues in order to facilitate exchange the development of the project.
Although one could attempt to limit all such exchange to a Markdown file in a shared repository, such files can quickly become cluttered or overlooked.
By contrast, GitHub Issues allows collaborators to exchange ideas in an exchange of markdown files, where each thread corresponds to a given issue.

GitHub Cli allows you to submit new issues to a repository without leaving the terminal.
Accordingly, I have included a mapping in Which-Key to permit users to easily create and log a new issue without leaving the project they are working on.
GitHub Cli also permits users to create pull-requests, along with a range of further features, and is currently being actively developed.
However, assuming that all collaborators of a shared repo will have administrator access, there is no need for pull-requests, and so I have not included further mappings, though one could easily do so.
In order to include this functionality in your configuration, refer to the **GitHub Cli** section in the [installation instructions](https://github.com/benbrastmckie/.config/blob/master/README.md) for setting up Git for use in NeoVim.

## [Overleaf](#Table-of-Contents)

Open Overleaf, click on the Git icon or go to `Menu -> Git -> Sync` and get the Git URL which should look something like:

```
https://git.overleaf.com/your-project-id
```

You will then be able to add the remote by making the appropriate substitution to the following:

```
git remote add overleaf https://git.overleaf.com/your-project-id
```

To be continued... (If anyone wants to add the rest of these details, that would be much appreciated. Please feel free to submit a pull request by editing this [README.md](https://github.com/benbrastmckie/VSCodium/blob/master/README.md).)

## [Pull Requests](#Table-of-Contents)

To be continued... 

## [SSH Key](#Table-of-Contents)

> **Note:** It is possible to link your GitHub account to VSCodium, obviating the need for an SSH key in most cases.

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

## [Further Resources](#Table-of-Contents)

If you are interested in finding out more about Git, the resources provided below are organized from the most immediately applicable to the most theoretical:

- [Overview](https://www.youtube.com/watch?v=uXv4poPOdvM&t=119s)
- [Branches](https://www.youtube.com/watch?v=FyAAIHHClqI)
- [LazyGit Features](https://www.youtube.com/watch?v=CPLdltN7wgE&t=307s)
- [LazyGit Rebasing](https://www.youtube.com/watch?v=4XaToVut_hs&t=150s)
- [Manual Commands (Short)](https://www.youtube.com/watch?v=USjZcfj8yxE)
- [Manual Commands (Long)](https://www.youtube.com/watch?v=8JJ101D3knE)
- [Theory](https://www.youtube.com/watch?v=2sjqTHE0zok)


