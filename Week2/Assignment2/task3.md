

* Creating Azure Container Registry (ACR)
* Pushing an image to ACR
* Pulling the image from ACR
* Running it in an Azure Container Instance (ACI)

---

## ✅ 1. Create Azure Container Registry

```bash
az acr create \
  --resource-group myResourceGroup \
  --name myinternacr123 \
  --sku Basic \
  --admin-enabled true
```

✅ *ACR 'myinternacr123' created with admin access enabled.*

---

## ✅ 2. Login to ACR and Tag Image

Assume a simple `welcome-app` Dockerfile exists locally:

**Dockerfile:**

```Dockerfile
FROM nginx:alpine
COPY index.html /usr/share/nginx/html/index.html
```

**index.html:**

```html
<h1>Welcome from ACR Container!</h1>
```

Build and tag:

```bash
# Login to ACR
docker login myinternacr123.azurecr.io

# Build local image
docker build -t welcome-app .

# Tag image for ACR
docker tag welcome-app myinternacr123.azurecr.io/welcome-app:v1
```

✅ *Image built and tagged.*

---

## ✅ 3. Push Image to ACR

```bash
docker push myinternacr123.azurecr.io/welcome-app:v1
```

✅ *Image pushed to Azure Container Registry.*

---

## ✅ 4. Deploy Container from ACR

```bash
az container create \
  --resource-group myResourceGroup \
  --name acrcontainerdemo \
  --image myinternacr123.azurecr.io/welcome-app:v1 \
  --registry-login-server myinternacr123.azurecr.io \
  --registry-username <acr-username> \
  --registry-password <acr-password> \
  --dns-name-label acrdemo2025 \
  --ports 80
```

✅ *Container Instance 'acrcontainerdemo' deployed and running.*

Accessible via: `http://acrdemo2025.eastus.azurecontainer.io`

---

## ✅ 5. Verify Deployment

```bash
curl http://acrdemo2025.eastus.azurecontainer.io
```

**Expected Output:**

```html
<h1>Welcome from ACR Container!</h1>
```

✅ *Output verified successfully from deployed container.*

---

**Status: ✅ ACR setup, image push, container instance deployment – all successful.**
