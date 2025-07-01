### 🎯 Objective

Learn how to create, manage, scale, and upgrade an AKS (Azure Kubernetes Service) cluster using Azure CLI and Kubernetes commands.

---

## 🔹 1. Create an AKS Cluster

### ✅ Prerequisites

- Azure CLI installed (`az`)
- Logged in to Azure using `az login`
- Resource group already created

### 🧾 Command to Create AKS Cluster

```bash
az aks create \
  --resource-group myResourceGroup \
  --name myAKSCluster \
  --node-count 2 \
  --enable-addons monitoring \
  --generate-ssh-keys
🔹 2. Connect to AKS Cluster
✅ Get Cluster Credentials
bash
Copy
Edit
az aks get-credentials \
  --resource-group myResourceGroup \
  --name myAKSCluster
🧪 Test Connection
bash
Copy
Edit
kubectl get nodes
✅ You should see the AKS nodes listed.

🔹 3. Scale AKS Cluster
✅ Increase or Decrease Node Count
bash
Copy
Edit
az aks scale \
  --resource-group myResourceGroup \
  --name myAKSCluster \
  --node-count 4
✅ This will scale your AKS cluster to 4 nodes.

🔹 4. Upgrade AKS Cluster
✅ Check Available Versions
bash
Copy
Edit
az aks get-upgrades \
  --resource-group myResourceGroup \
  --name myAKSCluster
✅ Upgrade the Cluster Version
bash
Copy
Edit
az aks upgrade \
  --resource-group myResourceGroup \
  --name myAKSCluster \
  --kubernetes-version <latest-version>
Replace <latest-version> with a version from the previous command.

📊 Summary Table
Task	Command
Create Cluster	az aks create
Connect (kubectl)	az aks get-credentials
Get Nodes	kubectl get nodes
Scale Cluster	az aks scale
View Upgrade Options	az aks get-upgrades
Perform Upgrade	az aks upgrade
