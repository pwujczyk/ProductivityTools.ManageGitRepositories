function Push-GitRepositories([string] $Directory)
{
	$directories=Get-ChildItem $Directory | ?{ $_.PSIsContainer }
	foreach($dir in $directories)
	{
		$directoryPath=$dir.FullName
		cd $directoryPath
		if($(Test-Path ".git") -eq $true)
		{
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
				git push --all $remote
			}		
		}
	}	
}

function Pull-GitRepositories([string] $Directory)
{
	$directories=Get-ChildItem $Directory   | ?{ $_.PSIsContainer }
	#$directories | ForEach-Object - {
	foreach ($dir in $directories)
	{
		$directoryPath=$dir.FullName
		Write-Host "Checking repository $directoryPath"
		cd $directoryPath
		if($(Test-Path ".git") -eq $true)
		{
			git pull
		}
	}	
}

function Get-GitRepositoriesStatus([string] $Directory)
{
	Push-Location 
	$directories=Get-ChildItem $Directory   | ?{ $_.PSIsContainer }
	foreach($dir in $directories)
	{
		$directoryPath=$dir.FullName
		cd $directoryPath
		if($(Test-Path ".git") -eq $true)
		{
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
	}	
	Pop-Location
}

Export-ModuleMember Push-GitRepositories
Export-ModuleMember Pull-GitRepositories
Export-ModuleMember Get-GitRepositoriesStatus
