
markdown
Copy
Edit
## Task 6: Create a Custom Docker Bridge Network

### 🎯 Objective

Understand how to create and use a custom bridge network in Docker to enable container-to-container communication using container names as hostnames.

---

### 🔹 What is a Bridge Network?

A bridge network is the default network driver used when you don’t specify any network while starting a container. Custom bridge networks allow containers to discover each other by name and provide more control.

---

### ✅ Step-by-Step Guide

#### Step 1: Create a Custom Bridge Network

```bash
docker network create \
  --driver bridge \
  custom-bridge-net
Step 2: Verify the Network
bash
Copy
Edit
docker network ls
You should see custom-bridge-net listed.

Step 3: Run Containers in the Custom Network
bash
Copy
Edit
docker run -dit --name container1 --network custom-bridge-net alpine sh
docker run -dit --name container2 --network custom-bridge-net alpine sh
Step 4: Test Container-to-Container Communication
Enter container1 and ping container2 by name:

bash
Copy
Edit
docker exec -it container1 sh
ping container2
✅ You should see ping replies, proving they can resolve each other by name.

🧪 Additional Commands
List Networks
bash
Copy
Edit
docker network ls
Inspect a Network (View connected containers)
bash
Copy
Edit
docker network inspect custom-bridge-net
Remove Network (After removing containers)
bash
Copy
Edit
docker network rm custom-bridge-net
📝 Notes
Containers connected to the same custom bridge network can communicate using container names.

Containers on different networks cannot reach each other unless explicitly connected.
