Set-AzVMCustomScriptExtension -ResourceGroupName Custom_Script_Extension_Resource_Group `
    -VMName <"Azure-VM-Name"> `
    -Location <"Location-Example: East US"> `
    -FileUri <"URL-of-the-First-Script"> `
    -Run 'First-Script-Name.ps1' `
    -Name "CustomScriptExtension"