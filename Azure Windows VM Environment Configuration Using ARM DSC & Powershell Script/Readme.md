## <p align=center>Azure Windows VM Environment Configuration/Setup Using ARM, DSC & Powershell Script <br> <br> </p> 
| **SL** | **Topic** |
| --- | --- |
| 01 | [What is Azure Resource Manager (ARM) Template?](#01) |
| 02 | [What is Desired State Configuration (DSC)?](#02) |
| 03 | [What is Azure Automation Account?](#03) |
| 04 | [How to Connect Azure Subscription from Powershell?](#04) | 
| 05 | [Prepare ARM Template](#05) |
| 06 | [Automation Account Setup for DSC](#06) |
| 07 | [DSC Extension in ARM Template](#07) |
| 08 | [Prepare a DSC Script for Windows VM Environment Configuration <br>- Install IIS <br>- Local User Create and Add into Local Admin Group <br>- Disable Windows Firewall <br>- Install URL Rewrite Module <br>- Install Dotnet <br>- Registry Change: Remove Desktop Wallpaper](#08) |
| 09 | [Prepare a Powershell Script to run ARM Template and DSC](#09) |
| 10 | [All Script in together](#10) |
| 11 | [Run all of the Script and Check the VM Enviroment](#11) |

### <a name="01">:diamond_shape_with_a_dot_inside: &nbsp;What is Azure Resource Manager (ARM) Template?</a>
Azure Resource Manager (ARM) is an Azure service that you can use as a code paradigm to control and deploy assets using an infrastructure. It allows you to use a number of features to provide, change, and uninstall services, including access controls, tags, and locks. Azure Resource Manager (ARM) is an Azure service that you can use as a code paradigm to control and deploy assets using an infrastructure. It allows you to use a number of features to provide, change, and uninstall services, including access controls, tags, and locks.
<br> <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Projects/blob/master/Azure%20Windows%20VM%20Environment%20Configuration%20Using%20ARM%20DSC%20%26%20Powershell%20Script/Images/Image-1.png" alt="Azure Resource Manager"> <br>

**What is an Azure Resource Manager Template?**

Each Azure resource (virtual machine, storage account, etc.) can be deployed by filling in parameters in an Azure ARM template, such as the name, location, availability zone, networks, security and more. These Azure ARM templates can be saved, then deployed and tested within an Azure resource group. This allows the distributed application to be deployed repeatedly and consistently. The Azure Resource Manager template is a JSON file which defines the resource group, its resources, their properties and any dependencies. This allows an identical copy of the application to easily be created so it can be deployed in testing, staging, production or in an additional geography to allow the service to scale out.

### <a name="02">:diamond_shape_with_a_dot_inside: &nbsp;What is Desired State Configuration (DSC)?</a>
Desired State Configuration (DSC) is an essential part of the configuration, management and maintenance of Windows-based servers. It allows a PowerShell script to specify the configuration of the machine using a declarative model in a simple standard way that is easy to maintain and understand. DSC gives us a declarative model for system configuration management. What that really means is that we can specify how we want a workstation or server (a ‘node’) to be configured and we leave it to PowerShell and the Windows Workflow engine to make it happen on those target ‘nodes’. We don’t have to specify how we want it to happen.

The main advantages of DSC are:
 - To simplify your sysadmin taks by configuring one or more devices automatically
 - To be able to configure machines identically with the aim to standardise them
 - To ensure, at a given time, that the configuration of a machine always be identical to its initial configuration, so as to avoid drift
 - Deployment on demand as a Cloud strategy, or ‘en masse’, is largely automated and simplified

### <a name="03">:diamond_shape_with_a_dot_inside: &nbsp;What is Azure Automation Account?</a>
Azure Automation is all about automating manual and repetitive tasks in the cloud environment. This means that you don’t need a Virtual Machine or a physical machine. It allows you to automate tasks on a cloud environment that is hosted by Microsoft Azure. Azure Automation is also referred to as Azure Runbook frequently. Runbook enables organizations to save time and increase the reliability of regular executive tasks.

**Type of Automation Account:**
 - Automation Account
 - Configuration Management
 - Update Management
 - Shared capabilities
 - Heterogeneous Support

### <a name="04">:diamond_shape_with_a_dot_inside: &nbsp;How to Connect Azure Subscription from Powershell?</a>
To connect to Azure Subscription we have to follow these two steps:

 1. **Install the Azure Az PowerShell Module**

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

 2. **Connect to the Azure Account via Powershell**

We installed the module and all dependencies. Now time to connect to the Azure portal from PowerShell.
Run this command to connect.
```PowerShell
Connect-AzAccount
```
Internet Explorer browser will be opened. Provide the credentials to the browser and login.
<br> <br> <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Projects/blob/master/Install%20Software%20in%20Azure%20VM%20Without%20Going%20Inside%20to%20VM%20Using%20Powershell/Images/Image-1.png" alt="Login Azure Account"> <br><br>
Now you will be successfully connected to the Azure Account.
<br> <br> <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Projects/blob/master/Install%20Software%20in%20Azure%20VM%20Without%20Going%20Inside%20to%20VM%20Using%20Powershell/Images/Image-2.png" alt="Login Azure Account"> <br><br>

### <a name="05">:diamond_shape_with_a_dot_inside: &nbsp;Prepare ARM Template</a>
Let's remind our today's agenda again. Our today's agenda is to provision a Windows VM using ARM Template and also Configure that VM using DSC. So we need to prepare an ARM Template that can provision a Windows VM. We will provision Windows Server 2019. Let's take help from [Microsoft Docs](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/ps-template). They already provided a sample template for this task. Just we have to modify as we need.

**Modified ARM Template for our VM Provisioning:** [Click Here](https://github.com/Shadikul-Islam/Microsoft-Based-Projects/blob/master/Azure%20Windows%20VM%20Environment%20Configuration%20Using%20ARM%20DSC%20%26%20Powershell%20Script/Scripts/Modified%20ARM%20Template.json) to check the Modified ARM Template File.

<a href="https://www.WordPress.com](https://github.com/Shadikul-Islam/Microsoft-Based-Projects/blob/master/Azure%20Windows%20VM%20Environment%20Configuration%20Using%20ARM%20DSC%20%26%20Powershell%20Script/Scripts/Modified%20ARM%20Template.json" target="_blank">Click Here</a>








## This documentation is under construction.
