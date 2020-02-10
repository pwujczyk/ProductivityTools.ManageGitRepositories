---
external help file: ProductivityTools.PSManageGitRepositories-help.xml
Module Name: ProductivityTools.PSManageGitRepositories
online version:
schema: 2.0.0
---

# Get-AutoCommitRepositories

## SYNOPSIS
Shows all git repositories with auto created branch.

## SYNTAX

```
Get-AutoCommitRepositories [[-Directory] <String>]
```

## DESCRIPTION
It scans provided directory, founds git directories and check if AutoCommitBranch branch exists. 

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-AutoCommitRepositories -Directory D:\GitHub\
```

This will look for all directories in D:\GitHub path. For each directori it will check if it is git repository and it will show information if AutoCommitBranch exists or not.

## PARAMETERS

### -Directory
Direcory in which git repositories should be looked for.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

### None

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS