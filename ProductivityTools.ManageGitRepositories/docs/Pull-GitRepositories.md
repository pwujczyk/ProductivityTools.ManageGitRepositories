---
external help file: ProductivityTools.PSManageGitRepositories-help.xml
Module Name: ProductivityTools.PSManageGitRepositories
online version:
schema: 2.0.0
---

# Pull-GitRepositories

## SYNOPSIS
Performs git pull for directories found under given directory.

## SYNTAX

```
Pull-GitRepositories [[-Directory] <String>] [<CommonParameters>]
```

## DESCRIPTION
It iterates through list of directories under directory provided and invokes git pull for each repository.

## EXAMPLES

### Example 1
```powershell
PS C:\> Pull-GitRepositories D:\GitHub\
```

It will open GitHub directory and for each directory inside will invoke git pull

## PARAMETERS

### -Directory
Directory which contains git repositories.

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
