## 📌 Description
This task involves configuring a **daily backup** of an Azure Virtual Machine using Azure Backup (Recovery Services Vault), setting **retention policies**, and **creating an alert rule** based on VM CPU usage. You will use both the **Backup Center** and **Azure Monitor** to manage and automate these operations.

---

## 🛠️ Prerequisites
- Azure CLI installed and logged in:
```bash
az login
VM already provisioned

Recovery Services vault created or create one in this task

🧾 Part A: Configure Backup and Alert Rule
1. 🔄 Create a Recovery Services Vault
bash
Copy
Edit
az backup vault create \
  --name MyRecoveryVault \
  --resource-group MyResourceGroup \
  --location eastus
2. 📄 Configure a Backup Policy for Daily 3:00 AM
bash
Copy
Edit
az backup policy set --vault-name MyRecoveryVault \
  --name DailyPolicy \
  --backup-management-type AzureIaasVM \
  --policy '{"schedulePolicy":{"schedulePolicyType":"SimpleSchedulePolicy","scheduleRunFrequency":"Daily","scheduleRunTimes":["03:00"]},"retentionPolicy":{"retentionPolicyType":"SimpleRetentionPolicy","dailySchedule":{"retentionTimes":["03:00"],"retentionDuration":{"count":30,"durationType":"Days"}}}}'
3. 🔗 Enable Backup for the VM
bash
Copy
Edit
az backup protection enable-for-vm \
  --resource-group MyResourceGroup \
  --vault-name MyRecoveryVault \
  --vm MyVM \
  --policy-name DailyPolicy
4. 🛎 Create an Alert Rule for CPU > 80%
Go to Azure Portal → Monitor → Alerts → New alert rule
Or use CLI:

bash
Copy
Edit
az monitor metrics alert create \
  --name "HighCPUAlert" \
  --resource-group MyResourceGroup \
  --scopes $(az vm show -g MyResourceGroup -n MyVM --query id -o tsv) \
  --condition "avg Percentage CPU > 80" \
  --description "Alert when CPU > 80%" \
  --action-group "MyEmailActionGroup"
Ensure an Action Group exists or create one:

bash
Copy
Edit
az monitor action-group create \
  --name MyEmailActionGroup \
  --resource-group MyResourceGroup \
  --short-name cpuemail \
  --action email admin youremail@example.com
🧾 Part B: Provision Backups in Backup Center
1. 🔍 Go to Backup Center
Azure Portal → Backup Center → + Backup

2. 📦 Configure Backup via Portal
Choose Azure Virtual Machine

Select Recovery Vault

Select VM(s)

Choose Daily → Time: 3:00 AM

Configure Retention: 30 Days (or any required duration)

Enable backup

✅ Expected Outcome
VM backups scheduled daily at 3:00 AM via Recovery Vault.

CPU alert triggers when CPU usage exceeds 80%.

Email notification is sent to designated recipients.

Backup retention is configured per policy.

