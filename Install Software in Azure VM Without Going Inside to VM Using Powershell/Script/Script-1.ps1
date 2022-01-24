# IIS Install
Install-WindowsFeature -name Web-Server -IncludeManagementTools

# Notepad++ Install
mkdir C:\Software\Notepad++
cd C:\Software\Notepad++
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$downloadUrl=<"URL-of-the-First-Script">
Invoke-RestMethod $downloadUrl -OutFile ".\npp.exe"
Start-Process -FilePath ".\npp.exe" -ArgumentList '/S' -Verb runas -Wait

# Office365 Install
cd C:\Software
mkdir Office365
cd C:\Software\Office365
$downloadUrl=<"URL-of-the-First-Script">
Invoke-RestMethod $downloadUrl -OutFile ".\configuration.xml"
$downloadUrl2=<"URL-of-the-First-Script">
.\setup.exe /configure .\configuration.xml