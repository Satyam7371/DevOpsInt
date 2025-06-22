## 🛠️ Prerequisites

- **Virtualization enabled** in BIOS (VT-x/AMD-v)
- OS: Windows, macOS, or Linux
- Tools required:
  - [kubectl](https://kubernetes.io/docs/tasks/tools/)
  - [Minikube](https://minikube.sigs.k8s.io/docs/start/)

---

## 🧭 Step-by-Step Instructions

### 1. 🔧 Install kubectl (Kubernetes CLI)
```bash
# On Linux
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/

# On Windows/macOS: Use Chocolatey or Homebrew
choco install kubernetes-cli
brew install kubectl
2. 🔧 Install Minikube
bash
Copy
Edit
# On Linux
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube

# On Windows/macOS: Use Chocolatey or Homebrew
choco install minikube
brew install minikube
3. 🚀 Start a Local Kubernetes Cluster
bash
Copy
Edit
minikube start
Minikube will start a local VM and configure Kubernetes with default settings.

4. ✅ Verify the Cluster Status
bash
Copy
Edit
kubectl get nodes
Expected output:

pgsql
Copy
Edit
NAME       STATUS   ROLES           AGE   VERSION
minikube   Ready    control-plane   Xs    v1.XX.X
5. 🌐 Access Kubernetes Dashboard (Optional)
bash
Copy
Edit
minikube dashboard
This opens a web-based UI to manage your cluster.

6. 🧹 Stop and Delete the Cluster (Optional Cleanup)
bash
Copy
Edit
minikube stop
minikube delete
✅ Expected Outcome
A single-node Kubernetes cluster is running locally on your machine.

You can manage the cluster using kubectl.

Optionally, you can interact with the dashboard GUI.
