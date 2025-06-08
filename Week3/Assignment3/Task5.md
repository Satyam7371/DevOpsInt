🧭 Step-by-Step Instructions
1. ✅ Create a Resource Group
bash
Copy
Edit
az group create --name MyKeyVaultRG --location eastus
2. 🔐 Create a Key Vault
bash
Copy
Edit
az keyvault create --name MyKeyVault123 --resource-group MyKeyVaultRG --location eastus
Note: The name must be globally unique.

3. 🔑 Add a Secret to the Key Vault
bash
Copy
Edit
az keyvault secret set --vault-name MyKeyVault123 --name "DbPassword" --value "SuperSecure123"
4. 🔎 Retrieve a Secret from Key Vault
bash
Copy
Edit
az keyvault secret show --vault-name MyKeyVault123 --name "DbPassword" --query value -o tsv
5. 👤 Configure Access Policy for a User
bash
Copy
Edit
az keyvault set-policy \
  --name MyKeyVault123 \
  --upn user@example.com \
  --secret-permissions get list set delete
You can also use --object-id for service principals or managed identities.

6. 🧩 Configure Access for an Application (Optional)
To allow an app (via client ID) to access the Key Vault:

bash
Copy
Edit
az keyvault set-policy \
  --name MyKeyVault123 \
  --spn <app-client-id> \
  --secret-permissions get list
7. 🔒 View All Access Policies
bash
Copy
Edit
az keyvault show --name MyKeyVault123 --query properties.accessPolicies
✅ Expected Outcome
An Azure Key Vault is created.

A secret is securely stored and retrieved.

Access policies are applied to users or apps.

Users/applications can access secrets based on permission settings.
