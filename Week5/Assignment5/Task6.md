## 📌 Description
This task demonstrates how to expose applications in an Azure Kubernetes Service (AKS) cluster using the three primary Kubernetes service types:
- **ClusterIP** (default, internal-only)
- **NodePort** (exposes service on each node's IP)
- **LoadBalancer** (exposes service via a public IP)

You'll deploy a sample app and expose it using each method to understand how Kubernetes networking works inside and outside the cluster.

---

## 🛠️ Prerequisites
- A running AKS cluster with `kubectl` configured:
```bash
az aks get-credentials --resource-group aks-rg --name myAKSCluster
A basic containerized app (e.g., nginx)

🧭 Step-by-Step Guide
1. 🚀 Deploy a Sample App
bash
Copy
Edit
kubectl create deployment demo-app --image=nginx
2. 🔹 Expose as ClusterIP (Default)
This is the default type; it's only accessible within the cluster.

bash
Copy
Edit
kubectl expose deployment demo-app \
  --name demo-clusterip \
  --port 80 \
  --target-port 80 \
  --type ClusterIP
Verify:
bash
Copy
Edit
kubectl get svc demo-clusterip
Cannot access this from browser — internal to cluster only.

3. 🔹 Expose as NodePort
This opens a static port (range 30000–32767) on each node.

bash
Copy
Edit
kubectl expose deployment demo-app \
  --name demo-nodeport \
  --port 80 \
  --target-port 80 \
  --type NodePort
Find the NodePort:
bash
Copy
Edit
kubectl get svc demo-nodeport
To access the app:

bash
Copy
Edit
http://<node-public-ip>:<nodePort>
4. 🔹 Expose as LoadBalancer
This provisions an Azure Load Balancer with a public IP.

bash
Copy
Edit
kubectl expose deployment demo-app \
  --name demo-loadbalancer \
  --port 80 \
  --target-port 80 \
  --type LoadBalancer
Get External IP:
bash
Copy
Edit
kubectl get svc demo-loadbalancer
Access the app in your browser:

cpp
Copy
Edit
http://<external-ip>
Takes a few minutes to provision a public IP.

✅ Expected Outcome
The demo-app service is available via internal (ClusterIP), external static port (NodePort), and public internet (LoadBalancer).

You understand when to use each service type based on your app exposure needs.

