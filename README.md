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


Module allows to manage multiple repositories at the same time. I am using it as a backup tool. 

<!--more-->

Every day I am scanning my repositories and check if any of it has some uncommited changes. If yes, changes are pushed. If changes weren't staged, new *AutoCommitBranch* branch is created and data is pushed there.

Module also allow me to update all repositories from given directory.

Check out detailed description of the commands below.

## Pull-GitRepository

Performs git pull for given directory. Following command will

- open `D:\GitHub\ProductivityTools.ConnectionString\`
- check if directory is git repository
- perform git pull 
- show message.

```powershell
Pull-GitRepository D:\GitHub\ProductivityTools.ConnectionString\
```

![PullGitRepository](./Images/PullGitRepository.png)


## Pull-GitRepositories
Iterates through list of directories under directory provided and invokes git pull for each repository.

```powershell
Pull-GitRepositories D:\GitHub\
```
![Pull-GitRepositories](./Images/PullGitRepositories.png)

## Push-GitRepository
It pushes changes to the Git repository. If current branch is ahead of remote, it will push it, if changes are not commited it will create AutoCommit branch and push all changes to it.


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

It will open GitHub directory and foreach directory inside it will invoke Push-GitRepository

![Push-GitRepositories](./Images/PushGitRepositories.png)

## Get-AutoCommitRepository

Checks if git repository contains AutoCommitBranch branch. 

```powershell
Get-AutoCommitRepository D:\GitHub\ProductivityTools.Meetings\
```
![Get-AutoCommitRepository](./Images/GetAutoCommitRepository.png)


## Get-AutoCommitRepositories
Iterates through all git repositories inside provided directory and invokes Get-AutoCommitRepository for each.

```powershell
Get-AutoCommitRepositories -Directory D:\GitHub\
```

![Get-AutoCommitRepositories](./Images/GetAutoCommitRepositories.png)


## Get-GitRepositoryStatus
Checks if given repository has something to be commited.

```powershell
Get-GitRepositoryStatus D:\GitHub\ProductivityTools.ConnectionString\
```

![Get-GitRepositoryStatus](./Images/GetGitRepositoryStatus.png)


## Get-GitRepositoriesStatus
Iterates through all git repositories inside provided directory and invokes Get-GitRepositoryStatus for each.

```powershell
Get-GitRepositoriesStatus -Directory D:\GitHub\
```
![Get-GitRepositoriesStatus](./Images/GetGitRepositoriesStatus.png)









