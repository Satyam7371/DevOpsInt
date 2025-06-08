🧾 Part A: CLI-Based Backup and CPU Alert
1. 🔐 Create Recovery Services Vault
bash
Copy
Edit
az backup vault create \
  --name Vault1 \
  --resource-group MyResourceGroup \
  --location eastus
2. 🗓 Create Daily Backup Policy at 3:00 AM
Create a policy with 30-day retention:

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
3. 🖥 Enable VM Protection
bash
Copy
Edit
az backup protection enable-for-vm \
  --resource-group MyResourceGroup \
  --vault-name Vault1 \
  --vm MyVM \
  --policy-name DailyBackupPolicy
4. 📊 Create an Email Alert for CPU > 80%
Create Action Group for Email:
bash
Copy
Edit
az monitor action-group create \
  --name CpuAlertGroup \
  --resource-group MyResourceGroup \
  --short-name alertgrp \
  --action email admin youremail@example.com
Create Alert Rule:
bash
Copy
Edit
az monitor metrics alert create \
  --name HighCPUAlert \
  --resource-group MyResourceGroup \
  --scopes $(az vm show -g MyResourceGroup -n MyVM --query id -o tsv) \
  --condition "avg Percentage CPU > 80" \
  --description "VM CPU usage exceeded 80%" \
  --action-group CpuAlertGroup
🧾 Part B: Backup Center Configuration
1. 🧭 Use Azure Portal → Backup Center → + Backup
Select Backup Goal: Azure Virtual Machine

Choose Recovery Vault: Vault1

Select your VM

Set Backup Policy:

Frequency: Daily

Time: 3:00 AM

Retention: e.g., 30 Days

Enable backup

✅ Expected Outcome
A VM is backed up daily at 3:00 AM using Vault1.

CPU alerts are sent via email if CPU > 80%.

Retention policy ensures older backups are stored for 30 days.

