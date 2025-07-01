### 🎯 Objective

Configure **Horizontal Pod Autoscaler (HPA)** in Azure Kubernetes Service (AKS) to automatically scale the number of pods in a deployment based on CPU usage.

---

## 🔹 Prerequisites

- Metrics Server must be installed in the cluster.

### ✅ Install Metrics Server (if not already installed)

```bash
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
Wait a few seconds and verify:

bash
Copy
Edit
kubectl get deployment metrics-server -n kube-system
🔹 Step 1: Create a Deployment
📄 nginx-deployment.yaml
yaml
Copy
Edit
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
spec:
  replicas: 1
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
        - name: nginx
          image: nginx
          resources:
            requests:
              cpu: "100m"
            limits:
              cpu: "200m"
          ports:
            - containerPort: 80
Apply the deployment
bash
Copy
Edit
kubectl apply -f nginx-deployment.yaml
🔹 Step 2: Enable HPA for the Deployment
bash
Copy
Edit
kubectl autoscale deployment nginx-deployment \
  --cpu-percent=50 \
  --min=1 \
  --max=5
Check status:

bash
Copy
Edit
kubectl get hpa
You’ll see output like:

bash
Copy
Edit
NAME               REFERENCE                     TARGETS         MINPODS   MAXPODS   REPLICAS   AGE
nginx-deployment   Deployment/nginx-deployment   10% / 50%        1         5         1         1m
🧪 Step 3: Test Auto-Scaling (Optional)
Use a CPU load generator to stress test the pods:

bash
Copy
Edit
kubectl run -i --tty load-generator --rm \
  --image=busybox /bin/sh
Then inside the container:

sh
Copy
Edit
while true; do wget -q -O- http://nginx-deployment; done
In another terminal, monitor HPA scaling up:

bash
Copy
Edit
kubectl get hpa -w
🧠 Notes
Scaling is based on CPU usage by default.

You can also autoscale based on custom metrics or memory, with additional configuration.

HPA only works properly when:

Metrics server is installed and healthy

CPU/Memory resource requests are defined in the container spec
