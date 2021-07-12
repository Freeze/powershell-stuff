$user="Holden1"
$group="TestGroup"
$members = Get-ADGroupMember -Identity $group -Recursive | Select -ExpandProperty Name

If ($members -contains $user) {
    Write-Host "$user exists in the group"
    $inGroup = $true
    } Else {
    Write-Host "$user not in group!"
    $inGroup = $false
    }

If ($inGroup) { Write-Host "In Group!"} Else { Write-Host "Mot in group!" }
