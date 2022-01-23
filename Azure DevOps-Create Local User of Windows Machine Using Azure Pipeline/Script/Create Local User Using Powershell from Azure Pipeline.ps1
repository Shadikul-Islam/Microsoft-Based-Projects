$myPwd=<"VM-Password">
$username=<"VM-Username">
$password = ConvertTo-SecureString $myPwd -AsPlainText -Force 
$credentials= New-Object System.Management.Automation.PSCredential ($username, $password)
$session = New-PSSession -ComputerName <VM-IP(10.10.10.10)> -Credential $credentials
Invoke-Command -Session $session -ScriptBlock { $Password = ConvertTo-SecureString <"Local User Password"> -AsPlainText -Force }
Invoke-Command -Session $session -ScriptBlock { New-LocalUser <"Local-User-Name"> -Password $Password -FullName <"Local-User-Full-Name"> -Description <"Description-About-Local-User" }
Invoke-Command -Session $session -ScriptBlock { Add-LocalGroupMember -Group Administrators -Member <Local-User-Name>; Get-LocalGroupMember -Name administrators; Exit-PSSession } 
