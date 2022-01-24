New-AzVm `
    -ResourceGroupName "MyNewResourceGroup" `
    -Name "MyNewVM1" `
    -Location "East US" `
    -Size "Standard_B4ms" `
    -VirtualNetworkName "MyVirtualNetwork" `
    -SubnetName "MySubnet1" `
    -SecurityGroupName "MySecurityGroup" `
    -PublicIpAddressName "MyWindowsVMPublicIP1" `
    -OpenPorts 80,3389