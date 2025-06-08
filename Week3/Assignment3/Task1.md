### 1. **Observe Assigned Azure Subscriptions**
- Go to [Azure Portal](https://portal.azure.com)
- Navigate to **Subscriptions** under the search bar or menu.
- View which subscription(s) are assigned to your account.

### Using Azure CLI:
```bash
az account show
az account list --output table
2. Observe Azure Entra ID (Azure Active Directory)
In the Azure Portal, go to Azure Active Directory (Entra ID).

Explore tenants, users, groups, and roles.

Optionally: Create a Personal Entra ID Tenant
In the Azure Portal:

Go to Azure Active Directory > Manage Tenants > Create.

Choose Azure Active Directory and follow the steps to create a new tenant.

3. Create Test Users and Groups
Create a Test User:
bash
Copy
Edit
az ad user create --display-name "Test User" --user-principal-name testuser@yourdomain.onmicrosoft.com --password "YourPassword123!"
Create a Group:
bash
Copy
Edit
az ad group create --display-name "TestGroup" --mail-nickname "TestGroup"
Add User to Group:
bash
Copy
Edit
az ad group member add --group "TestGroup" --member-id <user-object-id>
4. Assign a Built-in RBAC Role to a User
Assign Reader role:

bash
Copy
Edit
az role assignment create --assignee <user-object-id or UPN> --role Reader --scope /subscriptions/<subscription-id>
Verify assignment:

bash
Copy
Edit
az role assignment list --assignee <user-object-id>
5. Create a Custom Role and Assign It
Define the Role in a JSON File (custom-role.json):
json
Copy
Edit
{
  "Name": "Custom Read-Only Role",
  "IsCustom": true,
  "Description": "Can read everything except secrets.",
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
az role definition create --role-definition custom-role.json
Assign the Role:
bash
Copy
Edit
az role assignment create --assignee <user-object-id> --role "Custom Read-Only Role" --scope /subscriptions/<subscription-id>
✅ Expected Results
You have observed or created Entra ID (Azure AD).

Created test users and groups.

Assigned built-in RBAC roles to users.

Created and tested a custom role successfully.

