### 🎯 Objective

Understand the three primary types of Kubernetes services used to expose pods:

- ClusterIP
- NodePort
- LoadBalancer

Each service type allows different levels of network access to your application.

---

## 🔹 1. ClusterIP (Default)

### ✅ Purpose

Exposes the service **internally** within the cluster. **No external access**.

### 📄 YAML Example

```yaml
apiVersion: v1
kind: Service
metadata:
  name: clusterip-service
spec:
  selector:
    app: myapp
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
  type: ClusterIP
🧪 Access
bash
Copy
Edit
kubectl exec -it <any-pod> -- curl http://clusterip-service
❌ Cannot access from outside the cluster.

🔹 2. NodePort
✅ Purpose
Exposes the service on a static port on each Node's IP (typically between 30000–32767). Accessible from outside the cluster.

📄 YAML Example
yaml
Copy
Edit
apiVersion: v1
kind: Service
metadata:
  name: nodeport-service
spec:
  selector:
    app: myapp
  type: NodePort
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
      nodePort: 30080
🧪 Access
bash
Copy
Edit
http://<NodeIP>:30080
🔹 3. LoadBalancer
✅ Purpose
Exposes the service externally using a cloud provider’s load balancer (e.g., AWS ELB, Azure LB).

📄 YAML Example
yaml
Copy
Edit
apiVersion: v1
kind: Service
metadata:
  name: loadbalancer-service
spec:
  selector:
    app: myapp
  type: LoadBalancer
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
🧪 Access
Kubernetes will provision an external IP (visible via kubectl get svc) that can be accessed like:

bash
Copy
Edit
http://<external-ip>:80
📊 Comparison Table
Service Type	Internal Access	External Access	Cloud LB Integration	Use Case
ClusterIP	✅ Yes	❌ No	❌	Internal microservices
NodePort	✅ Yes	✅ Yes (manual IP/port)	❌	Dev/testing, manual external access
LoadBalancer	✅ Yes	✅ Yes	✅	Production public access

