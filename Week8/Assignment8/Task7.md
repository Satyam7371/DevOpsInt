## 📌 Description
In this task, you will configure a complete CI/CD pipeline in **Azure DevOps** that:
- Builds a Docker image from source code
- Pushes the image to **Azure Container Registry (ACR)**
- Deploys the image to **Azure Kubernetes Service (AKS)**

---

## 🛠️ Prerequisites

- Azure DevOps project
- Azure subscription with:
  - **AKS cluster** already created
  - **ACR registry** set up (linked with AKS)
- Service connection to Azure (Azure Resource Manager)
- Kubernetes service connection configured

---

## 🧾 Step-by-Step Instructions

---

### 🔹 Step 1: Create Service Connections

#### 1. ACR:
- Go to **Project Settings > Service Connections**
- Create an **Azure Resource Manager** connection
- Enable access to ACR registry

#### 2. AKS:
- Create a **Kubernetes service connection**
- Select the AKS cluster and namespace
- Authorize with `az login` or use a service principal

---

### 🔹 Step 2: YAML Pipeline (azure-pipelines.yml)

```yaml
trigger:
  branches:
    include:
      - main

variables:
  imageName: 'demo-app'
  acrName: 'youracrname.azurecr.io'
  tag: '$(Build.BuildId)'

stages:
- stage: Build
  displayName: Build and Push Docker Image
  jobs:
  - job: DockerBuild
    pool:
      vmImage: 'ubuntu-latest'
    steps:
    - checkout: self

    - task: Docker@2
      inputs:
        containerRegistry: 'ACR-ServiceConnection'
        repository: '$(imageName)'
        command: 'buildAndPush'
        Dockerfile: '**/Dockerfile'
        tags: |
          $(tag)

- stage: Deploy
  displayName: Deploy to AKS
  dependsOn: Build
  jobs:
  - job: AKSDeploy
    pool:
      vmImage: 'ubuntu-latest'
    steps:
    - task: Kubernetes@1
      displayName: Deploy to AKS
      inputs:
        connectionType: 'Kubernetes Service Connection'
        kubernetesServiceConnection: 'AKS-ServiceConnection'
        namespace: 'default'
        command: apply
        useConfigurationFile: true
        configuration: 'manifests/deployment.yaml'
🔹 Step 3: Kubernetes Deployment YAML (manifests/deployment.yaml)
yaml
Copy
Edit
apiVersion: apps/v1
kind: Deployment
metadata:
  name: demo-app
spec:
  replicas: 2
  selector:
    matchLabels:
      app: demo-app
  template:
    metadata:
      labels:
        app: demo-app
    spec:
      containers:
      - name: demo-app
        image: youracrname.azurecr.io/demo-app:latest
        ports:
        - containerPort: 80

---
apiVersion: v1
kind: Service
metadata:
  name: demo-app-service
spec:
  type: LoadBalancer
  selector:
    app: demo-app
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
🔹 Step 4: Run the Pipeline
Push the code with azure-pipelines.yml and manifests/deployment.yaml

Azure DevOps will:

Build the Docker image

Push it to ACR

Deploy it to AKS via the manifest

✅ Expected Outcome
The pipeline runs automatically when code is pushed to main

Docker image is built and pushed to Azure Container Registry (ACR)

The AKS cluster pulls the latest image and updates the app deployment

