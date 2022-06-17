## <p align=center>Azure Windows VM Environment Configuration/Setup Using ARM, DSC & Powershell Script <br> <br> </p> 
| **SL** | **Topic** |
| --- | --- |
| 01 | [What is Azure Resource Manager (ARM) Template?](#01) |
| 02 | [What is Desired State Configuration (DSC)?](#02) |
| 03 | [What is Azure Automation Account?](#03) |
| 04 | [How to Connect Azure Subscription from Powershell?](#04) | 
| 05 | [Prepare a DSC Script for Windows VM Environment Configuration <br>- Install IIS <br>- Local User Create and Add into Local Admin Group <br>- Disable Windows Firewall <br>- Install URL Rewrite Module <br>- Install Dotnet <br>- Registry Change: Remove Desktop Wallpaper <br>- Auto Reboot the VM if needed](#05) |
| 06 | [Automation Account Setup for DSC](#06) |
| 07 | [Prepare ARM Template for VM Provisioning](#07) |
| 08 | [Add DSC Extension in ARM Template](#08) |
| 09 | [Prepare a Powershell Script to run ARM Template and DSC](#09) |
| 10 | [All Script in together](#10) |
| 11 | [Run all of the Script and Check the VM Enviroment](#11) |

### <a name="01">:diamond_shape_with_a_dot_inside: &nbsp;What is Azure Resource Manager (ARM) Template?</a>
Azure Resource Manager (ARM) is an Azure service that you can use as a code paradigm to control and deploy assets using an infrastructure. It allows you to use a number of features to provide, change, and uninstall services, including access controls, tags, and locks. Azure Resource Manager (ARM) is an Azure service that you can use as a code paradigm to control and deploy assets using an infrastructure. It allows you to use a number of features to provide, change, and uninstall services, including access controls, tags, and locks.
<br><br> <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Projects/blob/master/Azure%20Windows%20VM%20Environment%20Configuration%20Using%20ARM%20DSC%20%26%20Powershell%20Script/Images/Image-1.png" alt="Azure Resource Manager"> <br>

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

### <a name="05">:diamond_shape_with_a_dot_inside: &nbsp;Prepare a DSC Script for Windows VM Environment Configuration</a>
We will prepare DSC Script for our Windows VM Configuration and Setup. Today we will configure/setup these following things:
 1. Install IIS
 2. Local User Create and Add into Admin Group
 3. Disable Windows Firewall 
 4. Install URL Rewrite module for IIS
 5. Install Dotnet 4.8
 6. Registry Change: Remove Desktop Wallpaper 

Let's start from IIS installation.

 1. **Install IIS:**
 ````POWERSHELL
        WindowsFeature IIS
        {
            Ensure = 'Present'
            Name = 'Web-Server'
        }
        WindowsFeature IISConsole
        {
            Ensure = 'Present'
            Name = 'Web-Mgmt-Console'
            DependsOn = '[WindowsFeature]IIS'
        }
        WindowsFeature IISScriptingTools
        {
            Ensure = 'Present'
            Name = 'Web-Scripting-Tools'
            DependsOn = '[WindowsFeature]IIS'
        }
 ````
 2. **Local User Create and Add into Admin Group:**
 ````powershell
        [string]$userName = 'MyLocalUser'
        [string]$userPassword = 'Yjdhmctp13l7'
        [securestring]$secStringPassword = ConvertTo-SecureString $userPassword -AsPlainText -Force
        [pscredential]$credObject = New-Object System.Management.Automation.PSCredential ($userName, $secStringPassword)

        User LocalUser
        {
            Ensure = "Present"  
            UserName = $userName
            Password = $credObject
            PasswordNeverExpires = $True
            PasswordChangeRequired = $False
            Fullname = "Local User Account"
        }

        ### Add the User Into Admin Group ###

        Group UserAddIntoAdminGroup
        {
            GroupName='Administrators'
            DependsOn= '[User]LocalUser'
            Ensure= 'Present'
            MembersToInclude = $userName
        }
 ````
 3. **Disable Windows Firewall:**
 ````POWERSHELL
        FirewallProfile DisableDomain
        {
            Name                  = 'Domain'
            Enabled               = 'False'
        }

        FirewallProfile DisablePrivate
        {
            Name                  = 'Private'
            Enabled               = 'False'
        }

        FirewallProfile DisablePublic
        {
            Name                  = 'Public'
            Enabled               = 'False'
        }
 ````
 4. **Install URL Rewrite module for IIS:**
 ````POWERSHELL
        Package UrlRewrite
        {
            DependsOn = @('[WindowsFeature]IIS','[WindowsFeature]IISConsole','[WindowsFeature]IISScriptingTools')
            Ensure = "Present"
            Name = "IIS URL Rewrite Module 2"
            Path = "http://download.microsoft.com/download/D/D/E/DDE57C26-C62C-4C59-A1BB-31D58B36ADA2/rewrite_amd64_en-US.msi"
            Arguments = '/L*V "C:\WindowsAzure\urlrewriter.txt" /quiet'
            ProductId = "38D32370-3A31-40E9-91D0-D236F47E3C4A"
        }
 ````
 5. **Install Dotnet 4.8:**
 ````powershell
        cDownload DotNet
        {
            Uri = $uri48
            DestinationPath = $path
        }
    
        cDotNetFramework DotNet48
        {
            KB = "KB4486153"
            InstallerPath = $path
            Ensure = "Present"
            NoRestart = $true
            LogPath = "C:\DotNet\Present.log"
            DependsOn = "[cDownload]DotNet"
        }
 ````
 6. **Registry Change: Remove Desktop Wallpaper:**
 ````powershell
        Registry fNoRemoteDesktopWallpaper
        {
            Ensure      = "Present"  
            Key         = "HKLM:SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services"
            ValueName   = "fNoRemoteDesktopWallpaper"
            ValueData   = "1"
            ValueType   = "DWORD"
            Hex         = $true
        }
 ````
 7. **Auto Reboot the VM if needed:**
 ````powershell
         Script Reboot
         {
             TestScript = {
                 return (Test-Path HKLM:\SOFTWARE\MyMainKey\RebootKey)
             }
             SetScript = {
                 New-Item -Path HKLM:\SOFTWARE\MyMainKey\RebootKey -Force
                  $global:DSCMachineStatus = 1 
             }
             GetScript = { return @{result = 'Reboot'}}
             DependsOn = '[cDotNetFramework]DotNet48'
         } 
         
         xPendingReboot RebootCheck
         {
             Name = "RebootCheck"
         }
 ````

We need to add the configuration name and node with proper DSC format then need to add these above codes. So our final DSC script will be:

**Final DSC Script:**

[Click Here](https://github.com/Shadikul-Islam/Microsoft-Based-Projects/blob/master/Azure%20Windows%20VM%20Environment%20Configuration%20Using%20ARM%20DSC%20%26%20Powershell%20Script/Scripts/DSC%20Script.ps1) and open it in a new tab to check the Final DSC Script.

You can notice that our configuration name is **MyVMConfiguration** and Node name is **MyNode** in the DSC Script.

### <a name="06">:diamond_shape_with_a_dot_inside: &nbsp;Automation Account Setup for DSC</a>
To setup Automation Account we need to follow the following steps:

 - Go to [Azure Portal](https://portal.azure.com/#home) --> Search Automation Account and Click to the Automation Account. Click Create then a new page will appear. Provide necessary information and click **Review and Create** then click **Create**.
 <br><br> <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Projects/blob/master/Azure%20Windows%20VM%20Environment%20Configuration%20Using%20ARM%20DSC%20%26%20Powershell%20Script/Images/Image-2.png" alt="Automation Account"> <br>
 <br> <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Projects/blob/master/Azure%20Windows%20VM%20Environment%20Configuration%20Using%20ARM%20DSC%20%26%20Powershell%20Script/Images/Image-3.png" alt="Automation Account"> <br>
 <br> <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Projects/blob/master/Azure%20Windows%20VM%20Environment%20Configuration%20Using%20ARM%20DSC%20%26%20Powershell%20Script/Images/Image-4.png" alt="Automation Account"> <br>
 - Our Automation Account Name is **dsc-automation**. Click on the Automation Account name and go inside the Automation Account.
 - First, We need to install the necessary modules that will be needed for the compilation of the script. Scroll down the left side of the page and click **Modules**. We need the following Modules:
   1. NetworkingDsc
   2. xSystemSecurity
   3. GraniResource
   4. xPendingReboot
   
 Click **Browse Gallery** and Search the Modules page. 
 <br><br> <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Projects/blob/master/Azure%20Windows%20VM%20Environment%20Configuration%20Using%20ARM%20DSC%20%26%20Powershell%20Script/Images/Image-11.png" alt="Automation Account"> <br><br>
 Search **NetworkingDsc** from the search box then click the module name and click **Select** --> Select the Runtime Version from dropdown --> click Import. It will take some moment to Import. In this way, we need to install/import all of the above modules.
 <br><br> <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Projects/blob/master/Azure%20Windows%20VM%20Environment%20Configuration%20Using%20ARM%20DSC%20%26%20Powershell%20Script/Images/Image-12.png" alt="Automation Account"> <br>
 - Now again scroll up from the left side of the Automation Account Page and click on the **State Configuration (DSC)** You will see the DSC Configuration for this Automation Account. We can notice that we didn't add any **Node** yet so no node appears there. As like we will also see nothing in the **Configurations**, **Compiled Configurations** tab.
 <br><br> <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Projects/blob/master/Azure%20Windows%20VM%20Environment%20Configuration%20Using%20ARM%20DSC%20%26%20Powershell%20Script/Images/Image-5.png" alt="Automation Account"> <br><br>
 - Go to the **Configurations** tab. Click **Add**. A new page will appear. Select the **DSC Script** that we already prepared and Provide the Name of the Configuration. In our case Name is **MyVMConfiguration**. Click **Ok**.
 <br><br> <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Projects/blob/master/Azure%20Windows%20VM%20Environment%20Configuration%20Using%20ARM%20DSC%20%26%20Powershell%20Script/Images/Image-6.png" alt="Automation Account"> <br>
 <br> <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Projects/blob/master/Azure%20Windows%20VM%20Environment%20Configuration%20Using%20ARM%20DSC%20%26%20Powershell%20Script/Images/Image-7.png" alt="Automation Account"> <br><br>
 Now refresh the page by clicking the **Refresh** button. It takes some moment to appear.
 <br><br> <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Projects/blob/master/Azure%20Windows%20VM%20Environment%20Configuration%20Using%20ARM%20DSC%20%26%20Powershell%20Script/Images/Image-8.png" alt="Automation Account"> <br>
 - Click on the Configuration Name **MyVMConfiguration** and go inside that page. We have to **Compile** the script so just click the **Compile** button.
  <br><br> <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Projects/blob/master/Azure%20Windows%20VM%20Environment%20Configuration%20Using%20ARM%20DSC%20%26%20Powershell%20Script/Images/Image-9.png" alt="Automation Account"> <br><br>
 It will take one or two minutes depending on the script. Once it's done then it will show the **Status** is **Completed**.
 <br><br> <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Projects/blob/master/Azure%20Windows%20VM%20Environment%20Configuration%20Using%20ARM%20DSC%20%26%20Powershell%20Script/Images/Image-10.png" alt="Automation Account"> <br><br>
 Our Automation Account Setup has been completed. Now we have to save three more values from Automation Account which will be needed ARM Template to connect ARM Template and Automation Account each other. Let's Copy and save that for further use.
 - In the Automation account page, Scroll down from left side and click on **Keys**. Then Copy the **Primary access key** and **URL** values and save it for furhter use.
 <br><br> <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Projects/blob/master/Azure%20Windows%20VM%20Environment%20Configuration%20Using%20ARM%20DSC%20%26%20Powershell%20Script/Images/Image-13.png" alt="Automation Account"> <br><br>
 - We need one more value which need to save. In the Automation account page, Scroll down from left side and click on **State Configuration DSC** --> Click **Compiled Configuration** --> Here you will see **Node Configuration**. In our case it is **MyVMConfiguration.MyNode**. We also need to copy and save this name **MyVMConfiguration.MyNode** for further use.
 <br><br> <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Projects/blob/master/Azure%20Windows%20VM%20Environment%20Configuration%20Using%20ARM%20DSC%20%26%20Powershell%20Script/Images/Image-14.png" alt="Automation Account"> <br><br>

### <a name="07">:diamond_shape_with_a_dot_inside: &nbsp;Prepare ARM Template for VM Provisioning</a>
Let's remind our today's agenda again. Our today's agenda is to provision a Windows VM using ARM Template and also Configure that VM using DSC. So we need to prepare an ARM Template that can provision a Windows VM. We will provision Windows Server 2019. Let's take help from [Microsoft Docs](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/ps-template). They already provided a sample template for this task. Just we have to modify as we need.

**Modified ARM Template for our VM Provisioning:** 

[Click Here](https://github.com/Shadikul-Islam/Microsoft-Based-Projects/blob/master/Azure%20Windows%20VM%20Environment%20Configuration%20Using%20ARM%20DSC%20%26%20Powershell%20Script/Scripts/Modified%20ARM%20Template.json) and open it in a new tab to check the Modified ARM Template File.

### <a name="08">:diamond_shape_with_a_dot_inside: &nbsp;Add DSC Extension in ARM Template</a>
We need to add DSC Extension in ARM Template. So let's again take help from Microsoft for the DSC Extension Code. This is the Sample DSC Extension Code from [Microsoft Docs](https://docs.microsoft.com/en-us/azure/virtual-machines/extensions/dsc-template). We have to just modify the code as we need. We need **registrationKeyPrivate**, **RegistrationUrl** and **NodeConfigurationName** Values. These values we will take from **Automation Account** that already described in Automation Account Step.

**registrationKeyPrivate** = Automation Account **Primary access key**

**RegistrationUrl** Value = Automation Account **URL**

**NodeConfigurationName** Value = **Node Configuration** Value, Which is **MyVMConfiguration.MyNode** in our case.

**Modified DSC Extension Code for ARM Template:**

````JSON
{
  "type": "Microsoft.Compute/virtualMachines/extensions",
  "name": "[concat(parameters('VMName'), '/Microsoft.Powershell.DSC')]",
  "apiVersion": "2018-06-01",
  "location": "[parameters('location')]",
  "dependsOn": [
    "[concat('Microsoft.Compute/virtualMachines/', parameters('VMName'))]"
  ],
  "properties": {
    "publisher": "Microsoft.Powershell",
    "type": "DSC",
    "typeHandlerVersion": "2.77",
    "autoUpgradeMinorVersion": true,
    "protectedSettings": {
      "Items": {
        "registrationKeyPrivate": "We will take this value from Automation Account"
      }
    },
    "settings": {
      "Properties": [
        {
          "Name": "RegistrationKey",
          "Value": {
            "UserName": "PLACEHOLDER_DONOTUSE",
            "Password": "PrivateSettingsRef:registrationKeyPrivate"
          },
          "TypeName": "System.Management.Automation.PSCredential"
        },
        {
          "Name": "RegistrationUrl",
          
          "Value": "We will take this value from Automation Account"
          "TypeName": "System.String"
        },
        {
          "Name": "NodeConfigurationName",
          "Value": "We will take this value from Automation Account",
          "TypeName": "System.String"
        },
        {
        "Name": "ConfigurationMode",
        "Value": "ApplyAndAutocorrect",
        "TypeName": "System.String"
        },
        {
        "Name": "ConfigurationModeFrequencyMins",
        "Value": "15",
        "TypeName": "System.Int32"
        },
        {
        "Name": "RefreshFrequencyMins",
        "Value": "30",
        "TypeName": "System.Int32"
        },
        {
        "Name": "RebootNodeIfNeeded",
        "Value": true,
        "TypeName": "System.Boolean"
        },
        {
        "Name": "ActionAfterReboot",
        "Value": "ContinueConfiguration",
        "TypeName": "System.String"
        },
        {
        "Name": "AllowModuleOverwrite",
        "Value": false,
        "TypeName": "System.Boolean"
        }       
      ]
    }
  }
}
````
We need to add this code in ARM Template. So our final and complete ARM Template will be:

**Final ARM Template:**

[Click Here](https://github.com/Shadikul-Islam/Microsoft-Based-Projects/blob/master/Azure%20Windows%20VM%20Environment%20Configuration%20Using%20ARM%20DSC%20%26%20Powershell%20Script/Scripts/Final%20ARM%20Template.json) and open it in a new tab to check the final and complete ARM Template File.









## This documentation is under construction.
