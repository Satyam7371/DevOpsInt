## 🛠️ Prerequisites

- At least **2 Linux-based machines** (VMs or cloud instances):
  - **1 Master Node**
  - **1 Worker Node**
- OS: Ubuntu 20.04 or later (preferred)
- Internet access on all nodes
- Root or sudo access
- Disable swap:
```bash
sudo swapoff -a
⚙️ System Preparation on All Nodes
1. Update system packages
bash
Copy
Edit
sudo apt update && sudo apt upgrade -y
2. Install container runtime (containerd)
bash
Copy
Edit
sudo apt install -y containerd
sudo mkdir -p /etc/containerd
containerd config default | sudo tee /etc/containerd/config.toml
sudo systemctl restart containerd
sudo systemctl enable containerd
3. Add Kubernetes apt repository
bash
Copy
Edit
sudo apt install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
4. Install kubeadm, kubelet, and kubectl
bash
Copy
Edit
sudo apt update
sudo apt install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
🖥️ Initialize the Master Node
bash
Copy
Edit
sudo kubeadm init --pod-network-cidr=192.168.0.0/16
After successful init, copy and run these commands to start using the cluster:

bash
Copy
Edit
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
🔗 Install Network Plugin (e.g., Calico)
bash
Copy
Edit
kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.25.0/manifests/calico.yaml
👷 Join the Worker Node
Copy the kubeadm join command from the master node’s output and run it on each worker node:

bash
Copy
Edit
sudo kubeadm join <MASTER_IP>:6443 --token <token> --discovery-token-ca-cert-hash sha256:<hash>
✅ Verify the Cluster
On the master node:

bash
Copy
Edit
kubectl get nodes
You should see both the master and worker nodes in Ready state.

🧹 Optional: Reset Cluster
bash
Copy
Edit
sudo kubeadm reset
sudo rm -rf $HOME/.kube
✅ Expected Outcome
A multi-node Kubernetes cluster is created using kubeadm

The master node controls the cluster and worker nodes are joined

Pod network is set up using a CNI (e.g., Calico)

