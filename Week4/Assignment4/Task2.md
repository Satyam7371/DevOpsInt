## Task 2: Docker Installation, Basic Container Operations & Building from Dockerfile

### Objective

To install Docker, perform basic container operations (run, stop, remove), and build a custom Docker image from a Dockerfile.

---

### Step 1: Docker Installation (Ubuntu-based)

```bash
sudo apt update
sudo apt install \
    ca-certificates \
    curl \
    gnupg

sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io
Verify Docker Installation:

bash
Copy
Edit
docker --version
Step 2: Basic Docker Container Operations
Pull an Image:

bash
Copy
Edit
docker pull ubuntu
Run a Container:

bash
Copy
Edit
docker run ubuntu echo "Hello from Docker"
Run a Container with Interactive Shell:

bash
Copy
Edit
docker run -it ubuntu bash
List Containers:

bash
Copy
Edit
docker ps         # Running containers
docker ps -a      # All containers
Stop and Remove a Container:

bash
Copy
Edit
docker stop <container_id>
docker rm <container_id>
Remove Docker Image:

bash
Copy
Edit
docker rmi <image_name>
Step 3: Build Docker Image from Dockerfile
Project Structure:

pgsql
Copy
Edit
my-docker-app/
├── Dockerfile
├── index.js
└── package.json
index.js

js
Copy
Edit
console.log("Docker App Running!");
package.json

json
Copy
Edit
{
  "name": "dockerapp",
  "version": "1.0.0",
  "main": "index.js",
  "scripts": {
    "start": "node index.js"
  }
}
Dockerfile

Dockerfile
Copy
Edit
FROM node:14
WORKDIR /app
COPY . .
RUN npm install
CMD ["npm", "start"]
Build and Run:

bash
Copy
Edit
docker build -t my-docker-app .
docker run my-docker-app
