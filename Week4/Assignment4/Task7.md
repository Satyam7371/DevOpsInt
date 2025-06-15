## Task 7: Create a Docker Volume and Mount It to a Container

### 🎯 Objective

Learn how to create and use Docker **volumes** to persist data generated or used by Docker containers, even after the container is removed.

---

### 🔹 What is a Docker Volume?

Volumes are the preferred mechanism for **persistent data storage** in Docker. Unlike bind mounts, volumes are managed entirely by Docker and stored in Docker’s storage area.

---

### ✅ Step-by-Step Guide

#### Step 1: Create a Docker Volume

```bash
docker volume create my-volume
Step 2: List All Volumes
bash
Copy
Edit
docker volume ls
You should see my-volume in the list.

Step 3: Mount the Volume to a Container
bash
Copy
Edit
docker run -dit \
  --name volume-container \
  --mount source=my-volume,target=/data \
  ubuntu
source=my-volume: The volume name

target=/data: The directory inside the container where volume is mounted

✅ Step 4: Write Data to the Volume
bash
Copy
Edit
docker exec -it volume-container bash
Inside the container:

bash
Copy
Edit
echo "This data is stored in Docker volume!" > /data/file.txt
exit
✅ Step 5: Launch Another Container with Same Volume
bash
Copy
Edit
docker run -it --rm \
  --mount source=my-volume,target=/data \
  ubuntu cat /data/file.txt
You should see:

kotlin
Copy
Edit
This data is stored in Docker volume!
✅ This confirms the volume persists across containers.

🧼 Optional: Inspect and Remove Volume
Inspect volume details:

bash
Copy
Edit
docker volume inspect my-volume
Remove volume (after containers are stopped/removed):

bash
Copy
Edit
docker volume rm my-volume
