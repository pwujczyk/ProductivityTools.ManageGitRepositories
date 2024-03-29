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


function Push-GitRepository()
{
	Param(
		[string] $Directory= $(Get-Location)
	)

	Push-Location
	cd $Directory
	CheckIfGitRepository
	$status=git status
	if ($($status -Like "*Your branch is ahead*").Count -gt 0)
	{
		Write-Host "Git repository $directoryPath - ahead of, pushing" -ForegroundColor Red
		git push --all $remote
	}
	
	if ($($status -Like "*nothing to commit, working tree clean*").Count -gt 0)
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
}

function Commit-GitRepository()
{
	[cmdletbinding()]
	Param(
			
		[Parameter(Mandatory=$true)]
		[string]$Message,

		[string]$Directory= $(Get-Location)
	)
	Write-Verbose "Hello"
	Write-Verbose "Directory: $Directory"
	Push-Location

	cd $Directory
	CheckIfGitRepository
	git add .
	git commit -m "$message"
	Pop-Location
}

function Commit-GitRepositories()
{
	[cmdletbinding()]
	Param(
		[Parameter(Mandatory=$true)]
		[string]$Message,
		[string] $Directory= $(Get-Location)
	
	)
	Write-Verbose "Hello"
	PerformSingleActiononDirectory $Directory  {Param($directory) Commit-GitRepository "$Message" $directory }
}

function CommitPush-GitRepository()
{
	[cmdletbinding()]
	Param(
			
		[Parameter(Mandatory=$true)]
		[string]$Message,

		[string]$Directory= $(Get-Location)
	)

	Commit-GitRepository -Directory $Directory -Message $Message
	Push-GitRepository -Directory $Directory
}

function CommitPush-GitRepositories()
{
	[cmdletbinding()]
	Param(		
		[Parameter(Mandatory=$true)]
		[string]$Message,

		[string]$Directory= $(Get-Location)
	)

	Write-Verbose "Hello"
	PerformSingleActiononDirectory $Directory  {Param($directory) Commit-GitRepository "$Message" $directory}
	PerformSingleActiononDirectory $Directory  {Param($x) Push-GitRepository $x}
}


function Get-AutoCommitRepository()
{
	Param(
		[string] $Directory= $(Get-Location)
	)
	
	cd $Directory
	CheckIfGitRepository
	$branches=git branch -a
	
	if ([bool]($branches -like "*AutoCommitBranch*"))
	{
		Write-Host "Git repository '$Directory' has AutoCommitBranch" -ForegroundColor Red 
	}
	else
	{
		Write-Host "Git repository '$Directory' - no AutoCommitBranch exists" -ForegroundColor Green
	}
}

function Get-AutoCommitRepositories()
{
	Param(
		[string] $Directory= $(Get-Location)
	)
	
	PerformSingleActiononDirectory $Directory  {Param($x) Get-AutoCommitRepository $x}
}

function Pull-GitRepository()
{
	Param(
		[string] $Directory= $(Get-Location)
	)

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
}

function Get-GitRepositoryStatus()
{
	Param(
		[string] $Directory= $(Get-Location)
	)
	
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

function Get-GitRepositoriesStatus()
{
	Param(
		[Parameter(Mandatory=$false)]
		[string] $Directory= $(Get-Location)
	)
	PerformSingleActiononDirectory $Directory  {Param($x) Get-GitRepositoryStatus $x}
}

Export-ModuleMember Commit-GitRepository
Export-ModuleMember Commit-GitRepositories
Export-ModuleMember Push-GitRepository
Export-ModuleMember Push-GitRepositories
Export-ModuleMember Get-AutoCommitRepository
Export-ModuleMember Get-AutoCommitRepositories
Export-ModuleMember Pull-GitRepository
Export-ModuleMember Pull-GitRepositories
Export-ModuleMember Get-GitRepositoryStatus
Export-ModuleMember Get-GitRepositoriesStatus
Export-ModuleMember CommitPush-GitRepository
Export-ModuleMember CommitPush-GitRepositories
