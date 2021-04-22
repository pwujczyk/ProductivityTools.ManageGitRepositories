---
external help file: ProductivityTools.PSManageGitRepositories-help.xml
Module Name: ProductivityTools.PSManageGitRepositories
online version:
schema: 2.0.0
---

# Push-GitRepositories

## SYNOPSIS
Iterate through directory and for each git repository pushes changes to remote.

## SYNTAX

```
Push-GitRepositories [[-Directory] <String>] [<CommonParameters>]
```

## DESCRIPTION
It iterate through directory and for each will invoke Push-GitRepository comdlet.

## EXAMPLES

### Example 1
```powershell
PS C:\> Push-GitRepositories D:\GitHub\
```

It will open GitHub directory and foreach directory inside it will invoke Push-GitRepository

## PARAMETERS

### -Directory
Directory which should be analysed

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
