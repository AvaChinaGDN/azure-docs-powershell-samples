# Variables for common values
$rgName='MyResourceGroup'
$location='eastus'

# Create a resource group.
New-AzureRmResourceGroup -Name $rgName -Location $location

# Create virtual network 1.
$vnet1 = New-AzureRmVirtualNetwork -ResourceGroupName $rgName -Name Vnet1 -AddressPrefix 10.0.0.0/16 -Location $location

# Create virtual network 2.
$vnet2 = New-AzureRmVirtualNetwork -ResourceGroupName $rgName -Name Vnet2 -AddressPrefix 10.1.0.0/16 -Location $location

# Peer VNet1 to VNet2.
Add-AzureRmVirtualNetworkPeering -Name LinkVnet1ToVnet2 -VirtualNetwork $vnet1 -RemoteVirtualNetworkId $vnet2.Id

# Peer VNet2 to VNet1.
Add-AzureRmVirtualNetworkPeering -Name LinkVnet2ToVnet1 -VirtualNetwork $vnet2 -RemoteVirtualNetworkId $vnet1.Id
