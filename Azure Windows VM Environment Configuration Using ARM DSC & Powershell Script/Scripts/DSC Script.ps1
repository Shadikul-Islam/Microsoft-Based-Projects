configuration VMConfiguration
{
    $uri48 = "https://go.microsoft.com/fwlink/?linkid=2088631";
    $folder = "c:\DotNet";
    $path = Join-Path $folder "ndp48-x86-x64-allos-enu.exe";
    Import-DscResource -ModuleName NetworkingDsc
    Import-DSCResource -Module xSystemSecurity -Name xIEEsc
    Import-DscResource -ModuleName GraniResource

    node "SadikVM"
    {
        [string]$userName1 = 'NewUser'
        [string]$userPassword1 = 'Yjdhmctp13l7'
        [securestring]$secStringPassword1 = ConvertTo-SecureString $userPassword1 -AsPlainText -Force
        [pscredential]$credObject1 = New-Object System.Management.Automation.PSCredential ($userName1, $secStringPassword1)

        ### Local User Create ###

        User LocalServiceUser
        {
            Ensure = "Present"  
            UserName = $userName1
            Password = $credObject1
            PasswordNeverExpires = $True
            PasswordChangeRequired = $False
            Fullname = "Elite Service Account"
        }

        ### Add User into Local Admin Group ###

        Group UserAddIntoAdminGroup
        {
            GroupName='Administrators'
            DependsOn= '[User]LocalAdminUser'
            Ensure= 'Present'
            MembersToInclude = $userName1
        }

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

        ### Disabling IE Enhanced Security Configuration (ESC) ###

	    xIEEsc DisableIEEscAdmin
        {
            IsEnabled = $False
            UserRole  = "Administrators"
        }
        xIEEsc DisableIEEscUser
        {
            IsEnabled = $False
            UserRole  = "Users"
        }


        ### Disable Firewall ###

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

        ### Install Dotnet 4.8 - Run this on Powershell to check Dotnet Version: reg query "HKLM\SOFTWARE\Microsoft\Net Framework Setup\NDP\v4" /s  ### 
        
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
            LogPath = "C:\Test\Present.log"
            DependsOn = "[cDownload]DotNet"
        } 

        ### Change Registry: MaxInstanceCount ###

        Registry MaxInstanceCount
        {
            Ensure      = "Present"  
            Key         = "HKLM:SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services"
            ValueName   = "MaxInstanceCount"
            ValueData   = "f423f"
            ValueType   = "DWORD"
            Hex         = $true
        }

        ### Change Registry: fSingleSessionPerUser ###

        Registry fSingleSessionPerUser
        {
            Ensure      = "Present"  
            Key         = "HKLM:SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services"
            ValueName   = "fSingleSessionPerUser"
            ValueData   = "1"
            ValueType   = "DWORD"
            Hex         = $true
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

        ### Change Registry: SaveZoneInformation ###

        Registry SaveZoneInformation
        {
            Ensure      = "Present"  
            Key         = "HKCU:Software\Microsoft\Windows\CurrentVersion\Policies\Attachments"
            ValueName   = "SaveZoneInformation"
            ValueData   = "1"
            ValueType   = "DWORD"
            Hex         = $true
            PsDscRunAsCredential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $userName1, $secStringPassword1
        }

        ### Change Registry: TrustedZone for Elite Service Account ###

        Registry TrustedZoneSVC
        {
            Ensure      = "Present"  # You can also set Ensure to "Absent"
            Key         = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\elitedownloadcenter.elite.com"
            ValueName   = "https"
            ValueData   = "2"
            ValueType   = "DWORD"
            Hex         = $true
            PsDscRunAsCredential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $userName1, $secStringPassword1
        }


        ### Change Registry: IE Blank Start Page for Elite Service Account ###

        Registry BlankStartPageSVC
        {
            Ensure      = "Present" 
            Key         = "HKCU:\Software\Microsoft\Internet Explorer\Main"
            ValueName   = "Start Page"
            ValueData   = "about:blank"
            ValueType   = "String"
            PsDscRunAsCredential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $userName1, $secStringPassword1
        }

        ### Disable UAC ###

        Registry DisableUAC
         {
             Ensure      = "Present"
             Key         = "HKLM:\Software\Microsoft\Windows\CurrentVersion\policies\system"
             ValueName   = "EnableLUA"
             ValueData   = "0"
             ValueType   = "DWORD"
         }


    }
}
