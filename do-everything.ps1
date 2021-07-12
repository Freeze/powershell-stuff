param $(username) 
$path="CN=Users,DC=holden,DC=com"
$group="BT_SA_RegAccounts"
$members = Get-ADGroupMember -Identity $group -Recursive | Select -ExpandProperty Name

$count=1..2

If ($members -contains $user) {
    Write-Host "$username was found in group $group!"
    $inGroup = $true
    } Else {
    Write-Host "$username not in $group!"
    $inGroup = $false
    }

If ($inGroup) {
    Write-Host "User is in group.  Done!"
    } Else { 
    Write-Host "User is not in group.  Adding!" 
    Add-ADGroupMember -Identity $group -Members $username
    }

#foreach ($i in $count) { 
#    Write-Host "Creating AD User: $($username)"
#    $NewUserParams = @{
#      'Name' = "Holden$($i)"
#      'Path' = $path
#      'Enabled' = $true
#      'ChangePasswordAtLogon' = $false
#      'AccountPassword' = (ConvertTo-SecureString "P@ssW0rd02" -AsPlainText -Force)
#      }
#    New-ADUser @NewUserParams
#    }
