## Task 8: Docker Compose for Multi-Container Applications & Docker Security Best Practices

### 🎯 Objective

- Use **Docker Compose** to define and run multi-container applications.
- Understand and apply key **Docker security best practices**.

---

## 🐳 Part 1: Docker Compose for Multi-Container Apps

Docker Compose simplifies the process of managing multi-container applications using a single `docker-compose.yml` file.

---

### ✅ Step-by-Step: Example – Web App + Redis

#### 1️⃣ Create `docker-compose.yml`

```yaml
version: '3.8'

services:
  web:
    image: nginx
    ports:
      - "8080:80"

  redis:
    image: redis
2️⃣ Launch the application
bash
Copy
Edit
docker compose up -d
3️⃣ Verify running containers
bash
Copy
Edit
docker ps
You should see both nginx and redis running.

4️⃣ Stop and remove containers
bash
Copy
Edit
docker compose down
🛡️ Part 2: Docker Security Best Practices
Security is critical when running containers in production environments.

✅ General Best Practices
Practice	Description
Use trusted images	Only pull from verified DockerHub sources or private registries
Scan images	Use tools like docker scan or Trivy for vulnerabilities
Limit container privileges	Run containers with non-root users whenever possible
Keep Docker up-to-date	Regularly update Docker Engine and related packages
Avoid unnecessary ports	Only expose the ports required by the application
Use .dockerignore	Avoid including sensitive files in Docker builds
Use secrets securely	Avoid hardcoding secrets or passwords in Dockerfiles or Compose files

🔐 Run Container with Limited Privileges
bash
Copy
Edit
docker run -u 1001 nginx
This runs the container as user 1001 instead of root.

📂 Example .dockerignore
bash
Copy
Edit
*.env
*.log
.git
node_modules
This prevents sensitive or bulky files from being included in Docker builds.

