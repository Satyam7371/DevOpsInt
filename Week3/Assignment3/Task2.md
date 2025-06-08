### 1. 🔍 Observe Assigned Subscriptions
- Go to the [Azure Portal](https://portal.azure.com)
- In the search bar, type **"Subscriptions"** and open the **Subscriptions** blade.
- Note your subscription name, ID, and whether it is active or disabled.

#### Azure CLI:
```bash
az account show
az account list --output table
2. 🔐 Observe or Create Azure Entra ID (Azure Active Directory)
Go to Azure Active Directory (now called Entra ID) from the portal menu.

Check existing tenants or click Manage Tenants > Create to make a new one.

Choose Azure Active Directory (not Microsoft Entra Workload ID or Verified ID).

Set name and domain, then complete setup.

3. 👤 Create Test Users and Groups
Create a Test User:
bash
Copy
Edit
az ad user create --display-name "TestUser1" \
--user-principal-name testuser1@<yourdomain>.onmicrosoft.com \
--password "YourPassword123!"
Create a Test Group:
bash
Copy
Edit
az ad group create --display-name "TestGroup" --mail-nickname "TestGroup"
Add User to Group:
bash
Copy
Edit
az ad group member add --group "TestGroup" --member-id <user-object-id>
4. 🛡 Assign a Built-in RBAC Role
Assign Reader Role to a User:
bash
Copy
Edit
az role assignment create --assignee <user-object-id or UPN> \
--role Reader \
--scope /subscriptions/<subscription-id>
Verify:
bash
Copy
Edit
az role assignment list --assignee <user-object-id>
5. 🧩 Create and Assign a Custom Role
Sample Custom Role (customrole.json):
json
Copy
Edit
{
  "Name": "Custom Reader Role",
  "IsCustom": true,
  "Description": "Can read specific resources but not modify.",
  "Actions": [
    "Microsoft.Resources/subscriptions/resourceGroups/read",
    "Microsoft.Compute/virtualMachines/read"
  ],
  "NotActions": [],
  "AssignableScopes": ["/subscriptions/<subscription-id>"]
}
Create the Role:
bash
Copy
Edit
az role definition create --role-definition customrole.json
Assign the Custom Role:
bash
Copy
Edit
az role assignment create --assignee <user-object-id> \
--role "Custom Reader Role" \
--scope /subscriptions/<subscription-id>
✅ Expected Outcomes
You’ve identified your current Azure subscription.

Explored or created an Entra ID tenant.

Created test users and groups using Azure CLI.

Assigned a built-in RBAC role.

Successfully created and assigned a custom RBAC role.

