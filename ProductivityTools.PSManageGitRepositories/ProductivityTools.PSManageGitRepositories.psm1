function PerformSingleActiononDirectory([string] $Directory,$scriptblock)
{
	Push-Location
	$directories=Get-ChildItem $Directory | ?{ $_.PSIsContainer }
	foreach($dir in $directories)
	{
		$directoryPath=$dir.FullName
		$scriptblock.Invoke($directoryPath)
	}	
	Pop-Location
}

function CheckIfGitRepository()
{
	if($(Test-Path ".git") -eq $false)
	{
		throw "Directory '$Directory' is not git repository"
	}
}

#function Work()
#{
#	PerformSingleActiononDirectory "d:\github"  {Param($x) Push-GitRepository $x}
#}


function Push-GitRepository([string] $Directory)
{
	Push-Location
	cd $Directory
	CheckIfGitRepository
	$status=git status -u
	if ($status -contains "nothing to commit, working tree clean")
	{
		Write-Host "Git repository $directoryPath - working tree clean" -ForegroundColor Green
	}
	else
	{
		Write-Host "Git repository $directoryPath - dirty, pushing" -ForegroundColor Red
		git checkout -b "AutoCommitBranch"
		git add .
		git commit -m "Automatic Commit"
		$remote=git remote
		git push -u $remote AutoCommitBranch #this needs to be done to make branch track remote
		git push --all $remote
	}		
	Pop-Location
}

function Push-GitRepositories([string] $Directory)
{
	PerformSingleActiononDirectory $Directory  {Param($x) Push-GitRepository $x}
	
#	Push-Location
#	$directories=Get-ChildItem $Directory | ?{ $_.PSIsContainer }
#	foreach($dir in $directories)
#	{
#		$directoryPath=$dir.FullName
#		Push-GitRepository $directoryPath
#	}	
#	Pop-Location
}

function Get-AutoCommitRepository([string] $Directory)
{
	cd $directoryPath
	CheckIfGitRepository
	$branches=git branch -a
	
	if ([bool]($branches -like "*AutoCommitBranch*"))
	{
		Write-Host "Git repository $directoryPath has AutoCommitBranch" -ForegroundColor Red 
	}
	else
	{
		Write-Host "Git repository $directoryPath - no AutoCommitBranch exists" -ForegroundColor Green
	}
}

function Get-AutoCommitRepositories([string] $Directory)
{
	PerformSingleActiononDirectory $Directory  {Param($x) Get-AutoCommitRepository $x}
#	Push-Location
#	$directories=Get-ChildItem $Directory   | ?{ $_.PSIsContainer }
#	foreach ($dir in $directories)
#	{
#		$directoryPath=$dir.FullName
#
#		
#	}	
#	Pop-Location
}

function Pull-GitRepository([string]$Directory)
{
	Push-Location
	cd $Directory
	CheckIfGitRepository
	
	$x=git pull
	if ($x='Already up to date.')
	{
		Write-Host "Repository $directoryPath - up to date" -ForegroundColor Green
	}
	else
	{
		$x
	}
	Pop-Location
}

function Pull-GitRepositories([string] $Directory)
{
	PerformSingleActiononDirectory $Directory  {Param($x) Pull-GitRepository $x}
#	$directories=Get-ChildItem $Directory   | ?{ $_.PSIsContainer }
#	foreach ($dir in $directories)
#	{
#		$directoryPath=$dir.FullName
#		Pull-GitRepository $directoryPath
#	}	
}

function Get-GitRepositoryStatus([string] $Directory)
{
	Push-Location
	cd $Directory
	CheckIfGitRepository
	$status=git status -u
	if ($status -contains "nothing to commit, working tree clean")
	{
		Write-Host "Git repository $directoryPath - working tree clean" -ForegroundColor Green
	}
	else
	{
		Write-Host "Git repository $directoryPath - dirty" -ForegroundColor Red
	}
}

function Get-GitRepositoriesStatus([string] $Directory)
{
	PerformSingleActiononDirectory $Directory  {Param($x) Get-GitRepositoryStatus $x}
#	Push-Location 
#	$directories=Get-ChildItem $Directory   | ?{ $_.PSIsContainer }
#	foreach($dir in $directories)
#	{
#		$directoryPath=$dir.FullName
#		cd $directoryPath
#		if($(Test-Path ".git") -eq $true)
#		{
#			$status=git status -u
#			if ($status -contains "nothing to commit, working tree clean")
#			{
#				Write-Host "Git repository $directoryPath - working tree clean" -ForegroundColor Green
#			}
#			else
#			{
#				Write-Host "Git repository $directoryPath - dirty" -ForegroundColor Red
#			}
#		}
#	}	
#	Pop-Location
}

Export-ModuleMember Push-GitRepository
Export-ModuleMember Push-GitRepositories
Export-ModuleMember Get-AutoCommitRepository
Export-ModuleMember Get-AutoCommitRepositories
Export-ModuleMember Pull-GitRepository
Export-ModuleMember Pull-GitRepositories
Export-ModuleMember Get-GitRepositoryStatus
Export-ModuleMember Get-GitRepositoriesStatus
