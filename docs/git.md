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
If you have not already created an account on GitHub, you will need to do so in order to host the repository (alternatively you could use [GitLab](https://gitlab.com/users/sign_in) to host your repository).
This will make it easy to not only to maintain your configuration (keeping it backed up as it evolves), but will also streamline the process of reproducing this configuration on other machines (or if you reformat your computer), as well as making it easy to share your configuration with others.

Upon clicking `Fork`, you will be presented with the choice to make yourself the owner which you should accept.
There is no need to include other branches besides the master branch which will be selected by default (branches allow for the project to develop in different directions simultaneously and will be discussed below).
You do not need to "Keep this repository private". 
In general, it is nice to keep configuration files public so that you can easily share them with others.
The configuration will not (and should not) include any personal or private data, just settings and documentation.

The next subsections will describe the following two ways to use Git to backup your configuration:

- [Option 1](#Option-1-VSCodium): Use Git within VSCodium to add a fork of this repository as a remote, pulling down changes.
- [Option 2](#Option-2-Git-CLI): Use the Git CLI (command line interface) from the terminal to clone the contents of your fork into the appropriate directory on your machine.

In addition to being easier, the first option will provide an opportunity to practice using Git from within VSCodium which will make it easy to continue using Git from VSCodium in the future.
The second option has been included only for completeness so that you can get some sense of what VSCodium is automating for you, giving you a better sense of what Git is actually doing to manage your project as it changes.

### Option 1: VSCodium

Once you have forked the repository (this creates a remote repository on GitHub which you will sync with), you can click the `Code` button in the fork that you have created (you should see your username in the address that you copy).
If you have already set up an [SSH Key](#SSH-Key), you can select the SSH address, copying it to the clipboard.
The SSH Key will allow you to push and pull changes from your remote repository without having to enter your password every time.
Although it is recommended that you take the time to set up an SSH Key now as described in the [SSH Key](#SSH-Key) section below (should only take a few minutes), this is step is optional.
If you have not created an SSH Key, copy the HTTPS address to the clipboard upon clicking `Code`.

Open `setting.json` in VSCodium with `ctrl + shift + p` and typing "Preferences: Open User Settings (JSON)". 
Right-click on the file tab to "Copy Path" for the `settings.json` file.
Open the "Explorer" tab on the top left, navigating to the directory which contains `settings.json` provided by the path you just copied.
Note that you may need to show hidden files by right-clicking inside the search menu that VSCodium will open.

Once you have opened the right directory in the "Explorer" tab, open the "Source Control" tab also on the top left and select "Initialize Repository".
You can then add a remote by clicking the three dots in the top right of the "Source Control" panel, selecting `remote -> add`.
You can then enter the address copied to the clipboard from before, naming the remote "VSCodium" or whatever you like.

> **Note:** If you have not yet made changes to your configuration `settings.json` file, you can ignore this note. 
> If, however, you have already made changes to the `settings.json` file on your machine, you will want to save those before proceeding.
> Otherwise, when you pull down your fork of this repository, you will overwrite current `settings.json` file.
> Although this won't break anything, you will lose the changes that you have already made (though you could always revert to the older commit).
> If you have made changes to your `settings.json` file that you want to preserve, one easy way to avoid losing changes is to temporarily rename `settings.json` as `save.settings.json`.
> That way, when you pull down the repository it will not replace your configuration.
> After pulling down the configuration, you can go on to delete the `settings.json` file that you just pulled down, changing the name of `save.settings.json` back to `settings.json`.

If you have not done so already, you will also need to configure Git by adding your email (whatever you used to open a GitHub account).
To do so, open the terminal in VSCodium with `ctrl + backtick` and enter the following two commands, replacing "Your Name" and "your.email@example" with the same information you provided in your GitHub account:

```
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

Once this information has been provided, you should be able to push the changes that you make to your configuration so that they are available to pull down from anywhere.
To do so, look in the bottom left corner of VSCodium where you will see the branch that you are on currently, clicking the current branch and changing to "Master".
Next, click on the three dots in the top right corner of the "Source Control" tab to select `Pull, Push -> Pull`.
By changing back to the "Explorer" tab you should be able to see a host of new files that you have just pulled down.
Open `settings.json` to confirm that this file has been populated with settings.

If you go on to make any changes to your configuration, you can save the changes and then open the "Source Control" tab, adding a message, and "committing" your changes (this creates a save point in its history).
Once committed, you can click "Sync" to automatically pull and push changes from/to your remote.
Note that you will either have to add an [SSH key](#SSH-Key) and link your GitHub account to VSCodium or enter your GitHub password each time you sync.

> **Note:** If you forked this repository, you are no longer tethered to the original repository that you forked, allowing each of these repositories to evolve independently.
> If changes are made to the original repository (the repository that is "upstream" of your fork), you will be notified on your GitHub repository when new commits have been added to the original repository.
> If you want to update your fork to include these changes, click `Sync Fork` in your GitHub repository (doing so is optional and may lead to conflicts you will need to resolve).
> Although it is useful to know that it is possible to sync your remote with the upstream repository, this option can be safely ignored.

### Option 2: Git CLI

For completeness, here is the manual option, using the standard Git command line interface (CLI).

Open VSCodium, hitting `ctrl + shift + p` and typing "Preferences: Open User Settings (JSON)".
Once open, you can hover the mouse over the `settings.json` file to see its path.
Right-click the tab and select "Copy Path" or hit `alt + ctrl + c` to do the same.
Open the terminal (separately or in VSCodium with `ctrl + backtick`) and run the following commands, replacing `PATH/TO` with the copied path minus "settings.json" (often `ctrl + shift + v` is required to paste in the terminal):

```
cd PATH/TO/
ls -a
```

On MacOS, the `PATH/TO/` should be `~/Library/Application Support/VSCodium/User`.
The `ls -a` command should show the `settings.json` file.
If you have made extensive changes to `settings.json` that you want to preserve, you can create a backup with:

```
mv settings.json save.settings.json
ls -a
```

Click the `Code` button in the fork that you created previously (you should see your username in the address).
If you have already set up an [SSH Key](#SSH-Key), you can select the SSH address, copying it to the clipboard.
The SSH Key will allow you to push and pull changes from your remote repository without having to enter your password every time.
Although it is recommended that you take the time to set up an SSH Key now as described in the [SSH Key](#SSH-Key) section below (should only take a few minutes), this is step is optional.
If you have not created an SSH Key, copy the HTTPS address to the clipboard upon clicking `Code`.

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

If you make any changes to your configuration in the future, you can push these up to your repository with:

```
git add settings.json 
git commit -m "commit message of your choice"
git push origin master
```

Although it is good to know how to push and pull changes manually, VSCodium will automate all of this for you as described above in [Option 1](#Option-1-VSCodium)

## [Version Control](#Table-of-Contents)

Git is integrated into VSCodium by default, providing convenient utilities for:

  - Maintaining a history of all versions of your project.
  - Backing up the project in a repository online for free.
  - Managing different ways of developing the project in branches.
  - Working on the same project from different computers.
  - Collaborating with others on a shared project.

The following subsection will describe some of the basic protocols for using Git effectively in VSCodium.

### Initialize Repository

In order to use Git to track a project, make sure you are in the right project directory by opening the "Explorer" tab.
Next, you can open the "Source Control" tab, selecting "Initialize Repository".

> **Note:** Alternatively, you can click "Publish to GitHub" to both create a local repository and to add a remote repository on GitHub.
> You will be asked to verify your account, select between public and private for the repository you are creating, and will be given the option to have Git occasionally fetch (detecting if there have been changes) which you can accept.
> You may need to enter your GitHub password or else add an [SSH Key](#SSH-Key) as described below.

Look in the bottom left corner of VSCodium where you will see which branch you are on currently, clicking the current branch and change to "Master".

### Staging Changes

As you make changes, you can commit those changes locally by first staging them.
In the "Source Control" tab you will see all modified files (indicated with an "M").
If you click on the file, you can see the changes that have been made.
Not all changes need to be staged and committed at once.
If you do want to stage all changes for a new commit, click the "+".
If you click the arrow, all changes will be permanently discarded.

### Making Commits

Once you have staged the changes that you want to commit, you can add a short message and click "Commit".
It is good practice to add make commits often, marking any milestone in the project or what you are in the middle of before transitioning to something else.

### Ignoring Files

Open the "Extensions" tab and install the "gitignore" plugin.
After restarting VSCodium, you will be able to ignore files by opening them and hitting `Ctrl + Shift + p` and typing "Git: add to .gitignore" and hitting `Return`.
In general, you should ignore all files that are not text files (e.g., `.pdf` files) as well as those which you do not wish to track the changes of (e.g., `.aux` files, etc.).

> **Note:** If you accidentally ignore a file that you did not mean to, open the `.gitignore` file in the "Explorer" tab, deleting the appropriate line (at the end) which names the file or directory that you accidentally ignored.

### Diff Commits

If you open the "Source Control" tab, under "Main" you should see the commit history.
Clicking on a commit should reveal all files included in that commit.
Clicking on a file will show the `diff`, i.e., what changed at that commit in the file's history.

### Creating Remote Repositories

If you have not already created a repository for your current project, you will need to do so now by navigating to your account on GitHub and clicking the "Repositories" tab, followed by clicking the "New" button in green on the top right.
You will be asked to add a name, description, and select between "Private" and "Public".
Once you have created your repository, you can copy the address by clicking the "Code" button on the top right and selecting "SSH" if you have an [SSH Key](#SSH-Key) as described below, or "HTTPS" otherwise, copying the link to the clipboard.

### Adding Remote Repositories

If you have not already published to GitHub, you can add a remote repository at any point by clicking the three dots in the top right corner of the "Source Controls" tab, followed by `Remote -> Add Remote`.
You will then need to add the URL copied in the previous step, or else select "Add Remote from GitHub" which (assuming you have linked VSCodium to GitHub) will present all of the repositories that you have already created.
You may then choose a remote name (can be the same as on GitHub).

### Pushing Changes

You should always make sure to pull changes before pushing.
VSCodium streamlines this process by adding a "Sync" button which is activated once you commit new changes.

### Pulling Changes

Pulling down changes is typically just as easy as pushing changes.
Assuming new changes have been made to the remote repository, VSCodium will detect the existence of these changes, presenting you with the option to "Sync" as before.

### Merge Conflicts

Occasionally, pulling down changes will conflict with the changes that you have made locally.
Accordingly, you may have to configure Git so that it knows how to attempt to resolve the conflict.
To do so, open the terminal in VSCodium with `Ctrl + backtick` and enter:

```
git config pull.rebase false
```

You can then try to click "Sync" again.
If there is a merge conflict, you will have to edit the files which have conflicts by searching throughout for "HEAD", removing the erroneous lines used to mark the conflicting blocks.
VSCodium will provide links which may streamline this process, but you can also make these changes manually, committing the changes once you have finished.

### Creating Branches

If you click the branches tab in the bottom left corner, a drop-down menu will appear giving you the option to create a new branch.
You can then develop your project on this new branch, publishing it to GitHub to keep it backed up.
If the changes that you make in your branch don't end up working out, you can always switch back to the "Master" branch (sometimes also called "Main"), saving the branch you created to perhaps return to later.

### Merging Branches

Once you are satisfied with the development of your branch, you can merge those changes back into the "Master" branch.
To do so, select the "Master" branch in the lower left corner.
Then select the three dots in the top right of the "Source Controls" tab, clicking `Branch -> Merge`.
You will then be given the chance to select the branch that you want to merge into "Master", adding the commits from the selected branch to "Master".
Once you have merged your branch into "Master", you are free to delete that branch with `Branch -> Delete Branch` after clicking the three dots in "Source Controls".
There is typically no good reason to save branches that you have merged.

If you published your branch to GitHub, it will remain on GitHub.
At some point you may want to delete old branches so that it is easier to find branches that you may wish to return to develop further.

## [Collaborating with Git](#Table-of-Contents)

In order to add a collaborator to an existing repository, open the repository in GitHub and navigate to `Settings -> Manage acess` and click `Invite a collaborator`, entering their GitHub username or email address.
Your collaborator will then be able open the repository on GitHub, copying the address by clicking the `Code` drop-down menu, selecting SSH (or HTTPS if they have not set up an [SSH Key](#SSH-Key)), and clicking the icon to copy the link to the clipboard.

- [Option 1](#Option-1-VSCodium): Use Git within VSCodium to clone the repository.
- [Option 2](#Option-2-Git-CLI): Use the Git CLI (command line interface) to clone the repository.

Although Option 1 is easier if your collaborator is also using VSCodium, Option 2 has been included for completeness.

### Option 1: VSCodium

Your collaborator will need to clone the repository which they can do by opening the "Source Control" tab and clicking "Clone Repository", entering the URL for the repository copied in the previous step.
After selecting the appropriate directory to store the cloned repository, your collaborator can proceed to create a new branch in order to contribute to the repository.
To do so, click on the branch icon in the bottom left corner, selecting "Create new branch", giving it an appropriate name for the changes that your collaborator intends to make.

Once the branch is created, you collaborator can proceed as described above in [Version Control](#Version-Control) by:

  - Making changes
  - Staging the changes by clicking the "+" icon in the "Source Control" tab
  - Adding a commit message
  - And clicking the check mark to commit the staged changes.

You collaborator may then push the branch to GitHub by clicking on the `...` menu in the "Source Control" tab and selecting "Push".
Since this is a new branch, your collaborator will have to confirm that they want to publish the branch to GitHub.

The new branch complete with all of its changes is now ready for review by all collaborators on the project.
If the branch evolves to a point where it achieves what it was aiming to contribute, your collaborator can proceed to merge the changes into the "Master" branch as described in [Version Control](#Version-Control) above.
Alternatively, your collaborator can create a [Pull Request](#Pull-Requests) as described below if they do not have privileges to merge the changes into "Master" themselves, or in order to request that their changes be reviewed before those changes are merged.

### Option 2: Git CLI

If your collaborator wishes to use Git in the terminal to contribute changes, then may begin by navigating in the terminal to their desired project directory with:

```
cd ~/path/to/project/directory
```

The collaborator may then pull down the repository by running:

```
git clone /address/from/clipboard/copied/above
```

By then running `ls -a` in the terminal, the collaborator may check whether the project directory has appeared.
Your collaborator may then create a new branch replacing "feature-branch" with an appropriate name for their branch given the changes they intend to make:

```
git checkout -b feature-branch
```
After making any changes to the project, your collaborator can stage all changes with the following command (or else replacing `.` with the files that they wish to stage):

```
git add .
```

You collaborator can then commit the staged changes with the following two commands, replacing "feature-branch" with the name of the branch that they created before:

```
git commit -m "Replace with an appropriate description of the changes"
git push origin feature-branch
```

If the branch evolves to a point where it achieves what it was aiming to contribute, your collaborator can proceed to merge the changes into the "Master" branch by switching to the "Master" branch and pulling the changes they just pushed with:

```
git checkout master
git pull origin master
git merge feature-branch
```

Note that you may need to resolve any merge conflicts as described in [Version Control](#Version-Control) above.
Alternatively, your collaborator can create a "Pull Request" on GitHub as described below if they do not have privileges to merge the changes into "Master" themselves, or in order to request that their changes be reviewed before those changes are merged.

## [Pull Requests](#Table-of-Contents)

To be continued... 

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

If you get an error, retry the command above with a lower-case "k" or without the "K" altogether.

## [Further Resources](#Table-of-Contents)

If you are interested in finding out more about Git, the resources provided below are organized from the most immediately applicable to the most theoretical:

- [Brief Overview](https://www.youtube.com/watch?v=hwP7WQkmECE): Git in 100 seconds
- [Conceptual Overview](https://www.youtube.com/watch?v=e9lnsKot_SQ): Git in 4 minutes
- [Overview 1](https://www.youtube.com/watch?v=z5jZ9lrSpqk): how to use Git in VS Code (same as VSCodium)
- [Overview 2](https://www.youtube.com/watch?v=i_23KUAEtUM&t=3s): official guided tour in VS Code (same as VSCodium)
- [Overview 3](https://www.youtube.com/watch?v=Xe9OA18PF_o): installing Git in Windows, adding gitignore and githistory plugins
- [CLI Commands (Short)](https://www.youtube.com/watch?v=USjZcfj8yxE): how to use Git in the terminal
- [CLI Commands (Long)](https://www.youtube.com/watch?v=8JJ101D3knE): how to use Git in the terminal
- [Theory (Short)](https://www.youtube.com/watch?v=RxHJdapz2p0): Git under the hood
- [Theory (Long)](https://www.youtube.com/watch?v=2sjqTHE0zok): Git under the hood
