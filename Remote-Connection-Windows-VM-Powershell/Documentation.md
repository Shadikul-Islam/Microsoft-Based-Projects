### Here I will describe how to establish remote connection to windows VM using Powershell script.

**Follow the following steps:**

1. Add the port **5985** into the Inbound Port Rules of Azure/AWS/where your VM created.
2. You need to RDP that VM for the first time to do this following things:
   - Enable Powershell Remote access:
   ```PowerShell
     Enable-PSRemoting -force
   ```
   - Now WinRM service should be running but you may need to configure the LocalAccountTokenFilterPolicy to grant administrative rights remotely to local users. Run this command and press y:
   ```PowerShell
     WinRM quickconfig
   ```
    <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Work/blob/master/Azure-DevOps-and-Powershell-Scripting/Remote-Connection-Windows-VM-Powershell/Screenshots/WinRM-1.png" alt="WinRM Before Configuration"> </br> </br>
    <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Work/blob/master/Azure-DevOps-and-Powershell-Scripting/Remote-Connection-Windows-VM-Powershell/Screenshots/WinRM-2.png" alt="WinRM After Configuration"> </br>
   - Go to PC Control Panel --> Windows Defender Firewall --> Advanced Settings --> Inbound Rules --> Double-click Windows Remote Management (HTTP-In) for the Public profile --> Click the Scope tab --> Under Remote IP address, add any IPs you need or Select Any IP Adress option --> Apply. </br> </br>
    <img src="https://github.com/Shadikul-Islam/Microsoft-Based-Work/blob/master/Azure-DevOps-and-Powershell-Scripting/Remote-Connection-Windows-VM-Powershell/Screenshots/Windows%20Defender%20Firewall.png" alt="Windows Defender Firewall">

3. Now [Click here](https://github.com/Shadikul-Islam/Microsoft-Based-Work/blob/master/Azure-DevOps-and-Powershell-Scripting/Remote-Connection-Windows-VM-Powershell/Scripts/remote-connection-windows-vm-powershell.ps1) to show the script. Copy the script and Provide the **VM-Username**, **VM-Passoword**, **IP-Address**. Run it in **Powershell ISE/Powershell**.
