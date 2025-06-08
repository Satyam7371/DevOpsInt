🧾 Part A: Schedule Backup & Create CPU Alert (CLI-Based)
1. 🔐 Create a Recovery Services Vault
bash
Copy
Edit
az backup vault create \
  --name Vault1 \
  --resource-group MyResourceGroup \
  --location eastus
2. 📅 Create Daily Backup Policy for 3:00 AM with Retention
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
3. 🖥 Enable Backup Protection for the VM
bash
Copy
Edit
az backup protection enable-for-vm \
  --resource-group MyResourceGroup \
  --vault-name Vault1 \
  --vm MyVM \
  --policy-name DailyBackupPolicy
4. 🛎 Create CPU Alert Rule (CPU% > 80%)
Create an Action Group (for Email Notification)
bash
Copy
Edit
az monitor action-group create \
  --name CpuAlertGroup \
  --resource-group MyResourceGroup \
  --short-name cpu80 \
  --action email admin youremail@example.com
Create the Alert Rule
bash
Copy
Edit
az monitor metrics alert create \
  --name HighCPUUsageAlert \
  --resource-group MyResourceGroup \
  --scopes $(az vm show -g MyResourceGroup -n MyVM --query id -o tsv) \
  --condition "avg Percentage CPU > 80" \
  --description "Alert if CPU usage is more than 80%" \
  --action-group CpuAlertGroup
🧾 Part B: Provision Backup in Backup Center (Portal-Based)
1. 📍 Go to Azure → Backup Center → + Backup
Select Backup Goal → "Azure Virtual Machine"

Choose Vault1

Select VM(s)

2. 🕒 Configure Backup Schedule
Frequency: Daily

Time: 3:00 AM

Retention: e.g., 30 Days

Confirm and enable backup

✅ Expected Outcome
Daily backup at 3:00 AM is configured via both CLI and Backup Center.

CPU alert emails will be sent if usage exceeds 80%.

Retention policy is enforced to retain old backups for 30 days.

