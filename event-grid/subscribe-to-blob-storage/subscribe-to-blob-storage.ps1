# Provide a unique name for the Blob storage account.
$storageName = "contosostorage"

# Provide an endpoint for handling the events.
$myEndpoint = "<endpoint URL>"

# Create resource group
New-AzureRmResourceGroup -Name myResourceGroup -Location westus2

# Create the Blob storage account. 
New-AzureRmStorageAccount -ResourceGroupName myResourceGroup `
  -Name $storageName `
  -Location westus2 `
  -SkuName Standard_LRS `
  -Kind BlobStorage `
  -AccessTier Hot

# Get the resource ID of the Blob storage account.
$storageId = (Get-AzureRmStorageAccount -ResourceGroupName myResourceGroup -AccountName $storageName).Id

# Subscribe to the Blob storage account. 
New-AzureRmEventGridSubscription `
  -EventSubscriptionName demoSubToStorage `
  -Endpoint $myEndpoint `
  -ResourceId $storageId
