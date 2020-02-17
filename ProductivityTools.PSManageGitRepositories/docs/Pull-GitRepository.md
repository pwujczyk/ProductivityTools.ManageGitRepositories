---
external help file: ProductivityTools.PSManageGitRepositories-help.xml
Module Name: ProductivityTools.PSManageGitRepositories
online version:
schema: 2.0.0
---

# Pull-GitRepository

## SYNOPSIS
It performs git pull for given directory.

## SYNTAX

```
Pull-GitRepository [[-Directory] <String>] [<CommonParameters>]
```

## DESCRIPTION
It performs git pull for given directory.

## EXAMPLES

### Example 1
```powershell
PS C:\> Pull-GitRepository D:\GitHub\ProductivityTools.ConnectionString\
```

It will open D:\GitHub\ProductivityTools.ConnectionString\ checks if directory is git repository, perform git pull and show message.

## PARAMETERS

### -Directory
Directory

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
