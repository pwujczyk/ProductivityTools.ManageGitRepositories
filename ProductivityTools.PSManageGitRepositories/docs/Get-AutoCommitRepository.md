---
external help file: ProductivityTools.PSManageGitRepositories-help.xml
Module Name: ProductivityTools.PSManageGitRepositories
online version:
schema: 2.0.0
---

# Get-AutoCommitRepository

## SYNOPSIS
Displays information if git repository contains AutoCommitBranch branch.

## SYNTAX

```
Get-AutoCommitRepository [[-Directory] <String>] [<CommonParameters>]
```

## DESCRIPTION
Displays information if git repository contains AutoCommitBranch branch. It is used just as information.

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-AutoCommitRepository D:\GitHub\ProductivityTools.Meetings\
```

It will check the directory D:\GitHub\ProductivityTools.Meetings\ and display information if it is git repository and next if this git reposiotry has AutoCommitBranch branch.

## PARAMETERS

### -Directory
Directory which should be checked.

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
