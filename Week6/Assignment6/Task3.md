## 📦 What is a PersistentVolume (PV)?

A **PersistentVolume** is a piece of storage in the cluster that has been provisioned by an admin or dynamically provisioned via StorageClasses.

## 📄 PV Example (YAML)

```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: my-pv
spec:
  capacity:
    storage: 1Gi
  accessModes:
    - ReadWriteOnce
  hostPath:
    path: /mnt/data
📥 What is a PersistentVolumeClaim (PVC)?
A PersistentVolumeClaim is a request for storage by a user. It uses a PVC to bind to a matching PV based on size and access mode.

📄 PVC Example (YAML)
yaml
Copy
Edit
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: my-pvc
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi
🧩 Using the PVC in a Pod
📄 Pod Example with Volume Mount
yaml
Copy
Edit
apiVersion: v1
kind: Pod
metadata:
  name: my-pod
spec:
  containers:
    - name: my-container
      image: nginx
      volumeMounts:
        - mountPath: "/usr/share/nginx/html"
          name: my-storage
  volumes:
    - name: my-storage
      persistentVolumeClaim:
        claimName: my-pvc
🧪 Commands to Apply All YAMLs
bash
Copy
Edit
kubectl apply -f pv.yaml
kubectl apply -f pvc.yaml
kubectl apply -f pod.yaml
📝 Notes
Access Modes:

ReadWriteOnce – one node can mount the volume for read/write.

ReadOnlyMany – multiple nodes can mount as read-only.

ReadWriteMany – multiple nodes can mount for read/write.

hostPath is for local testing only (not recommended for production).

For dynamic provisioning, use a StorageClass instead of manually creating a PV.

