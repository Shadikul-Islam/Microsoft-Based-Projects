$myPwd= <"VM-Password">
$username= <"VM-Username">
$password = ConvertTo-SecureString $myPwd -AsPlainText -Force
$credentials= New-Object System.Management.Automation.PSCredential ($username, $password)
Enter-PSSession -ComputerName <VM-IP-Address> -Credential $credentials
