# Git

## Useful resources:
- [Git official documentation](https://git-scm.com/docs)
- [GitHub Cheat Sheet](https://training.github.com/)
- [Learn Git Branching interactively](https://learngitbranching.js.org)
- [Altassian Git tutorials](https://www.atlassian.com/git/tutorials)
- [Git Immersion](http://gitimmersion.com)

## Configure
Set up user information for all your local repositories.

- `git config --global user.name  “[name]”`: Specify the name associated with your commit transactions.
- `git config --global user.name`: View the currently configured name.
- `git config --global user.email “[email]”`: Define the email address linked to your commit transactions, which will be made public.
- `git config --global user.email`: View the currently configured email address.
- `git config --global color.ui true`: Enable helpful colorization of command-line output.
- `git config --global --list`: visplay the current configuration settings.
- `git help`: Provide information on how Git functions, or specify a command for detailed help.

## Create Repositories
Initiate a new repository or retrieve one from an existing URL.

- `git init`: Commence a project and have Git start monitoring it.
- `git init [project-name]`: Establish a new local repository with the given name.
- `git clone [url]`: Download a project along with its complete version history.

## Stage Changes
Review modifications and prepare them for a commit transaction.

- `git status`: List all new or altered files that need to be committed.
- `git diff`: Display file differences that have not been staged yet.
- `git add [file]`: Snapshot the file to prepare it for versioning.
- `git add -A`: : Add all files.
- `git diff --staged`: Exhibit file differences between the staging area and the latest version.
- `git reset [file]`: Unstage the file while preserving its contents.
- `git commit -m "[descriptive message]"`: Permanently record file snapshots in the version history.
- `git commit`: Open the default text editor for writing the commit message.

## Group Changes
Name a series of commits and combine completed efforts.

- `git branch`: List all branches in the current repository.
- `git branch [branch-name]`: Create a new branch.
- `git checkout [branch-name]`: Switch to the specified branch and update the active directory.
- `git merge [branch]`: Combine the history of the specified branch with the current branch.
- `git branch -d [branch-name]`: Delete the specified branch.
- `git push -u origin [branch-name]`: Push your branch to the remote repository.

## Rename File Refactoring
Relocate and remove versioned files.

- `git rm --cached [file]`: Remove the file from version control, but keep it locally.
- `git rm [file]`: Delete the file from the working directory and stage the deletion.
- `git mv [file-original] [file-renamed]`: Rename the file and stage it for commit.

## Suppress Tracking
Exclude temporary files and paths. Adding an entry to the `.gitignore` file in the root directory.
- `git ls-files --other --ignored --exclude-standard`: List all ignored files in this project

## Save Stashes
Store and recover incomplete changes.

- `git stash`: Temporarily preserve all modified tracked files.
- `git stash list`: List all sets of saved changes.
- `git stash pop`: Apply the most recently saved changes.
- `git stash drop`: Discard the most recently saved set of changes.

## Review History
Navigate through and inspect the evolution of project files.

- `git log`: List the version history for the current branch.
- `git log --follow [file]`: List the version history for the file, including renames.
- `git diff [first-branch]...[second-branch]`: Show content differences between two branches.
- `git show [commit]`: Display metadata and content changes for the specified commit.

## Redo Commits
Undo errors and craft a replacement history.

- `git reset [commit]`: Reverse all commits made after [commit], while preserving changes locally.
- `git reset --hard [commit]`: Discard the entire history and return to the specified commit.

## Sync Changes
Register a repository bookmark and exchange version history.

- `git fetch [bookmark]`: Download the entire history from the repository bookmark.
- `git merge [bookmark]/[branch]`: Combine the bookmarked branch with the current local branch.
- `git push [alias] [branch]`: Upload all commits from the local branch to GitHub.
- `git pull`: Download the bookmarked history and incorporate changes.

## First Project
- `git log`: List all commits along with their respective information.
  - `git log > commits.txt`: Create a file with the content of git log.
- `git checkout 'commit code'`: Navigate between commits and branches. Using 'master' instead of the code moves to the latest commit.
- `git reset`: Similar to checkout, but it removes commits.
  - `git reset --soft 'commit code'`: Delete a commit without affecting the working area (no impact on the code).
  - `git reset --mixed`: Clear the staging area without affecting the working area.
  - `git reset --hard`: Discard everything in the commit.

## Branches and Merges
- **Head**: The commit you are currently on.
- **Branches**: The project's timeline. When you create a new branch, it inherits from the previous one (usually Master), and from that point onwards, commits are only saved to this branch.
  - Main/Master Branch: Created by default when using git init, this is where commits are made.
- `git branch`: Show all branches.
- `git branch 'Branch Name'`: Create a new branch from Head.
- `git checkout 'Branch Name'`: Besides navigating between commits, it also allows you to switch between branches.
- `git checkout -b 'Branch Name'`: Create a branch and switch to it.
- `git branch -D 'Branch Name'`: Delete a branch.
- `git merge 'Branch Name'`: The selected branch is absorbed by the current branch.
- `git branch -a`: Show all branches, including hidden ones.

## Repository Managers (GitHub, GitLab, etc.)
- `git remote`: Link the local project to a remote project.
- `git remote add origin ‘https’`:
- `git remote -v`: Confirm the link.
- `git remote remove origin`: Remove the link.
- `git push`: Send changes (commits) from your PC to GitHub.
- `git push origin master`: Upload the master branch.
- `git push origin 'Branch Name'`: Upload a branch, creating a new one on GitHub.

## GitHub
- **Issues**: Suggestions, comments to others, things to fix in your own code, etc.
- **Milestones**: Groups of issues that apply to a project, feature, or time period.
- **Labels**: A way to categorize different types of issues based on their problem type.

## Tags
- Tags: Specific points in your project's history used to mark a certain version.
- `git commit --amend -m "New commit name"`: Changes the name of the current commit.
- `git push origin master -f`: Forces the push to upload changes even if there are no code changes but there are new commits.
- `git tag -a v1.0 -m "Message"`: Annotated tags, stored as complete objects within Git and contain more information. The version can be chosen as desired, such as v0.8 for the 8th commit, for example.
- `git tag v1.0`: Lightweight tags, a simpler way to create tags with less information.
- `git tag -a v1.0 -m "Message" '[SHA]'`: By adding the SHA code, you can specify where the tag will be applied.
- `git push origin v1.0`: Pushes the selected version of the tags.
- `git push origin --tags`: Uploads all tags.
- `git show v1.0`: Displays information about that version.

## Workflows
- **Workflow**: A workflow for managing your own projects, working in teams, or with third parties.
The above information covers personal projects. The following information is about team projects (organizations):

- `git fetch origin`: Fetches changes from the remote repository to origin/master.
- `git merge origin/master`: Merges origin/master branch into the current branch.
  - Fast-forward: Changes do not conflict.
  - Auto-merging: Changes conflict with changes made by others in the group.
- `git push origin master`: Uploads changes.

For projects with third parties, where you are not an owner or collaborator but want to participate:
- **Fork**: Clones the original or main repository, unlike Git. Now you'll have one more hidden branch. In addition to 'origin,' you will have 'upstream' (there may be more; check with `git branch -a`), 'upstream/master,' and 'origin/master.' Fork when you want to contribute to the code.
- 
First, fork the project on GitHub, then download the project from your fork's https, edit it.

- `git fetch upstream`
- `git fetch origin`

## GitHub Pages
Websites for you and your projects. You can generate a website from your organization or project.

For your user:
1. Create a repository named username.github.io.
2. `git clone` it.
3. Create web code.
4. Upload changes to GitHub (`git push...`).
Once done, you'll have the domain: username.github.io. Whatever you have in the repository is what will appear on the domain.

For a project:
1. Create a repository.
2. `git clone` it and create a 'gh-pages' branch (git branch gh-pages).
3. Create web code.
4. Upload changes to GitHub (`git push...`). Everything in the 'gh-pages' branch will be on your domain: username.github.io/repositoryname.

## Deployment
Only if you have a server. SSH allows easy connection to a server or servers without entering a password each time.

With ssh-keygen, you generate a public and private key pair.
To connect to the server ssh root@domain.com, with the domain or IP if you don't have a domain yet.

`git pull`: Equivalent to `git fetch` + `git merge`.

## Hooks
Mechanisms to trigger scripts when certain actions occur.
- post-commits: Automatically execute commands when git commit -m "Message" is executed.
- post-checkout
- post-merge
- post-rewrite

In the .git folder, you'll find a folder called 'hooks,' and inside, some pre-made hooks. To create a hook, for example, `touch post-commit`, then `nano post-commit` to write the content.

Content:
```shell
#!/bin/sh  # Indicates it's a shell script
git push origin branch-or-master
ssh root@domain.com 'bash -s' < deployment.sh  # Connects to the server and executes the shell
```

Finally, give commit privileges: `chmod +x post-commit`.
Now create a deployment file: `touch deployment.sh`.

deployment.sh:
```shell
#!/bin/sh
cd directory  # Moves to the directory
git pull origin branch-or-master
sudo service ghost restart  # Restarts the server, Ghost API
```

## Steps
```bash
# 1. Init
git init

# 2. Add changes
git add -A

# 3. Check added files
git status

# 4. Commit
git commit -m "Message"

# 5. Check commits
git log

# 6. Checkout
git checkout 'commit sha'

# 7. Checkout master
git checkout master

# 8. Reset (soft)
git reset --soft 'commit sha'

# 9. Create branch
git branch Branch

# 10. Checkout branch
git checkout Branch1

# 11. Make changes in Branch1

# 12. Checkout master 
git checkout master 

# 13. We are on master, which is the branch that will absorb Branch1
git merge Branch1 

# 14. Delete Branch1
git branch -D Branch1

# 15. GitHub

# 16. Create repository on GitHub, folder and repository better have the same name

# 17. Add remote origin
git remote add origin 'https'

# 18. To check
git remote -v

# 19. Download, clone, and update
git fetch origin
git clone 'https' 
git pull origin master

# 20. To remove the link between the folder and GitHub, if needed
git remote remove origin

# 21. Push from PC to GitHub
git push origin master

# 22. Upload branch from PC to GitHub
git push origin Branch1

# 23. To delete a branch on GitHub, it must be done from the website

# 24. Issues, milestones, and labels from GitHub, to 

# 25. Tags (version tags)

# 26. Commit number 8
git tag -a v0.8 -m "Version 0.8 of our project"

# 27. Code of the second commit
git tag -a v0.2 -m "Version 0.2 of our project" 'commit sha'

# 28. Push v0.8 to GitHub
git push origin v0.8

# 29. Workflows

# 30. Communities

# 31. Show hidden branches 'remotes/origin/master'
git branch -a

# 32. Fetch to upload to origin/master
git fetch origin

# 33. Merge origin/master
git merge origin/master

# 34. Projects with third parties (fork)

# 35. upstream/master branch is the original repository from which you fork
git fetch upstream

# 36. origin/master branch is your repository, a clone of the original
git fetch origin

# 37. Finally, create a new pull request on GitHub

# 38. GitHub Pages (create a project)

# 39. Create 'gh-pages' branch
```
