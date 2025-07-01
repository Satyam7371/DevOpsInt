### 🎯 Objective

Learn how to:
- Create a **PersistentVolumeClaim (PVC)** using dynamic provisioning in AKS
- Attach the PVC to a pod
- Persist data even if the pod restarts

---

## 🔹 Step 1: Define the PersistentVolumeClaim

In AKS, volumes are typically dynamically provisioned using a **StorageClass** provided by Azure.

### 📄 pvc.yaml

```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: azure-pvc
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi
  storageClassName: managed-csi
📝 managed-csi is the default Azure CSI-based StorageClass in AKS.

🔹 Step 2: Create a Pod Using the PVC
📄 pod.yaml
yaml
Copy
Edit
apiVersion: v1
kind: Pod
metadata:
  name: pvc-demo-pod
spec:
  containers:
    - name: nginx
      image: nginx
      volumeMounts:
        - mountPath: "/usr/share/nginx/html"
          name: storage
  volumes:
    - name: storage
      persistentVolumeClaim:
        claimName: azure-pvc
🔧 Step 3: Apply the YAML Files
bash
Copy
Edit
kubectl apply -f pvc.yaml
kubectl apply -f pod.yaml
🧪 Step 4: Verify PVC and Pod Binding
Check PVC status:

bash
Copy
Edit
kubectl get pvc
Expected output:

pgsql
Copy
Edit
NAME        STATUS   VOLUME                                     CAPACITY   ACCESS MODES   STORAGECLASS   AGE
azure-pvc   Bound    pvc-xxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx     1Gi        RWO            managed-csi     1m
Check pod status and verify it's running:

bash
Copy
Edit
kubectl get pods
🧠 Notes
Azure dynamically provisions a disk in the background once the PVC is created.

If the pod is deleted, the volume remains and can be reattached.

Volume is node-bound when using ReadWriteOnce mode (only available to one node at a time).

🧼 Cleanup (Optional)
bash
Copy
Edit
kubectl delete -f pod.yaml
kubectl delete -f pvc.yaml
