## Task 4: Create Docker Image Using Multiple Methods (Dockerfile & Running Container)

### Objective

Learn how to create Docker images using two primary methods:
1. Using a Dockerfile
2. Committing a running container

---

### Method 1: Using a Dockerfile

This is the most common and recommended way to create Docker images.

#### 🧾 Sample Dockerfile

```Dockerfile
# Base image
FROM ubuntu:20.04

# Install packages
RUN apt update && apt install -y nginx

# Set working directory
WORKDIR /var/www/html

# Default command
CMD ["nginx", "-g", "daemon off;"]
✅ Build the Image
bash
Copy
Edit
docker build -t nginx-custom .
✅ Run the Container
bash
Copy
Edit
docker run -d -p 8080:80 nginx-custom

### Method 2: Commit from a Running Container

This method allows creating an image from a running container by committing its current state.

✅ Step-by-Step:
Run a base container:

bash
Copy
Edit
docker run -it ubuntu bash
Inside container, install something:

bash
Copy
Edit
apt update && apt install -y nginx
exit
Get the container ID:

bash
Copy
Edit
docker ps -a
Commit the container as a new image:

bash
Copy
Edit
docker commit <container_id> nginx-committed
Run the new image:

bash
Copy
Edit
docker run -d -p 8081:80 nginx-committed
🧾 Comparison Table
Method	Pros	Cons
Dockerfile	Reproducible, versioned	Requires writing a Dockerfile
Commit Method	Quick for manual changes	Not version-controlled, less portable
