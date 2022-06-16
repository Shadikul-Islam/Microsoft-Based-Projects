## <p align=center>Azure Windows VM Environment Configuration/Setup Using ARM, DSC & Powershell Script <br> <br> </p> 
| **SL** | **Topic** |
| --- | --- |
| 01 | [What is Azure Resource Manager (ARM) Template?](#01) |
| 02 | [What is Desired State Configuration (DSC)?](#02) |
| 03 | [What is Azure Automation Account?](#03) |
| 04 | [How to Connect Azure Subscription from Powershell?](#04) | 
| 05 | [Azure VM Provisioning Using ARM Template](#05) |
| 06 | [Automation Account Setup for DSC](#06) |
| 07 | [DSC Extension in ARM Template](#07) |
| 08 | [Prepare a DSC Script for Windows VM Environment Configuration <br>- Install IIS <br>- Local User Create and Add into Local Admin Group <br>- Disable Windows Firewall <br>- Install URL Rewrite Module <br>- Install Dotnet <br>- Registry Change: Remove Desktop Wallpaper](#08) |
| 09 | [Prepare a Powershell Script to run ARM Template and DSC](#09) |
| 10 | [All Script in together](#10) |
| 11 | [Run all of the Script and Check the VM Enviroment](#11) |

### <a name="01">:diamond_shape_with_a_dot_inside: &nbsp;What is Azure Resource Manager (ARM) Template?</a>
Azure Resource Manager (ARM) is an Azure service that you can use as a code paradigm to control and deploy assets using an infrastructure. It allows you to use a number of features to provide, change, and uninstall services, including access controls, tags, and locks. Azure Resource Manager (ARM) is an Azure service that you can use as a code paradigm to control and deploy assets using an infrastructure. It allows you to use a number of features to provide, change, and uninstall services, including access controls, tags, and locks.
<br> <img src= "Image01" alt="Azure Resource Manager"> <br>

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




## This documentation is under construction.
