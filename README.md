<!--Category:PowerShell--> 
 <p align="right">
    <a href="https://www.powershellgallery.com/packages/ProductivityTools.ManageGitRepositories/"><img src="Images/Header/Powershell_border_40px.png" /></a>
    <a href="http://productivitytools.tech/clone-git-repositories/"><img src="Images/Header/ProductivityTools_green_40px_2.png" /><a> 
    <a href="https://github.com/pwujczyk/ProductivityTools.ManageGitRepositories"><img src="Images/Header/Github_border_40px.png" /></a>
</p>
<p align="center">
    <a href="http://http://productivitytools.tech/">
        <img src="Images/Header/LogoTitle_green_500px.png" />
    </a>
</p>

# Manage Git repositories


Module allows to manage multiple repositories at the same time. I am using it as a backup tool. Every day I am scanning my repositories and check if any of it has some uncommited changes. If yes, changes are pushed. If changes weren't staged, new *AutoCommitBranch* branch is created and data is pushed there.

Module also allow me to update all repositories from given directory.

Check out detailed description of the commands below.

## Get-AutoCommitRepositories
Shows all git repositories with auto created branch. It scans provided directory, founds git directories and check if AutoCommitBranch branch exists.

```powershell
PS C:\> Get-AutoCommitRepositories -Directory D:\GitHub\
```

This will look for all directories in D:\GitHub path. For each directory it will check if it is git repository and it will show information if AutoCommitBranch exists or not.

## Get-AutoCommitRepository

Displays information if git repository contains AutoCommitBranch branch. Displays information if git repository contains AutoCommitBranch branch. It is used just as information.

```powershell
PS C:\> Get-AutoCommitRepository D:\GitHub\ProductivityTools.Meetings\
```

It will check the directory D:\GitHub\ProductivityTools.Meetings\ and display information if it is git repository and next if this git reposiotry has AutoCommitBranch branch.


## Get-GitRepositoriesStatus
It checks if repositories in directory have something to commit. It opens directories in provided path, checks if it git repository and checks if repository has something to commit.

```powershell
PS C:\> Get-GitRepositoriesStatus -Directory D:\GitHub\
```

It will iterate through directories in d:\GitHub and for each directory it will check if something to commit exists.



## Get-GitRepositoryStatus
Check if given repository something is to be commited. It opens the directory and checks if in given repository some changes were done which should be commited.

```powershell
PS C:\> Get-GitRepositoryStatus D:\GitHub\ProductivityTools.ConnectionString\
```

It will check if in the D:\GitHub\ProductivityTools.ConnectionString\ changes were done. 


## Pull-GitRepositories
It iterates through list of directories under directory provided and invokes git pull for each repository.

```powershell
PS C:\> Pull-GitRepositories D:\GitHub\
```

It will open GitHub directory and for each directory inside will invoke git pull

## Pull-GitRepository
It performs git pull for given directory.

```powershell
PS C:\> Pull-GitRepository D:\GitHub\ProductivityTools.ConnectionString\
```

It will open D:\GitHub\ProductivityTools.ConnectionString\ checks if directory is git repository, perform git pull and show message.


## Push-GitRepositories
It iterates through directory and for each will invoke Push-GitRepository comdlet.
It will open GitHub directory and foreach directory inside it will invoke Push-GitRepository

```powershell
PS C:\> Push-GitRepositories D:\GitHub\
```

It will open GitHub directory and foreach directory inside it will invoke Push-GitRepository

## Push-GitRepository
It performs pushes changes to the rpeository. If current branch is ahead of remote, it pushes it, if you have currently not commited changes it creates AutoCommit branch and pushes all changes to it.

```powershell
PS C:\> Push-GitRepository -Directory D:\GitHub\ProductivityTools.ConnectionString\
```

It will go to that directory check if any changes are done and push them.



