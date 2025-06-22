## 📌 Description
In this task, you will deploy a microservice-based application to an **Azure Kubernetes Service (AKS)** cluster and expose it to the public internet using a **LoadBalancer** service. This simulates a real-world production deployment of containerized apps that can be accessed externally.

---

## 🛠️ Prerequisites

- A running AKS cluster (`az aks create ...`)
- `kubectl` configured:
```bash
az aks get-credentials --resource-group aks-rg --name myAKSCluster
Docker images for microservices pushed to a public or private container registry (e.g., Docker Hub or Azure Container Registry)

🧭 Step-by-Step Deployment
1. 🧩 Sample Microservice App (multi-container example)
Assume 2 microservices:

frontend (React/Node)

backend (Express API)

2. 📄 Create Deployment YAML Files
backend-deployment.yaml
yaml
Copy
Edit
apiVersion: apps/v1
kind: Deployment
metadata:
  name: backend
spec:
  replicas: 1
  selector:
    matchLabels:
      app: backend
  template:
    metadata:
      labels:
        app: backend
    spec:
      containers:
      - name: backend
        image: yourdockerhub/backend:latest
        ports:
        - containerPort: 5000
backend-service.yaml
yaml
Copy
Edit
apiVersion: v1
kind: Service
metadata:
  name: backend
spec:
  selector:
    app: backend
  ports:
  - port: 5000
    targetPort: 5000
  type: ClusterIP
frontend-deployment.yaml
yaml
Copy
Edit
apiVersion: apps/v1
kind: Deployment
metadata:
  name: frontend
spec:
  replicas: 1
  selector:
    matchLabels:
      app: frontend
  template:
    metadata:
      labels:
        app: frontend
    spec:
      containers:
      - name: frontend
        image: yourdockerhub/frontend:latest
        ports:
        - containerPort: 80
        env:
        - name: BACKEND_URL
          value: http://backend:5000
frontend-service.yaml
yaml
Copy
Edit
apiVersion: v1
kind: Service
metadata:
  name: frontend
spec:
  selector:
    app: frontend
  ports:
  - port: 80
    targetPort: 80
  type: LoadBalancer
3. 🚀 Apply All Resources
bash
Copy
Edit
kubectl apply -f backend-deployment.yaml
kubectl apply -f backend-service.yaml
kubectl apply -f frontend-deployment.yaml
kubectl apply -f frontend-service.yaml
4. 🌐 Access the Application via Public IP
After a few minutes, get the public IP of the frontend service:

bash
Copy
Edit
kubectl get service frontend
Open the external IP in a browser:

cpp
Copy
Edit
http://<external-ip>
✅ Expected Outcome
Microservices (frontend, backend) are deployed on AKS.

backend is accessible within the cluster via ClusterIP.

frontend is accessible over the internet via a public IP using LoadBalancer.

🧹 Optional Cleanup
bash
Copy
Edit
kubectl delete -f backend-deployment.yaml
kubectl delete -f backend-service.yaml
kubectl delete -f frontend-deployment.yaml
kubectl delete -f frontend-service.yaml
