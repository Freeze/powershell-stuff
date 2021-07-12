$path="CN=Users,DC=holden,DC=com"
$username="GenericUser"
$count=1..2
foreach ($i in $count) { 
    Write-Host "Creating AD User: $($username)"
    $NewUserParams = @{
      'Name' = "Holden$($i)"
      'Path' = $path
      'Enabled' = $true
      'ChangePasswordAtLogon' = $false
      'AccountPassword' = (ConvertTo-SecureString "P@ssW0rd02" -AsPlainText -Force)
      }
    New-ADUser @NewUserParams
    }
