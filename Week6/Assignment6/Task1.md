### 🎯 Objective

Learn how to deploy applications using three key Kubernetes components:
- **ReplicationController**
- **ReplicaSet**
- **Deployment**

Understand their usage, YAML structure, and key pros/cons.

---

## 🧩 1. ReplicationController (RC)

### ✅ Purpose
Ensures a specified number of pod replicas are running at all times.

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
🔧 Apply RC
bash
Copy
Edit
kubectl apply -f rc.yaml
📦 2. ReplicaSet (RS)
✅ Purpose
A newer, more flexible version of ReplicationController. Supports advanced label selectors.

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
🔧 Apply RS
bash
Copy
Edit
kubectl apply -f rs.yaml
🚀 3. Deployment
✅ Purpose
Manages ReplicaSets and adds update/rollback strategies. Most widely used in real-world applications.

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
        image: nginx:latest
        ports:
        - containerPort: 80
🔧 Apply Deployment
bash
Copy
Edit
kubectl apply -f deployment.yaml
🧠 Comparison Table
Feature	ReplicationController	ReplicaSet	Deployment
API Version	v1	apps/v1	apps/v1
Rolling Updates	❌ Not supported	❌ Not supported	✅ Supported
Rollback Capability	❌	❌	✅ Yes
Usage in Production	❌ Obsolete	⚠️ Intermediate	✅ Standard

