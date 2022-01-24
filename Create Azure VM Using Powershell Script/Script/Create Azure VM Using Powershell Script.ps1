New-AzVm `
    -ResourceGroupName "MyNewResourceGroup" `
    -Name "MyWindowsVM" `
    -Location "East US" `
    -Size "Standard_B4ms" `
    -VirtualNetworkName "MyVirtualNetwork" `
    -SubnetName "MySubnet" `
    -SecurityGroupName "MySecurityGroup" `
    -PublicIpAddressName "MyWindowsVMPublicIP" `
    -OpenPorts 80,3389