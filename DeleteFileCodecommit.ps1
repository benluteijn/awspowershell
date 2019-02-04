<#

.SYNOPSIS
Delete file in CodeCommit with PowerShell

.DESCRIPTION
Delete file in CodeCommit with PowerShell

.EXAMPLE
.\DeleteFileCodecommit.ps1

.NOTES
    Script name:    DeleteFileCodecommit.ps1
    Author:         Ben Luteijn
    DateCreated:    January 25, 2019
    Version:        0.1
    Status:         Concept

#>

# Set variables
Set-Variable -Name Region           -Value "<Fill in Region>"
Set-Variable -Name ProfileName      -Value "<Fill in Profile>"
Set-Variable -Name RepositoryName   -Value "<Fill in Repository>"
Set-Variable -Name File             -Value "<Fill in File>"

# Get Branch
$GetBranchName = Get-CCBranchList -RepositoryName $RepositoryName -ProfileName $ProfileName -Region $Region

# Get ParentCommitId
$GetParentCommitId = Get-CCBranch -RepositoryName $RepositoryName -BranchName $GetBranchName -ProfileName $ProfileName -Region $Region | Select-Object -Property CommitId -ExpandProperty CommitId

# Remove file CodeCommit with PowerShell
Remove-CCFile -RepositoryName $RepositoryName -BranchName $GetBranchName -FilePath $File -ParentCommitId $GetParentCommitId -ProfileName $ProfileName -Region $Region -Force
