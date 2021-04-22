---
external help file: ProductivityTools.PSManageGitRepositories-help.xml
Module Name: ProductivityTools.PSManageGitRepositories
online version:
schema: 2.0.0
---

# Push-GitRepository

## SYNOPSIS
It performs pushes changes to the rpeository

## SYNTAX

```
Push-GitRepository [[-Directory] <String>] [<CommonParameters>]
```

## DESCRIPTION
If current branch is ahead of remote, it pushes it, if you have currently not commited changes it creates AutoCommit branch and pushes all changes to it.

## EXAMPLES

### Example 1
```powershell
PS C:\> Push-GitRepository -Directory D:\GitHub\ProductivityTools.ConnectionString\
```

It will go to that directory check if any changes are done and push them.

## PARAMETERS

### -Directory
Directory for which operation should be performed.

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
