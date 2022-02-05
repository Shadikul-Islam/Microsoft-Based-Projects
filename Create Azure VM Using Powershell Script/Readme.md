## <p align=left>Create Azure VM from Your Local PC Powershell<br> <br> </p> 
| **SL** | **Topic** |
| --- | --- |
| 01 | [What is Azure Virtual Machine?](#01) |
| 02 | [Install the Azure Az PowerShell Module](#02) |
| 03 | [Connect to the Azure Account via Powershell](#03)  |
| 04 | [Azure VM Creation Powershell Script](#04) |

### <a name="01">:diamond_shape_with_a_dot_inside: &nbsp;What is Azure Virtual Machine?</a>
A virtual machine is an emulation of a computer system that provides the functionality of an actual computer. It is based on computer architectures, for instance, software, hardware or a combination of both. There are different types of virtual machines and each has different functions. Microsoft has an array of virtual machines that are designed to meet specific tasks. Let us have a look at some of these VMs.

These machines provide a substitute for an actual machine, with the functionality that is needed to execute an entire operating system.  It makes use of native execution to manage and share hardware. With this, it becomes possible to run multiple environments that are isolated from each other, although they are located on the same machine.

Azure Virtual machine will let us create and use virtual machines in the cloud as Infrastructure as a Service. We can use an image provided by Azure, or partner, or we can use our own to create the virtual machine.

### <a name="02">:diamond_shape_with_a_dot_inside: &nbsp;Install the Azure Az PowerShell Module</a>
The Azure Az PowerShell module is a rollup module. Installing it downloads the generally available Az PowerShell modules, and makes their cmdlets available for use.
Azure PowerShell has no additional requirements when run on PowerShell 7.0.6 LTS and PowerShell 7.1.3 or higher. To check your PowerShell version, run the following command from within a PowerShell session:
```PowerShell 
$PSVersionTable.PSVersion 
```
Install the latest version of PowerShell available for your operating system from [here](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell?view=powershell-7.2).

The Azure Az PowerShell module is also supported for use with PowerShell 5.1 on Windows. To use the Azure Az PowerShell module in PowerShell 5.1 on Windows:
- Update to Windows [PowerShell 5.1](https://docs.microsoft.com/en-us/powershell/scripting/windows-powershell/install/installing-windows-powershell?view=powershell-7.2#upgrading-existing-windows-powershell). If you're on Windows 10 version 1607 or higher, you already have PowerShell 5.1 installed.
- Install [.NET Framework 4.7.2 or later](https://docs.microsoft.com/en-us/dotnet/framework/install).
- Make sure you have the latest version of PowerShellGet. Run this command.
```PowerShell
Install-Module -Name PowerShellGet -Force
```
Now set the execution policy. PowerShell script execution policy must be set to remote signed or less restrictive. Get-ExecutionPolicy -List can be used to determine the current execution policy. Run this command:

```PowerShell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```
Using the Install-Module cmdlet is the preferred installation method for the Az PowerShell module. Install the Az module for the current user only. This is the recommended installation scope. This method works the same on Windows, macOS, and Linux platforms. Run the following command from a PowerShell session:
```PowerShell
Install-Module -Name Az -Scope CurrentUser -Repository PSGallery -Force
```

Now Update the Az module by running this command.
```PowerShell
Update-Module Az -Force
```

### <a name="03">:diamond_shape_with_a_dot_inside: &nbsp;Connect to the Azure Account via Powershell</a>
We installed the module and all dependencies. Now time to connect to the Azure portal from PowerShell.
Run this command to connect.
```PowerShell
Connect-AzAccount
```
Internet Explorer browser will be opened. Provide the credentials to the browser and login.
<br> <br> <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Projects/blob/master/Install%20Software%20in%20Azure%20VM%20Without%20Going%20Inside%20to%20VM%20Using%20Powershell/Images/Image-1.png" alt="Login Azure Account"> <br><br>
Now you will be successfully connected to the Azure Account.
<br> <br> <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Projects/blob/master/Install%20Software%20in%20Azure%20VM%20Without%20Going%20Inside%20to%20VM%20Using%20Powershell/Images/Image-2.png" alt="Login Azure Account"> <br><br>

### <a name="04">:diamond_shape_with_a_dot_inside: &nbsp;Azure VM Creation Powershell Script</a>

Open Powershell ISE or Powershell as administrator mode and run the following script:

```PowerShell
New-AzVm `
    -ResourceGroupName "MyNewResourceGroup" `
    -Name "MyNewVM1" `
    -Location "East US" `
    -Size "Standard_B4ms" `
    -VirtualNetworkName "MyVirtualNetwork" `
    -SubnetName "MySubnet1" `
    -SecurityGroupName "MySecurityGroup" `
    -PublicIpAddressName "MyWindowsVMPublicIP1" `
    -OpenPorts 80,3389
 ```

**You can find the script file [here](https://github.com/Shadikul-Islam/Microsoft-Based-Projects/blob/master/Create%20Azure%20VM%20Using%20Powershell%20Script/Script/Create%20Azure%20VM%20Using%20Powershell%20Script.ps1)**

After running this script, you will see a pop-up window that will ask for new VM credential. Provide the username and password which will be needed for further remote access to this VM.
<br> <br> <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Projects/blob/master/Create%20Azure%20VM%20Using%20Powershell%20Script/Images/Image-1.png" alt="VM Credential"> <br><br>
After providing the credential you can see that your VM is started to create. When it will be 100% done then your VM will be created successfully.
<br> <br> <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Projects/blob/master/Create%20Azure%20VM%20Using%20Powershell%20Script/Images/Image-2.png" alt="VM Creating"> <br><br>
<img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Projects/blob/master/Create%20Azure%20VM%20Using%20Powershell%20Script/Images/Images-3.png" alt="VM Creating"> <br><br>
Now go to [Azure Portal Virtual Machine Page](https://portal.azure.com/#blade/HubsExtension/BrowseResource/resourceType/Microsoft.Compute%2FVirtualMachines), you will see the VM named MyNewVM. Just click on it and on this page you will see all the details about this VM.
<br> <br> <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Projects/blob/master/Create%20Azure%20VM%20Using%20Powershell%20Script/Images/Image-4.png" alt="VM Azure Portal"> <br><br>

**In this way you can create a new Azure VM from your local PC Powershell.**


#### :diamond_shape_with_a_dot_inside: &nbsp;That’s it. We have learned How to Create Azure VM from Your Local PC Powershell. :diamond_shape_with_a_dot_inside: &nbsp;Happy Learning. :diamond_shape_with_a_dot_inside: &nbsp;
