install-windowsfeature RSAT-ADDS,AD-Domain-Services

Import-Module ADDSDeployment

$secpasswd = ConvertTo-SecureString "p@ssword1!" -AsPlainText -Force
$mycreds = New-Object System.Management.Automation.PSCredential ("vmadmin", $secpasswd)


Install-ADDSForest `
-CreateDnsDelegation:$false `
-DatabasePath “C:\Windows\NTDS” `
-DomainMode “Win2012R2” `
-DomainName “testdom.com” `
-DomainNetbiosName “TESTDOM” `
-ForestMode “Win2012R2” `
-InstallDns:$true `
-LogPath “C:\Windows\NTDS” `
-NoRebootOnCompletion:$false `
-SysvolPath “C:\Windows\SYSVOL” `
-Force:$true `
-SafeModeAdministratorPassword $secpasswd