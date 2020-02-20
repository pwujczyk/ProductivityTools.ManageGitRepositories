---
external help file: ProductivityTools.PSManageGitRepositories-help.xml
Module Name: ProductivityTools.PSManageGitRepositories
online version:
schema: 2.0.0
---

# Get-GitRepositoriesStatus

## SYNOPSIS
It checks if repositories in directory have something to commit

## SYNTAX

```
Get-GitRepositoriesStatus [[-Directory] <String>] [<CommonParameters>]
```

## DESCRIPTION
It opens directories in provided path, checks if it git repository and checks if repository has something to commit.

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-GitRepositoriesStatus -Directory D:\GitHub\
```

It will iterate through directories in d:\GitHub and for each directory it will check if something to commit exists.

## PARAMETERS

### -Directory
Directory which should contain other directories with git repositories.

