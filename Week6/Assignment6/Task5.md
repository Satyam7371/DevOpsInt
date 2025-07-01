### 🎯 Objective

Learn how to configure **liveness** and **readiness** probes for Kubernetes pods deployed in an AKS (Azure Kubernetes Service) cluster.

---

## 🔹 What Are Probes?

- **Liveness Probe**: Checks if the app inside the container is alive. If it fails, the container is restarted.
- **Readiness Probe**: Checks if the app is ready to serve requests. If it fails, the pod is removed from the Service load balancer.

---

## 🧾 Example: NGINX Pod with Liveness & Readiness Probes

### ✅ YAML Definition

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx-health
  labels:
    app: nginx
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
        initialDelaySeconds: 5
        periodSeconds: 10
      readinessProbe:
        httpGet:
          path: /
          port: 80
        initialDelaySeconds: 5
        periodSeconds: 5
🔧 Deploy the Pod to AKS
Step 1: Apply the YAML
bash
Copy
Edit
kubectl apply -f probes.yaml
Step 2: Check Pod Status
bash
Copy
Edit
kubectl get pods
Step 3: Describe Pod to View Probe Events
bash
Copy
Edit
kubectl describe pod nginx-health
🧠 Explanation of Probe Fields
Field	Description
httpGet	Probe will send HTTP GET to container's endpoint
initialDelaySeconds	Time to wait before first probe
periodSeconds	Frequency of probing
failureThreshold	(Optional) Number of failures before action taken

📝 Notes
Liveness probes help auto-recover crashed apps.

Readiness probes ensure apps only receive traffic when fully ready.

Probes can use httpGet, exec, or tcpSocket.

