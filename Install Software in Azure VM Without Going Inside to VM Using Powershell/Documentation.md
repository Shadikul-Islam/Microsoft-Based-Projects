## <p align=left>Install Software in Azure VM Without Going Inside to VM Using Your Local PC Powershell <br> <br> </p>
| **SL** | **Topic** |
| --- | --- |
| 01 | [What is Azure Virtual Machine?](#01) |
| 02 | [What is Custom Script Extension in Azure?](#02) |
| 03 | [What is Shared Access Signature (SAS)?](#03) |
| 04 | [Install the Azure Az PowerShell Module](#04) |
| 05 | [Connect to the Azure Account via Powershell](#05)  |
| 06 | [Software Installation Scripts](#06) |

### <a name="01">:diamond_shape_with_a_dot_inside: &nbsp;What is Azure Virtual Machine?</a>
A virtual machine is an emulation of a computer system that provides the functionality of an actual computer. It is based on computer architectures, for instance, software, hardware or a combination of both. There are different types of virtual machines and each has different functions. Microsoft has an array of virtual machines that are designed to meet specific tasks. Let us have a look at some of these VMs.

These machines provide a substitute for an actual machine, with the functionality that is needed to execute an entire operating system.  It makes use of native execution to manage and share hardware. With this, it becomes possible to run multiple environments that are isolated from each other, although they are located on the same machine.

Azure Virtual machine will let us create and use virtual machines in the cloud as Infrastructure as a Service. We can use an image provided by Azure, or partner, or we can use our own to create the virtual machine.

### <a name="02">:diamond_shape_with_a_dot_inside: &nbsp;What is Custom Script Extension in Azure?</a>
The Custom Script Extension downloads and runs scripts on Azure virtual machines (VMs). This extension is useful for post-deployment configuration, software installation, or any other configuration or management task. You can download scripts from Azure Storage or GitHub, or provide them to the Azure portal at extension runtime.

The Custom Script Extension integrates with Azure Resource Manager templates. You can also run it by using the Azure CLI, PowerShell, the Azure portal, or the Azure Virtual Machines REST API.

### <a name="03">:diamond_shape_with_a_dot_inside: &nbsp;What is Shared Access Signature (SAS)?</a>
A shared access signature (SAS) is a URI that grants restricted access to an Azure Storage blob. Use it when you want to grant access to storage account resources for a specific time range without sharing your storage account key. You can read this [Microsoft documentation](https://docs.microsoft.com/en-us/rest/api/storageservices/create-account-sas?redirectedfrom=MSDN) to learn more.

### <a name="04">:diamond_shape_with_a_dot_inside: &nbsp;Install the Azure Az PowerShell Module</a>
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

### <a name="05">:diamond_shape_with_a_dot_inside: &nbsp;Connect to the Azure Account via Powershell</a>
We installed the module and all dependencies. Now time to connect to the Azure portal from PowerShell.
Run this command to connect.
```PowerShell
Connect-AzAccount
```
Internet Explorer browser will be opened. Provide the credentials to the browser and login.
<br> <br> <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Projects/blob/master/Install%20Software%20in%20Azure%20VM%20Without%20Going%20Inside%20to%20VM%20Using%20Powershell/Images/Image-1.png" alt="Login Azure Account"> <br><br>
Now you will be successfully connected to the Azure Account.
<br> <br> <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Projects/blob/master/Install%20Software%20in%20Azure%20VM%20Without%20Going%20Inside%20to%20VM%20Using%20Powershell/Images/Image-2.png" alt="Login Azure Account"> <br><br>

### <a name="06">:diamond_shape_with_a_dot_inside: &nbsp;Software Installation Scripts</a>
We will install this following software.
- Internet Information Services (IIS) Server
- Notepad++
- Microsoft Office365

You need two scripts to install those application. One script will connect to the Azure VM with the help of Azure Custom Script Extension and another script will download and install the software.

**First Script:**

```PowerShell
# IIS Install
Install-WindowsFeature -name Web-Server -IncludeManagementTools

# Notepad++ Install
mkdir C:\Software\Notepad++
cd C:\Software\Notepad++
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$downloadUrl=<"URL-of-the-Notepad++ .exe-File">
Invoke-RestMethod $downloadUrl -OutFile ".\npp.exe"
Start-Process -FilePath ".\npp.exe" -ArgumentList '/S' -Verb runas -Wait

# Office365 Install
cd C:\Software
mkdir Office365
cd C:\Software\Office365
$downloadUrl=<"URL-of-the-Office365-Setup.exe-File">
Invoke-RestMethod $downloadUrl -OutFile ".\configuration.xml"
$downloadUrl2=<"URL-of-the-Office365-configuration.xml-File">
.\setup.exe /configure .\configuration.xml
 ```
 
Here ```$downloadUrl=<"URL-of-the-First-Script">``` means, At first, You need to download the Notepad++, Office Setup, and Configuration file from their official site. Then keep those files in any cloud storage. I kept those files in **Azure Blob Storage**. Then I generated a [shared access signature (SAS)](#03) and put that URL here.
 
**Second Script:**

```PowerShell
Set-AzVMCustomScriptExtension -ResourceGroupName Custom_Script_Extension_Resource_Group `
    -VMName <"Azure-VM-Name"> `
    -Location <"Location-Example: East US"> `
    -FileUri <"URL-of-the-First-Script"> `
    -Run 'First-Script-Name.ps1' `
    -Name "CustomScriptExtension"
 ```

 Here ```$downloadUrl=<"URL-of-the-First-Script">``` means, You need to upload your first script any cloud storage. I kept the **[Script-1.ps1](https://github.com/Shadikul-Islam/Microsoft-Based-Projects/tree/master/Install%20Software%20in%20Azure%20VM%20Without%20Going%20Inside%20to%20VM%20Using%20Powershell/Script)** file in **Azure Blob Storage**. Then I generated a [shared access signature (SAS)](#03) and put that URL here.
 
**You can find the script file [here](https://github.com/Shadikul-Islam/Microsoft-Based-Projects/tree/master/Install%20Software%20in%20Azure%20VM%20Without%20Going%20Inside%20to%20VM%20Using%20Powershell/Script)**.

Now run the script from your local PC Powershell or Powershell ISE. After completing the running then Copy the IP of that VM and visit the browser. You will see an IIS default site. Now open Remote Desktop Connection and RDP that VM and you can see the notepad++ and Office 365 application Word, Excel, Powerpoint and other applications.
 
 
 
#### :diamond_shape_with_a_dot_inside: &nbsp;That’s it. We have learnt How to Install Software in Azure VM Without Going Inside to VM Using Your Local PC Powershell. :diamond_shape_with_a_dot_inside: &nbsp;
 
#### :diamond_shape_with_a_dot_inside: &nbsp;Happy Learning. :diamond_shape_with_a_dot_inside: &nbsp;
 
