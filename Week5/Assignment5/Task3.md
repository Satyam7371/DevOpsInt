## 📌 Description
This task walks through deploying an **Azure Kubernetes Service (AKS)** cluster using the **Azure Portal**, accessing the Kubernetes dashboard, and assigning roles for multiple users. This is a key part of enterprise-grade cluster management, where role-based access control (RBAC) helps define permissions for developers, admins, and other teams.

---

## 🧭 Step-by-Step Instructions

### 🔹 Part 1: Deploy AKS Cluster via Azure Portal

1. Go to [https://portal.azure.com](https://portal.azure.com)
2. Search for **"Kubernetes services"** and click **“+ Create”**.
3. Under **Basics**:
   - Subscription: Select your subscription
   - Resource Group: Create or select one (e.g., `aks-rg`)
   - Cluster name: `myAKSCluster`
   - Region: Choose a supported region (e.g., East US)
   - Kubernetes version: Use the default or latest stable
4. Under **Node pools**:
   - Set VM size (e.g., `Standard_DS2_v2`)
   - Node count: 1 or more
5. Keep defaults for rest and click **Review + Create**
6. Click **Create**

Wait for deployment to finish (takes ~5–10 minutes).

---

### 🔹 Part 2: Access the AKS Dashboard

1. Go to the AKS resource → **Settings > Kubernetes resources**
2. Select **Namespaces** or **Deployments**
3. Alternatively, install the dashboard locally:
   ```bash
   az aks install-cli
   az aks get-credentials --resource-group aks-rg --name myAKSCluster
   kubectl proxy
Visit:

bash
Copy
Edit
http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/
🔹 Part 3: Create Roles for Multiple Users (RBAC)
A. Create a Role YAML file (dev-role.yaml)
yaml
Copy
Edit
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  namespace: default
  name: developer-role
rules:
- apiGroups: [""]
  resources: ["pods", "services", "deployments"]
  verbs: ["get", "list", "create", "update", "delete"]
B. Create a RoleBinding (dev-rolebinding.yaml)
yaml
Copy
Edit
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: dev-rolebinding
  namespace: default
subjects:
- kind: User
  name: dev-user@example.com
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role
  name: developer-role
  apiGroup: rbac.authorization.k8s.io
Apply the Role and Binding:
bash
Copy
Edit
kubectl apply -f dev-role.yaml
kubectl apply -f dev-rolebinding.yaml
Replace dev-user@example.com with the actual Azure AD user email. Users must be part of the AAD integration setup for AKS.

✅ Expected Outcome
An AKS cluster is deployed via the Azure Portal.

The Kubernetes dashboard is accessible via browser.

Role-based access control (RBAC) is set up for specific users using custom roles.
