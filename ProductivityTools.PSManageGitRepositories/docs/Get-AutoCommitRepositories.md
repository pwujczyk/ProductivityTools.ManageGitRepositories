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
Get-AutoCommitRepositories [[-Directory] <String>] [<CommonParameters>]
```

## DESCRIPTION
It scans provided directory, founds git directories and check if AutoCommitBranch branch exists. 

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-AutoCommitRepositories -Directory D:\GitHub\
```

This will look for all directories in D:\GitHub path. For each directory it will check if it is git repository and it will show information if AutoCommitBranch exists or not.

## PARAMETERS

### -Directory
Directory in which git repositories should be looked for.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
