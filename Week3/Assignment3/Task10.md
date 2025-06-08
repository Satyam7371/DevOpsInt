🧾 A. Daily Backup (Vault) + CPU Alert (Email)
1. 🔐 Create Recovery Services Vault
bash
Copy
Edit
az backup vault create \
  --name Vault1 \
  --resource-group MyResourceGroup \
  --location eastus
2. 📅 Create Daily Backup Policy for 3:00 AM
bash
Copy
Edit
az backup policy set \
  --vault-name Vault1 \
  --name DailyBackupPolicy \
  --backup-management-type AzureIaasVM \
  --policy '{
    "schedulePolicy": {
      "schedulePolicyType": "SimpleSchedulePolicy",
      "scheduleRunFrequency": "Daily",
      "scheduleRunTimes": ["03:00"]
    },
    "retentionPolicy": {
      "retentionPolicyType": "SimpleRetentionPolicy",
      "dailySchedule": {
        "retentionTimes": ["03:00"],
        "retentionDuration": {
          "count": 30,
          "durationType": "Days"
        }
      }
    }
  }'
3. 🖥 Enable Backup for VM
bash
Copy
Edit
az backup protection enable-for-vm \
  --resource-group MyResourceGroup \
  --vault-name Vault1 \
  --vm MyVM \
  --policy-name DailyBackupPolicy
4. 📊 Create Alert Rule for CPU > 80%
Step 1: Create Email Action Group
bash
Copy
Edit
az monitor action-group create \
  --name CpuAlertGroup \
  --resource-group MyResourceGroup \
  --short-name cpuemail \
  --action email admin youremail@example.com
Step 2: Create Alert Rule
bash
Copy
Edit
az monitor metrics alert create \
  --name HighCPUAlert \
  --resource-group MyResourceGroup \
  --scopes $(az vm show -g MyResourceGroup -n MyVM --query id -o tsv) \
  --condition "avg Percentage CPU > 80" \
  --description "Alert when VM CPU usage exceeds 80%" \
  --action-group CpuAlertGroup
🧾 B. Backup Center Configuration & Retention
1. Go to Azure Portal → Backup Center → + Backup
Backup Goal: Azure Virtual Machine

Select Vault1

Choose the VM to protect

2. Set the Backup Policy
Frequency: Daily

Time: 3:00 AM

Retention: 30 Days (or more as needed)

Enable backup

✅ Expected Outcome
VM is backed up daily at 3:00 AM using Vault1.

Backup policy includes retention for 30 days.

Email alert is triggered if VM CPU usage exceeds 80%.

You can monitor alerts and backup jobs via Azure Monitor and Backup Center.

