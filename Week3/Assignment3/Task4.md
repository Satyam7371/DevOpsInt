## 🛠️ Prerequisites
- Azure CLI installed: [Install Guide](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
- Logged into Azure CLI:
```bash
az login
Access to a subscription with permission to assign policies (Contributor or higher).

🧭 Step-by-Step Instructions
1. 🔍 List Available Built-In Policy Definitions
bash
Copy
Edit
az policy definition list --query "[].{name:displayName, id:id}" --output table
Pick a policy (e.g., "Require a tag on resources").

2. 📥 Get the Policy Definition ID
bash
Copy
Edit
az policy definition show --name 'Require a tag on resources' --query "id" --output tsv
3. 🎯 Assign Policy at Subscription Level
bash
Copy
Edit
az policy assignment create \
  --name "require-tag-assignment" \
  --policy <policy-definition-id> \
  --scope /subscriptions/<subscription-id> \
  --params '{ "tagName": { "value": "environment" }, "tagValue": { "value": "dev" } }'
Replace <subscription-id> and <policy-definition-id> with actual values.

✅ Verify Assignment
bash
Copy
Edit
az policy assignment list --scope /subscriptions/<subscription-id> --output table
🧪 Optional: Create a Custom Policy
Create a JSON file (custom-policy.json) like this:
json
Copy
Edit
{
  "properties": {
    "displayName": "Enforce location to East US",
    "policyType": "Custom",
    "mode": "All",
    "description": "Only allow resources in East US region.",
    "parameters": {},
    "policyRule": {
      "if": {
        "field": "location",
        "notEquals": "eastus"
      },
      "then": {
        "effect": "deny"
      }
    }
  }
}
Create and Assign It:
bash
Copy
Edit
az policy definition create \
  --name "location-policy" \
  --rules custom-policy.json \
  --display-name "Location Restriction Policy" \
  --mode All \
  --subscription <subscription-id>

az policy assignment create \
  --name "enforce-eastus" \
  --policy "location-policy" \
  --scope /subscriptions/<subscription-id>
✅ Expected Outcome
A policy will be assigned at the subscription level.

Any resources violating the policy will be blocked or flagged (depending on the policy effect).

You can monitor compliance from the Azure Portal or using az policy state.

📚 R
