# Collaborating with Git

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

## Git Protocol

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

## GitHub CLI

Especially while collaborating with others on a common project, it is convenient to use GitHub Issues in order to facilitate exchange the development of the project.
Although one could attempt to limit all such exchange to a Markdown file in a shared repository, such files can quickly become cluttered or overlooked.
By contrast, GitHub Issues allows collaborators to exchange ideas in an exchange of markdown files, where each thread corresponds to a given issue.

GitHub Cli allows you to submit new issues to a repository without leaving the terminal.
Accordingly, I have included a mapping in Which-Key to permit users to easily create and log a new issue without leaving the project they are working on.
GitHub Cli also permits users to create pull-requests, along with a range of further features, and is currently being actively developed.
However, assuming that all collaborators of a shared repo will have administrator access, there is no need for pull-requests, and so I have not included further mappings, though one could easily do so.
In order to include this functionality in your configuration, refer to the **GitHub Cli** section in the [installation instructions](https://github.com/benbrastmckie/.config/blob/master/README.md) for setting up Git for use in NeoVim.

## Further Resources

The resources below are organised from the most immediately applicable to the most theoretical.

- [Overview](https://www.youtube.com/watch?v=uXv4poPOdvM&t=119s)
- [Branches](https://www.youtube.com/watch?v=FyAAIHHClqI)
- [LazyGit Features](https://www.youtube.com/watch?v=CPLdltN7wgE&t=307s)
- [LazyGit Rebasing](https://www.youtube.com/watch?v=4XaToVut_hs&t=150s)
- [Manual Commands (Short)](https://www.youtube.com/watch?v=USjZcfj8yxE)
- [Manual Commands (Long)](https://www.youtube.com/watch?v=8JJ101D3knE)
- [Theory](https://www.youtube.com/watch?v=2sjqTHE0zok)
