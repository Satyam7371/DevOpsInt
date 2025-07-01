
## 🎯 Objective

Learn how to deploy Kubernetes workloads using:

- ReplicationController
- ReplicaSet
- Deployment

Also understand the differences, pros, and cons of each controller type.

---

## 1. ReplicationController (RC)

### ✅ Purpose

Ensures a specified number of pod replicas are always running.

### 📄 Sample YAML

```yaml
apiVersion: v1
kind: ReplicationController
metadata:
  name: my-rc
spec:
  replicas: 2
  selector:
    app: myapp
  template:
    metadata:
      labels:
        app: myapp
    spec:
      containers:
        - name: my-container
          image: nginx
          ports:
            - containerPort: 80
🔧 Apply Command
bash
Copy
Edit
kubectl apply -f rc.yaml
2. ReplicaSet (RS)
✅ Purpose
A newer version of RC with support for set-based selectors.

📄 Sample YAML
yaml
Copy
Edit
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: my-rs
spec:
  replicas: 3
  selector:
    matchLabels:
      app: myapp
  template:
    metadata:
      labels:
        app: myapp
    spec:
      containers:
        - name: my-container
          image: nginx
          ports:
            - containerPort: 80
🔧 Apply Command
bash
Copy
Edit
kubectl apply -f rs.yaml
3. Deployment
✅ Purpose
Used to manage ReplicaSets and enable rolling updates, rollbacks, and zero-downtime deployments.

📄 Sample YAML
yaml
Copy
Edit
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-deployment
spec:
  replicas: 3
  selector:
    matchLabels:
      app: myapp
  template:
    metadata:
      labels:
        app: myapp
    spec:
      containers:
        - name: my-container
          image: nginx
          ports:
            - containerPort: 80
🔧 Apply Command
bash
Copy
Edit
kubectl apply -f deployment.yaml
📊 Comparison Table
Feature	ReplicationController	ReplicaSet	Deployment
API Version	v1	apps/v1	apps/v1
Rolling Updates	❌ No	❌ No	✅ Yes
Rollback Support	❌ No	❌ No	✅ Yes
Recommended Usage	❌ Deprecated	⚠️ Intermediate	✅ Production

