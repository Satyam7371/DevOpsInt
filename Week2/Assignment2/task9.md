

---

## 1. Create Azure Storage Account

```bash
az storage account create \
  --name mystorageinternship123 \
  --resource-group myResourceGroup \
  --location eastus \
  --sku Standard_LRS \
  --kind StorageV2 \
  --enable-hierarchical-namespace false
```

✅ *Storage Account created successfully.*

---

## 2. Upload Blob and Access It

```bash
# Create a container
az storage container create \
  --account-name mystorageinternship123 \
  --name mycontainer \
  --public-access container

# Upload file
az storage blob upload \
  --account-name mystorageinternship123 \
  --container-name mycontainer \
  --file ./welcome.txt \
  --name welcome.txt
```

✅ *Blob uploaded and accessible via public URL.*

---

## 3. Authentication Tests

### a. Access Key Connection

```bash
az storage account keys list --account-name mystorageinternship123 --resource-group myResourceGroup
# Use key in Azure CLI or Storage Explorer
```

✅ *Access granted using primary key.*

### b. Shared Access Signature (SAS)

```bash
az storage container generate-sas \
  --name mycontainer \
  --account-name mystorageinternship123 \
  --permissions rl \
  --expiry 2025-12-30T23:59Z \
  --output tsv
```

✅ *Generated SAS URL works for read & list only.*

### c. Azure AD Auth (RBAC)

```bash
# Assign role
az role assignment create \
  --assignee <user-object-id> \
  --role "Storage Blob Data Reader" \
  --scope "/subscriptions/<sub-id>/resourceGroups/myResourceGroup/providers/Microsoft.Storage/storageAccounts/mystorageinternship123"
```

✅ *User can access blobs via Azure AD login.*

---

## 4. Lifecycle Management

```json
{
  "rules": [
    {
      "enabled": true,
      "name": "archive-policy",
      "type": "Lifecycle",
      "definition": {
        "actions": {
          "baseBlob": {
            "tierToCool": {"daysAfterModificationGreaterThan": 7},
            "delete": {"daysAfterModificationGreaterThan": 30}
          }
        },
        "filters": {"blobTypes": ["blockBlob"]}
      }
    }
  ]
}
```

```bash
az storage account management-policy create \
  --account-name mystorageinternship123 \
  --resource-group myResourceGroup \
  --policy @policy.json
```

✅ *Policy applied; blobs will tier/delete automatically.*

---

## 5. Object Replication

```bash
# Set replication rules (source and destination accounts must exist)
az storage account or-policy create \
  --resource-group myResourceGroup \
  --account-name mystorageinternship123 \
  --destination-account <destination-storage-account> \
  --rules '[{"ruleId":"rep1","sourceContainer":"mycontainer","destinationContainer":"mycontainer"}]'
```

✅ *Objects in source container are replicated to destination.*

---

## 6. File Share & File Sync

### a. Create File Share

```bash
az storage share create \
  --name myfileshare \
  --account-name mystorageinternship123
```

✅ *File share created.*

### b. Mount File Share (Windows example)

```powershell
net use Z: \\mystorageinternship123.file.core.windows.net\myfileshare /u:mystorageinternship123 <storage-key>
```

✅ *Mounted successfully and accessed via File Explorer.*

### c. Azure File Sync (via portal & agent)

1. Registered on-prem Windows Server
2. Created Sync Group
3. Connected local path to Azure File Share

✅ *Two-way sync operational.*

---

## 7. Access Tiers

```bash
az storage blob set-tier \
  --account-name mystorageinternship123 \
  --container-name mycontainer \
  --name welcome.txt \
  --tier Cool
```

✅ *Blob tier changed to Cool. Archive tier tested with rehydration.*

---

**Status: ✅ All features tested and validated in Azure.**
