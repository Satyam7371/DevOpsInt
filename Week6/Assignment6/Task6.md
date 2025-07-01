### 🎯 Objective

Learn how to use **taints** and **tolerations** to control which pods are allowed to run on specific nodes in an Azure Kubernetes Service (AKS) cluster.

---

## 🔹 What Are Taints and Tolerations?

- **Taint**: Applied to a node. Prevents pods from being scheduled unless they tolerate the taint.
- **Toleration**: Applied to a pod. Allows it to be scheduled on nodes with matching taints.

---

## 🧾 Step 1: Apply a Taint to a Node

### ✅ Command to Taint a Node

```bash
kubectl taint nodes <node-name> key=value:NoSchedule
📌 Example:

bash
Copy
Edit
kubectl taint nodes aks-nodepool1-12345678 dedicated=storage:NoSchedule
This means: Only pods that tolerate dedicated=storage will be scheduled on this node.

🧾 Step 2: Add a Toleration to a Pod
✅ YAML Example
yaml
Copy
Edit
apiVersion: v1
kind: Pod
metadata:
  name: tolerant-pod
spec:
  containers:
    - name: nginx
      image: nginx
  tolerations:
    - key: "dedicated"
      operator: "Equal"
      value: "storage"
      effect: "NoSchedule"
This pod will tolerate the dedicated=storage:NoSchedule taint.

🧪 Testing
Get the list of nodes:

bash
Copy
Edit
kubectl get nodes
Check taints applied to a node:

bash
Copy
Edit
kubectl describe node <node-name> | grep -i taint
Deploy the pod YAML and confirm it's scheduled only on the tainted node:

bash
Copy
Edit
kubectl apply -f tolerant-pod.yaml
kubectl get pods -o wide
🧠 Key Taint Effects
Effect	Behavior
NoSchedule	Pod will not be scheduled unless tolerated
PreferNoSchedule	Scheduler avoids but doesn't block it
NoExecute	Evicts running pods without toleration

📝 Notes
Useful for dedicating nodes to specific workloads (e.g., GPU nodes, logging nodes).

Taints repel pods; tolerations allow exceptions.

Often used with node selectors or affinity rules for more control.

