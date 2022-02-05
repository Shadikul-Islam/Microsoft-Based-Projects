## <p align=left>How to Create Local User of Windows Machine Using Azure Pipeline <br> <br> </p> 
| **SL** | **Topic** |
| --- | --- |
| 01 | [What is Local User of Windows Machine?](#01) |
| 02 | [What is Azure Pipeline?](#02) |
| 03 | [Powershell Commands to Create Local User to the Remote Windows Machine](#03) |
| 04 | [Powershell Commands to Create Local User to the Remote Windows Machine](#04)  |
| 05 | [Combine All Powershell Commands](#05) |
| 06 | [Prepare an Azure Pipeline to Run This Script](#06)|
| 07 | [Check the Local User that You Added](#07)|

### <a name="01">:diamond_shape_with_a_dot_inside: &nbsp;What is Local User of Windows Machine?</a>
In Windows, a local user is one whose username and encrypted password are stored on the computer itself. When you log in as a local user, the computer checks its own list of users and its own password file to see if you are allowed to log into the computer.

Local user accounts are stored locally on the server. These accounts can be assigned rights and permissions on a particular server, but on that server only. Local user accounts are security principals that are used to secure and manage access to the resources on a standalone or member server for services or users

### <a name="02">:diamond_shape_with_a_dot_inside: &nbsp;What is Azure Pipeline?</a>
Azure Pipeline is a cloud service that we can use to build and test our code project automatically. The Azure pipeline has a lot of capabilities such as continuous integration and continuous delivery to regularly and consistently test and builds our code and ship to any target.
Pipelines are the CI/CD tool that facilitates automated building, testing, and deployment. Azure Pipelines supports any programming language or platform which enables users to create pipelines that support Windows, Linux, and macOS using cloud-hosted agents.
These pipelines are easily extensible through the extensions available in the marketplace. Besides, they support advanced workflows that can be used to facilitate:
- Multi-phase builds
- Test integrations
- Custom reporting functions

### <a name="03">:diamond_shape_with_a_dot_inside: &nbsp;Steps for Creating Local User Using Powershell</a>
Here I will Describe the steps that we need to follow to complete this task.

### <a name="03">:diamond_shape_with_a_dot_inside: &nbsp;Powershell Commands for Connecting to the Remote Windows Machine</a>
At first you have to connect to the remote windows machine via powershell. To connect you need to run this PowerShell Command.

```PowerShell
$myPwd=<"VM-Password">
$username=<"VM-Username">
$password = ConvertTo-SecureString $myPwd -AsPlainText -Force 
$credentials= New-Object System.Management.Automation.PSCredential ($username, $password)
$session = New-PSSession -ComputerName <VM-IP(10.10.10.10)> -Credential $credentials
```

#### You can read this Documentation for more details about [how to Establish a Remote Connection to a Windows VM Using Powershell](https://github.com/Shadikul-Islam/Microsoft-Based-Projects/blob/master/Remote-Connection-Windows-VM-Powershell/Documentation.md).

### <a name="04">:diamond_shape_with_a_dot_inside: &nbsp;Powershell Commands to Create Local User to the Remote Windows Machine</a>
Now we need PowerShell commands that will add users to that remote VM. Here are the commands.

```PowerShell
Invoke-Command -Session $session -ScriptBlock { $Password = ConvertTo-SecureString <"Local User Password"> -AsPlainText -Force }
Invoke-Command -Session $session -ScriptBlock { New-LocalUser <"Local-User-Name"> -Password $Password -FullName <"Local-User-Full-Name"> -Description <"Description-About-Local-User" }
Invoke-Command -Session $session -ScriptBlock { Add-LocalGroupMember -Group Administrators -Member <Local-User-Name>; Get-LocalGroupMember -Name administrators; Exit-PSSession }
```

In first command ```PowerShell $Password = ConvertTo-SecureString <"Local User Password"> -AsPlainText -Force ``` You need to provide the password for the User. This command will convert your password as plain text.
<br><br>In second command ```PowerShell New-LocalUser <"Local-User-Name"> -Password $Password -FullName <"Local-User-Full-Name"> -Description <"Description-About-Local-User" ``` You need to provide the local user name, user full name, and Description of that user. This command will create a user in your windows machine.
<br><br>In third command ```PowerShell Add-LocalGroupMember -Group Administrators -Member <Local-User-Name>; Get-LocalGroupMember -Name administrators; Exit-PSSession ``` This command will give administrator permission to that local user.

### <a name="05">:diamond_shape_with_a_dot_inside: &nbsp;Combine All Powershell Commands</a>
Let's combine all Powershell commands. The final script will be:

```PowerShell
$myPwd=<"VM-Password">
$username=<"VM-Username">
$password = ConvertTo-SecureString $myPwd -AsPlainText -Force 
$credentials= New-Object System.Management.Automation.PSCredential ($username, $password)
$session = New-PSSession -ComputerName <VM-IP(10.10.10.10)> -Credential $credentials
Invoke-Command -Session $session -ScriptBlock { $Password = ConvertTo-SecureString <"Local User Password"> -AsPlainText -Force }
Invoke-Command -Session $session -ScriptBlock { New-LocalUser <"Local-User-Name"> -Password $Password -FullName <"Local-User-Full-Name"> -Description <"Description-About-Local-User" }
Invoke-Command -Session $session -ScriptBlock { Add-LocalGroupMember -Group Administrators -Member <Local-User-Name>; Get-LocalGroupMember -Name administrators; Exit-PSSession } 
```
You can also get this script **[here.](https://github.com/Shadikul-Islam/Microsoft-Based-Projects/blob/master/Azure%20DevOps-Create%20Local%20User%20of%20Windows%20Machine%20Using%20Azure%20Pipeline/Script/Create%20Local%20User%20Using%20Powershell%20from%20Azure%20Pipeline.ps1)**

### <a name="06">:diamond_shape_with_a_dot_inside: &nbsp;Prepare an Azure Pipeline to Run This Script</a>
Now you need to prepare an Azure Pipeline to run this script. Go to Go to [Azure DevOps Portal](https://dev.azure.com/) --> Click Project Name --> Azure Repos --> Upload your script in Azure Repos --> --> Pipelines --> New Pipeline and Configure that pipeline using that repos. I already created a document how to do that. you can **Read this Documentation for more details about [How to Run Powershell Script in Azure Pipeline in Azure DevOps](https://github.com/Shadikul-Islam/Microsoft-Based-Projects/blob/master/Azure%20DevOps-How%20to%20Run%20Powershell%20Script%20in%20Azure%20Pipeline/Documentation.md)**.

### <a name="07">:diamond_shape_with_a_dot_inside: &nbsp; Check the Local User that You Added</a>
1. Go to that Windows Machine Via RDP (Remote Desktop Connection). Open Windows Powershell. Run this command ``` get-localuser ```. Now you will see your all users.
2. Or you can establish a remote connection on that VM from your local PC Powershell. To do that, Open your PC Powershell --> Run this Script.

```PowerShell
$myPwd=<"VM-Password">
$username=<"VM-Username">
$password = ConvertTo-SecureString $myPwd -AsPlainText -Force 
$credentials= New-Object System.Management.Automation.PSCredential ($username, $password)
Enter-PSSession -ComputerName <VM-IP-Address> -Credential $credentials
```
You will be on that VM now. Run this command ``` get-localuser ```. Now you will see your all users.<br><br>
<img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Projects/blob/master/Azure%20DevOps-Create%20Local%20User%20of%20Windows%20Machine%20Using%20Azure%20Pipeline/Images/Image-1.png" alt="User Showing"> <br><br>

#### :diamond_shape_with_a_dot_inside: &nbsp;That’s it. We have learned How to Create Local User of Windows Machine Using Azure Pipeline. Happy Learning.  :diamond_shape_with_a_dot_inside: &nbsp;
