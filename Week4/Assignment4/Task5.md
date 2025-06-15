## Task 5: Push and Pull Docker Images to DockerHub and Azure Container Registry (ACR)

### 🎯 Objective

Learn how to push and pull Docker images using two types of registries:
- DockerHub (public/private cloud registry)
- Azure Container Registry (ACR)

---

### 🔹 Step 1: DockerHub - Push and Pull

#### ✅ Prerequisites

- [x] DockerHub account → https://hub.docker.com  
- [x] Docker installed and running

#### ✅ Login to DockerHub

```bash
docker login
✅ Tag your local image
bash
Copy
Edit
docker tag my-docker-app yourusername/my-docker-app:v1
✅ Push the image to DockerHub
bash
Copy
Edit
docker push yourusername/my-docker-app:v1
✅ Pull the image from DockerHub (on any machine)
bash
Copy
Edit
docker pull yourusername/my-docker-app:v1
🔹 Step 2: Azure Container Registry (ACR) - Push and Pull
✅ Prerequisites
Azure CLI installed (az)

Logged into Azure (az login)

Existing resource group

✅ Step-by-step Process
Create an ACR:

bash
Copy
Edit
az acr create --resource-group myResourceGroup \
  --name myACRRegistry --sku Basic
Login to ACR:

bash
Copy
Edit
az acr login --name myACRRegistry
Get ACR login server:

bash
Copy
Edit
az acr show --name myACRRegistry --query loginServer --output tsv
Example output:

lua
Copy
Edit
myacrregistry.azurecr.io
Tag the Docker image for ACR:

bash
Copy
Edit
docker tag my-docker-app myacrregistry.azurecr.io/my-docker-app:v1
Push the image to ACR:

bash
Copy
Edit
docker push myacrregistry.azurecr.io/my-docker-app:v1
Pull the image from ACR (from another machine or VM):

bash
Copy
Edit
docker pull myacrregistry.azurecr.io/my-docker-app:v1
📌 Summary
Registry	Push Command	Pull Command
DockerHub	docker push yourusername/image:tag	docker pull yourusername/image:tag
Azure ACR	docker push acrname.azurecr.io/image:tag	docker pull acrname.azurecr.io/image:tag

📚 References
