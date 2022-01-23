## <p align=center>Azure DevOps-Create Local User of Windows Machine Using Azure Pipeline <br> <br> </p>
| **SL** | **Topic** |
| --- | --- |
| 01 | [What is Loacal User of Windows Machine?](#01) |
| 02 | [What is Azure Pipeline?](#02) |
| 03 | [Steps for Creating Local User Using Powershell](#03)<br> 1. [Powershell Commands to Create Local User to the Remote Windows Machine](#031)<br> 2. [Powershell Commands to Create Local User to the Remote Windows Machine](#032) <br> 3. [Combine All Powershell Commands(#033)
| 04 | [](#04) |
| 05 | [How to Delete Self-Hosted Agent](#05) |
| 06 | [Troubleshoot Common Issues](#06) |

### <a name="01">:diamond_shape_with_a_dot_inside: &nbsp;What is Loacal User of Windows Machine?</a>
In Windows, a local user is one whose username and encrypted password are stored on the computer itself. When you log in as a local user, the computer checks its own list of users and its own password file to see if you are allowed to log into the computer.

Local user accounts are stored locally on the server. These accounts can be assigned rights and permissions on a particular server, but on that server only. Local user accounts are security principals that are used to secure and manage access to the resources on a standalone or member server for services or users

### <a name="02">:diamond_shape_with_a_dot_inside: &nbsp;What is Azure Pipeline?</a>
Azure Pipeline is a cloud service that we can use to build and test our code project automatically. The Azure pipeline has a lot of capabilities such as continuous integration and continuous delivery to regularly and consistently test and builds our code and ship to any target.
Pipelines are the CI/CD tool that facilitates automated building, testing, and deployment. Azure Pipelines supports any programming language or platform which enables users to create pipelines that support Windows, Linux, and macOS using cloud-hosted agents.
These pipelines are easily extensible through the extensions available in the marketplace. Besides, they support advanced workflows that can be used to facilitate:
- Multi-phase builds
- Test integrations
- Custom reporting functions

### <a name="03">:diamond_shape_with_a_dot_inside: &nbsp; Steps for Creating Local User Using Powershell</a>
Here I will Describe the steps that you need to follow to complete this task.

### 1. <a name="031">Powershell Commands for Connecting to the Remote Windows Machine</a>
At first you have to connect to the remote windows machine via powershell. To connect you need to run this PowerShell Command.

```PowerShell
$myPwd=<"VM-Password">
$username=<"VM-Username">
$password = ConvertTo-SecureString $myPwd -AsPlainText -Force 
$credentials= New-Object System.Management.Automation.PSCredential ($username, $password)
$session = New-PSSession -ComputerName <VM-IP(10.10.10.10)> -Credential $credentials
```

#### You can read this Documentation for more details about [how to Establish a Remote Connection to a Windows VM Using Powershell](https://github.com/Shadikul-Islam/Microsoft-Based-Projects/blob/master/Remote-Connection-Windows-VM-Powershell/Documentation.md).

### 2. <a name="032">Powershell Commands to Create Local User to the Remote Windows Machine</a>
Now we need PowerShell commands that will add users to that remote vm. Here are the commands.

```PowerShell
Invoke-Command -Session $session -ScriptBlock { $Password = ConvertTo-SecureString <"Local User Password"> -AsPlainText -Force }
Invoke-Command -Session $session -ScriptBlock { New-LocalUser <"Local-User-Name"> -Password $Password -FullName <"Local-User-Full-Name"> -Description <"Description-About-Local-User" }
Invoke-Command -Session $session -ScriptBlock { Add-LocalGroupMember -Group Administrators -Member <Local-User-Name>; Get-LocalGroupMember -Name administrators; Exit-PSSession }
```

In first command ```PowerShell $Password = ConvertTo-SecureString <"Local User Password"> -AsPlainText -Force ```, You need to provide the password for the User. This command will convert your password as plain text.
<br><br>In second command ```PowerShell New-LocalUser <"Local-User-Name"> -Password $Password -FullName <"Local-User-Full-Name"> -Description <"Description-About-Local-User" ```, You need to provide the Local User Name, User full name, and Description of that user. This command will create a user in your windows machine.
<br><br>In third command ```PowerShell Add-LocalGroupMember -Group Administrators -Member <Local-User-Name>; Get-LocalGroupMember -Name administrators; Exit-PSSession ```, This command will give administrator permission to that local user.

### 2. <a name="033>Combine All Powershell Commands/a>
