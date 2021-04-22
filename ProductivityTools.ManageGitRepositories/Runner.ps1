clear

cd $PSScriptRoot
Import-Module .\ProductivityTools.ManageGitRepositories.psm1 -Force
Get-GitRepositoriesStatus d:\GitHub
#Pull-GitRepositories d:\GitHub

Push-GitRepositories d:\GitHub
#Work
#Get-AutoCommitRepositories d:\GitHub
#Push-GitRepository 