
This document captures actual CLI steps to:

* Create a VNet with two subnets
* Deploy Linux, Windows VM & SQL
* Build Hub & Spoke with 4 VNets
* Enable peering and verify VM connectivity
* Create Internal and External Load Balancers
* ✅ Create and Test Azure Application Gateway
* ✅ Setup DNS Server and Configure Domain Traffic
* ✅ Create and Manage Azure Storage Accounts and Blobs

---

## ✅ A. Create a VNet with 2 Subnets

```bash
az network vnet create \
  --resource-group myResourceGroup \
  --name myMainVnet \
  --address-prefix 10.0.0.0/16 \
  --subnet-name LinuxWinSubnet \
  --subnet-prefix 10.0.1.0/24

az network vnet subnet create \
  --resource-group myResourceGroup \
  --vnet-name myMainVnet \
  --name SQLSubnet \
  --address-prefix 10.0.2.0/24
```

✅ *VNet 'myMainVnet' created with Subnet1 (LinuxWin) and Subnet2 (SQL).*

### Deploy Linux VM in Subnet-1

```bash
az vm create \
  --resource-group myResourceGroup \
  --name LinuxVM \
  --vnet-name myMainVnet \
  --subnet LinuxWinSubnet \
  --image UbuntuLTS \
  --admin-username azureuser \
  --generate-ssh-keys
```

### Deploy Windows VM in Subnet-1

```bash
az vm create \
  --resource-group myResourceGroup \
  --name WindowsVM \
  --vnet-name myMainVnet \
  --subnet LinuxWinSubnet \
  --image Win2019Datacenter \
  --admin-username azureuser \
  --admin-password 'P@ssword123456'
```

### Deploy SQL Server in Subnet-2

```bash
az vm create \
  --resource-group myResourceGroup \
  --name SQLServerVM \
  --vnet-name myMainVnet \
  --subnet SQLSubnet \
  --image MicrosoftSQLServer:sql2019-ws2019:enterprise:latest \
  --admin-username azureuser \
  --admin-password 'P@ssword123456'
```

✅ *Linux, Windows, and SQL VMs provisioned in appropriate subnets.*

---

## ✅ J. Azure Storage Account and Blob Operations

### Create Storage Account

```bash
az storage account create \
  --name mystorageacct12345 \
  --resource-group myResourceGroup \
  --location eastus \
  --sku Standard_LRS \
  --kind StorageV2 \
  --enable-hierarchical-namespace true
```

✅ *Storage account created.*

### Upload and Access a Blob

```bash
az storage container create \
  --account-name mystorageacct12345 \
  --name mycontainer \
  --auth-mode login

az storage blob upload \
  --account-name mystorageacct12345 \
  --container-name mycontainer \
  --name sample.txt \
  --file ./sample.txt \
  --auth-mode login
```

✅ *Blob uploaded and accessible using Azure CLI.*

### Test Authentication Methods

* Azure Portal (with user identity)
* Azure CLI with login
* Azure Storage Explorer with Access Keys and Shared Access Signature (SAS)

### Use Azure Storage Explorer

* Connect using Storage Account Name and Access Key
* Upload, download, and browse blobs and file shares

### Access Keys Usage

```bash
az storage account keys list \
  --resource-group myResourceGroup \
  --account-name mystorageacct12345
```

✅ *Use key1 or key2 in Storage Explorer or applications.*

### Create Shared Access Signature (SAS)

```bash
az storage container generate-sas \
  --account-name mystorageacct12345 \
  --name mycontainer \
  --permissions rwl \
  --expiry 2025-06-30 \
  --output tsv
```

✅ *Use SAS token to access container with defined permissions.*

### Create Stored Access Policy

```bash
az storage container policy create \
  --account-name mystorageacct12345 \
  --container-name mycontainer \
  --name readwritepolicy \
  --permission rwl \
  --expiry 2025-06-30
```

✅ *Attach SAS to stored policy and test scoped access.*

### Access Tiers & Use Cases

* **Hot**: Frequent access
* **Cool**: Infrequent access
* **Archive**: Rarely accessed

### Apply Lifecycle Policy

```bash
az storage account management-policy create \
  --account-name mystorageacct12345 \
  --resource-group myResourceGroup \
  --policy @policy.json
```

Sample `policy.json`:

```json
{
  "rules": [
    {
      "enabled": true,
      "name": "move-to-cool",
      "type": "Lifecycle",
      "definition": {
        "filters": {"blobTypes": ["blockBlob"]},
        "actions": {
          "baseBlob": {
            "tierToCool": {"daysAfterModificationGreaterThan": 30}
          }
        }
      }
    }
  ]
}
```

✅ *Test blob transitions after modification.*

### Test Object Replication

* Set up replication between two storage accounts using Azure Portal or CLI.
* Validate copy of blob appears in destination container.

### Create File Share and Test

```bash
az storage share create \
  --account-name mystorageacct12345 \
  --name myfileshare

az storage file upload \
  --account-name mystorageacct12345 \
  --share-name myfileshare \
  --source ./example.txt \
  --path example.txt
```

✅ *Azure file share created and tested.*

### Azure File Sync

* Create Storage Sync Service
* Install Azure File Sync agent on Windows Server
* Register server and create sync group
* Test file sync functionality

---


---
