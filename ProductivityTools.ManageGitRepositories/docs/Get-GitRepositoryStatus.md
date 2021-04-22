---
external help file: ProductivityTools.PSManageGitRepositories-help.xml
Module Name: ProductivityTools.PSManageGitRepositories
online version:
schema: 2.0.0
---

# Get-GitRepositoryStatus

## SYNOPSIS
Check if given repository something is to be commited.

## SYNTAX

```
Get-GitRepositoryStatus [[-Directory] <String>] [<CommonParameters>]
```

## DESCRIPTION
It opens the directory and checks if in given repository some changes were done which should be commited.

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-GitRepositoryStatus D:\GitHub\ProductivityTools.ConnectionString\
```

It will check if in the D:\GitHub\ProductivityTools.ConnectionString\ changes were done. 

## PARAMETERS

### -Directory
Directory in which checkup should be done.

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
