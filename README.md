<!--Category:PowerShell--> 
 <p align="right">
    <a href="https://www.powershellgallery.com/packages/ProductivityTools.ManageGitRepositories/"><img src="Images/Header/Powershell_border_40px.png" /></a>
    <a href="http://productivitytools.tech/manage-git-repositories/"><img src="Images/Header/ProductivityTools_green_40px_2.png" /><a> 
    <a href="https://github.com/pwujczyk/ProductivityTools.ManageGitRepositories"><img src="Images/Header/Github_border_40px.png" /></a>
</p>
<p align="center">
    <a href="http://http://productivitytools.tech/">
        <img src="Images/Header/LogoTitle_green_500px.png" />
    </a>
</p>

# Manage Git repositories


The module allows managing multiple repositories at the same time. I am using it as a backup tool. 

<!--more-->

Every day I am scanning my repositories and check if any of them has some uncommitted changes. If yes, changes are pushed. If changes weren't staged, a new *AutoCommitBranch* branch is created and data is pushed there.

The module also allows me to update all repositories from the given directory.

Check out the detailed description of the commands below.

## Pull-GitRepository

Performs git pull for a given directory. Following command will

- open `D:\GitHub\ProductivityTools.ConnectionString\`
- check if the directory is the git repository
- perform a git pull 
- show message.

```powershell
Pull-GitRepository D:\GitHub\ProductivityTools.ConnectionString\
```

![PullGitRepository](./Images/PullGitRepository.png)


## Pull-GitRepositories
Iterates through the list of directories under the directory provided and invokes git pull for each repository.

```powershell
Pull-GitRepositories D:\GitHub\
```
![Pull-GitRepositories](./Images/PullGitRepositories.png)

## Push-GitRepository
It pushes changes to the Git repository. If the current branch is ahead of the remote, it will push it, if changes are not committed it will create AutoCommit branch and push all changes to it.


<!--og-image-->
![Push-GitRepository](./Images/PushGitRepositoryDiagram.png)

```powershell
Push-GitRepository -Directory D:\GitHub\ProductivityTools.ConnectionString\
```
![Push-GitRepository](./Images/PushGitRepository.png)

## Push-GitRepositories
It iterates through given directory and for each directory inside it will invoke Push-GitRepository cmdlet.

```powershell
Push-GitRepositories D:\GitHub\
```

It will open GitHub directory and for each directory inside it will invoke Push-GitRepository

![Push-GitRepositories](./Images/PushGitRepositories.png)

## Get-AutoCommitRepository

Checks if git repository contains AutoCommitBranch branch. 

```powershell
Get-AutoCommitRepository D:\GitHub\ProductivityTools.Meetings\
```
![Get-AutoCommitRepository](./Images/GetAutoCommitRepository.png)


## Get-AutoCommitRepositories
Iterates through all git repositories inside a provided directory and invoke Get-AutoCommitRepository for each.

```powershell
Get-AutoCommitRepositories -Directory D:\GitHub\
```

![Get-AutoCommitRepositories](./Images/GetAutoCommitRepositories.png)


## Get-GitRepositoryStatus
Checks if the given repository has something to be committed.

```powershell
Get-GitRepositoryStatus D:\GitHub\ProductivityTools.ConnectionString\
```

![Get-GitRepositoryStatus](./Images/GetGitRepositoryStatus.png)


## Get-GitRepositoriesStatus
Iterates through all git repositories inside provided directory and invoke Get-GitRepositoryStatus for each.

```powershell
Get-GitRepositoriesStatus -Directory D:\GitHub\
```
![Get-GitRepositoriesStatus](./Images/GetGitRepositoriesStatus.png)



## Commit-GitRepository

Adds all changes with ``git add . `` command. Commit the changes with message

```powershell
Commit-GitRepository -Directory d:\Github\GithubRepo -Message "Important Commit"
```

## Commit-GitRepositories

Performs ``Commit-GitRepository`` on each directory in the provided directory

```powershell
Commit-GitRepositories -Directory D:\Github -Message "Multiple repos will be commited with the same message"
```





