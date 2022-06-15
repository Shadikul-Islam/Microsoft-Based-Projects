
$resourceGroupName = "MyWindowsRG"
$location = "centralus"
$adminUsername = "RootAdmin"
$adminPassword = Read-Host -Prompt "Enter the administrator password" -AsSecureString
$vmName = "MyWindowsVM"
$dnsLabelPrefix=-join ( (97..122) | Get-Random -Count 12 | % {[char]$_})
$virtualNetworkName = "${vmName}VNet"
$networkSecurityGroupName = "${vmName}SG"
$subnetName = "${vmName}sbnet"


New-AzResourceGroup -Name $resourceGroupName -Location "$location"
New-AzResourceGroupDeployment `
    -ResourceGroupName $resourceGroupName `
    -TemplateFile 'Template.json' `
    -adminUsername $adminUsername `
    -adminPassword $adminPassword `
    -dnsLabelPrefix $dnsLabelPrefix `
    -vmName $vmName `
    -virtualNetworkName $virtualNetworkName `
    -networkSecurityGroupName $networkSecurityGroupName `
    -subnetName $subnetName
    

 (Get-AzVm -ResourceGroupName $resourceGroupName).name
 Get-AzPublicIpAddress -ResourceGroupName $ResourceGroupName | Select IpAddress



#$resourceGroupName = Read-Host -Prompt "Enter the Resource Group name"
#$location = Read-Host -Prompt "Enter the location (i.e. centralus)"
#$adminUsername = Read-Host -Prompt "Enter the administrator username"
#$adminPassword = Read-Host -Prompt "Enter the administrator password" -AsSecureString
#$vmName = Read-Host -Prompt "Enter the Virtual Machine name"
#$dnsLabelPrefix=-join ((48..57) + (97..122) | Get-Random -Count 12 | % {[char]$_})
#$virtualNetworkName = Read-Host -Prompt "Enter the Virtual-Nerwork name"
#$networkSecurityGroupName = Read-Host -Prompt "Enter the network security group name"

#Password: Yjdhmctp13l7