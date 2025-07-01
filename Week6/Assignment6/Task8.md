### 🎯 Objective

Learn how to configure **liveness** and **readiness** probes in Azure Kubernetes Service (AKS) to ensure application stability and self-healing behavior.

---

## 🔹 What Are Health Probes?

| Probe Type     | Purpose                                                                 |
|----------------|-------------------------------------------------------------------------|
| Liveness Probe | Checks if the application is **alive**. Restarts the container if failed. |
| Readiness Probe| Checks if the app is **ready to receive traffic**. Temporarily removes pod from service if failed. |

---

## 📄 Example Pod with Liveness and Readiness Probes

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: health-check-pod
spec:
  containers:
    - name: nginx
      image: nginx
      ports:
        - containerPort: 80
      livenessProbe:
        httpGet:
          path: /
          port: 80
        initialDelaySeconds: 10
        periodSeconds: 5
      readinessProbe:
        httpGet:
          path: /
          port: 80
        initialDelaySeconds: 5
        periodSeconds: 5
🧪 Step-by-Step: Deploy and Verify
Step 1: Apply the Pod Definition
bash
Copy
Edit
kubectl apply -f health-probes.yaml
Step 2: Check Pod Status
bash
Copy
Edit
kubectl get pods
It should show Running if the probes pass.

Step 3: Describe the Pod for Events
bash
Copy
Edit
kubectl describe pod health-check-pod
Look for events related to liveness/readiness probes.

🧠 Key Fields Explained
Field	Description
initialDelaySeconds	Time before probe is initiated
periodSeconds	How often the probe is performed
failureThreshold	Number of failures before action is taken
httpGet, tcpSocket, exec	Supported probe types

💡 Pro Tips
Liveness probe failures = container restarts

Readiness probe failures = container removed from service endpoints

Use exec probes for custom health scripts inside the container

