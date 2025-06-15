## Task 3: Docker Registry, DockerHub & Multi-Stage Build

### Objective

Understand Docker registries, push and pull images to/from Docker Hub, and implement a multi-stage Dockerfile for optimized image builds.

---

### Step 1: DockerHub and Docker Registry

**DockerHub** is a cloud-based registry where Docker users can store and share container images publicly or privately.

#### ✅ Create DockerHub Account
- Visit: https://hub.docker.com/
- Sign up and verify your email.

#### ✅ Login from CLI
```bash
docker login
Step 2: Push Image to DockerHub
✅ Tag Your Image
bash
Copy
Edit
docker tag my-docker-app yourdockerhubusername/my-docker-app:v1
✅ Push to DockerHub
bash
Copy
Edit
docker push yourdockerhubusername/my-docker-app:v1
✅ Pull Image from DockerHub
bash
Copy
Edit
docker pull yourdockerhubusername/my-docker-app:v1
Step 3: Multi-Stage Docker Build
Multi-stage builds allow you to use one stage for building (with heavy dependencies), and a second, lightweight stage to run the app. This reduces final image size.

🧾 Dockerfile (Multi-stage)
Dockerfile
Copy
Edit
# Stage 1 - Build
FROM node:14 AS builder
WORKDIR /app
COPY . .
RUN npm install

# Stage 2 - Runtime
FROM node:14-slim
WORKDIR /app
COPY --from=builder /app .
CMD ["node", "index.js"]
✅ Build the Multi-Stage Image
bash
Copy
Edit
docker build -t my-multistage-app .
✅ Run the Image
bash
Copy
Edit
docker run my-multistage-app
