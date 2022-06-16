### Author: Shadikul Islam ###

configuration MyVMConfiguration
{
    $uri48 = "https://go.microsoft.com/fwlink/?linkid=2088631";
    $folder = "c:\DotNet";
    $path = Join-Path $folder "ndp48-x86-x64-allos-enu.exe";

    ### This four module has to be presant in microsoft automation account ###
    
    Import-DscResource -ModuleName NetworkingDsc
    Import-DSCResource -Module xSystemSecurity -Name xIEEsc
    Import-DscResource -ModuleName GraniResource
    Import-DscResource -ModuleName xPendingReboot


    node "MyNode"
    {

        ### Installing IIS ###

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


        ### Local User Create ###

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


        ### Disable Windows Firewall ###

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


        ### Install URL Rewrite module for IIS ###
    
        Package UrlRewrite
        {
            DependsOn = @('[WindowsFeature]IIS','[WindowsFeature]IISConsole','[WindowsFeature]IISScriptingTools')
            Ensure = "Present"
            Name = "IIS URL Rewrite Module 2"
            Path = "http://download.microsoft.com/download/D/D/E/DDE57C26-C62C-4C59-A1BB-31D58B36ADA2/rewrite_amd64_en-US.msi"
            Arguments = '/L*V "C:\WindowsAzure\urlrewriter.txt" /quiet'
            ProductId = "38D32370-3A31-40E9-91D0-D236F47E3C4A"
        }


        ### Install Dotnet 4.8 :-: To check: reg query "HKLM\SOFTWARE\Microsoft\Net Framework Setup\NDP" /s ###
        
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


        ### Change Registry: fNoRemoteDesktopWallpaper ###

        Registry fNoRemoteDesktopWallpaper
        {
            Ensure      = "Present"  
            Key         = "HKLM:SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services"
            ValueName   = "fNoRemoteDesktopWallpaper"
            ValueData   = "1"
            ValueType   = "DWORD"
            Hex         = $true
        }


         ### Auto Reboot if needed ###

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



    }
}
