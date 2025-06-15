1. Introduction to Containerization and Docker Fundamentals
   
🔹 What is Containerization?

Containerization is a method of packaging and running applications and their dependencies in isolated environments called containers. Unlike virtual machines, containers share the host OS kernel and are lightweight and fast to start.

Benefits:

Portability

Consistency across environments

Efficient resource utilization

🔹 Docker Overview
Docker is the most popular containerization platform that allows developers to:

Build container images

Run containers

Share containers via Docker Hub

🔹 Basic Docker Terminology
Term	Description
Docker Image	A blueprint for containers; includes code, libraries, and dependencies
Docker Container	A running instance of an image
Dockerfile	A text file with instructions to build a Docker image
Docker Hub	A cloud-based repository to store and share Docker images

🔹 Docker Basic Commands
✅ Check Docker Version
bash
Copy
Edit
docker --version
✅ Run a Container
bash
Copy
Edit
docker run hello-world
✅ List Running Containers
bash
Copy
Edit
docker ps
✅ List All Containers (including stopped)
bash
Copy
Edit
docker ps -a
✅ Pull an Image
bash
Copy
Edit
docker pull nginx
✅ Run a Container in Detached Mode
bash
Copy
Edit
docker run -d nginx
✅ Stop a Container
bash
Copy
Edit
docker stop <container_id>
✅ Remove a Container
bash
Copy
Edit
docker rm <container_id>
✅ Build an Image from Dockerfile
bash
Copy
Edit
docker build -t myapp .
✅ Run a Container from Your Image
bash
Copy
Edit
docker run -p 8080:80 myapp
🔹 Sample Dockerfile
dockerfile
Copy
Edit
# Use an official base image
FROM node:14

# Set working directory
WORKDIR /app

# Copy files
COPY . .

# Install dependencies
RUN npm install

# Start the app
CMD ["node", "index.js"]
