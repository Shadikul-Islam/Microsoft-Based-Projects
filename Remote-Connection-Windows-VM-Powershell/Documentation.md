## Establish Remote Connection to Windows VM Using Powershell Script.

**Follow the following steps:**

1. Add the port **5985** into the Inbound Port Rules of Azure/AWS/where your VM created.
2. You need to do RDP (Remote Desktop Connection) on that VM for the first time. After going inside of that VM then open Powershell as Administrator Mode then do as follows. You will never have to do this again.
   - Enable Powershell Remote access.
   ```PowerShell
     Enable-PSRemoting -force
   ```
   - Now WinRM service should be running but you may need to configure the LocalAccountTokenFilterPolicy to grant administrative rights remotely to local users. Run this command and press y.
   ```PowerShell
     WinRM quickconfig
   ```
    <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Work/blob/master/Remote-Connection-Windows-VM-Powershell/Images/WinRM-1.png" alt="WinRM Before Configuration"> </br> </br>
    <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Work/blob/master/Remote-Connection-Windows-VM-Powershell/Images/WinRM-2.png" alt="WinRM After Configuration"> </br>
   - Go to PC Control Panel --> Windows Defender Firewall --> Advanced Settings --> Inbound Rules --> Double-click Windows Remote Management (HTTP-In) for the Public profile --> Click the Scope tab --> Under Remote IP address, add any IPs you need or Select Any IP Adress option --> Click Apply. </br> </br>
    <img src="https://github.com/Shadikul-Islam/Microsoft-Based-Work/blob/master/Remote-Connection-Windows-VM-Powershell/Images/Windows%20Defender%20Firewall.png" alt="Windows Defender Firewall">

3. Now [click here](https://github.com/Shadikul-Islam/Microsoft-Based-Work/blob/master/Remote-Connection-Windows-VM-Powershell/Script/Remote-Connection-Windows-VM.ps1) to show the script. Copy the script and Provide the **VM-Username**, **VM-Passoword**, **IP-Address**. Run it in **Powershell ISE/Powershell**.

4. You are now connected to that VM in powershell. You can now do anything on that VM from your local PC Powershell. You will be seen like this.

    <img src="https://github.com/Shadikul-Islam/Microsoft-Based-Work/blob/master/Remote-Connection-Windows-VM-Powershell/Images/After-Remote-Connection.png" alt="After Remote Connection">
    
In this way, you can establish a remote connection to any windows VM using PowerShell scripting.


#### :diamond_shape_with_a_dot_inside: &nbsp;That’s it. We have learnt how to establish remote connection to windows VM using Powershell script. Happy Learning. :diamond_shape_with_a_dot_inside: &nbsp;
