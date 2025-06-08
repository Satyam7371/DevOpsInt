## 🛠️ Prerequisites
- Azure CLI installed on your system.  
  [Install Instructions](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
- Logged in to Azure:
```bash
az login
🌐 Step 1: Create a Resource Group
bash
Copy
Edit
az group create --name MyResourceGroup --location eastus
🌐 Step 2: Create a Virtual Network and Subnet
bash
Copy
Edit
az network vnet create \
  --resource-group MyResourceGroup \
  --name MyVnet \
  --address-prefix 10.0.0.0/16 \
  --subnet-name MySubnet \
  --subnet-prefix 10.0.1.0/24
💻 Step 3: Create a Virtual Machine
bash
Copy
Edit
az vm create \
  --resource-group MyResourceGroup \
  --name MyVM \
  --vnet-name MyVnet \
  --subnet MySubnet \
  --image UbuntuLTS \
  --admin-username azureuser \
  --generate-ssh-keys
--image UbuntuLTS: Specifies the OS image.

--generate-ssh-keys: Creates SSH keys if not already present.

🔓 Step 4: Open Port 22 for SSH Access
bash
Copy
Edit
az vm open-port --port 22 --resource-group MyResourceGroup --name MyVM
✅ Expected Outcome
A new Virtual Network (MyVnet) and subnet (MySubnet) will be created.

A Linux-based Virtual Machine (MyVM) will be provisioned and connected to the subnet.

SSH access will be enabled on port 22.
