🧭 Step-by-Step Instructions
1. ✅ Create a Resource Group
powershell
Copy
Edit
New-AzResourceGroup -Name "MyPSResourceGroup" -Location "EastUS"
2. 🌐 Create a Virtual Network and Subnet
powershell
Copy
Edit
$subnetConfig = New-AzVirtualNetworkSubnetConfig -Name "MySubnet" -AddressPrefix "10.0.0.0/24"
$vnet = New-AzVirtualNetwork -Name "MyVnet" -ResourceGroupName "MyPSResourceGroup" -Location "EastUS" -AddressPrefix "10.0.0.0/16" -Subnet $subnetConfig
3. 🌐 Create a Public IP Address
powershell
Copy
Edit
$publicIP = New-AzPublicIpAddress -Name "MyPublicIP" -ResourceGroupName "MyPSResourceGroup" -Location "EastUS" -AllocationMethod Dynamic
4. 🌐 Create a Network Security Group and Inbound Rule
powershell
Copy
Edit
$nsgRuleSSH = New-AzNetworkSecurityRuleConfig -Name "Allow-SSH" -Protocol Tcp -Direction Inbound -Priority 1000 -SourceAddressPrefix * -SourcePortRange * -DestinationAddressPrefix * -DestinationPortRange 22 -Access Allow
$nsg = New-AzNetworkSecurityGroup -ResourceGroupName "MyPSResourceGroup" -Location "EastUS" -Name "MyNSG" -SecurityRules $nsgRuleSSH
5. 🌐 Create a Network Interface
powershell
Copy
Edit
$nic = New-AzNetworkInterface -Name "MyNIC" -ResourceGroupName "MyPSResourceGroup" -Location "EastUS" -SubnetId $vnet.Subnets[0].Id -PublicIpAddressId $publicIP.Id -NetworkSecurityGroupId $nsg.Id
6. 💻 Create a Virtual Machine
powershell
Copy
Edit
$cred = Get-Credential
$vmConfig = New-AzVMConfig -VMName "MyPSVM" -VMSize "Standard_DS1_v2" |
    Set-AzVMOperatingSystem -Linux -ComputerName "MyPSVM" -Credential $cred |
    Set-AzVMSourceImage -PublisherName "Canonical" -Offer "UbuntuServer" -Skus "18.04-LTS" -Version "latest" |
    Add-AzVMNetworkInterface -Id $nic.Id

New-AzVM -ResourceGroupName "MyPSResourceGroup" -Location "EastUS" -VM $vmConfig
✅ Expected Outcome
A complete Ubuntu VM will be deployed using PowerShell.

It will be connected to a virtual network and publicly accessible via SSH.

