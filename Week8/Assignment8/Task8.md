## 🛠️ Prerequisites

- Azure DevOps project
- Azure subscription with:
  - **ACR (Azure Container Registry)** created
  - **Service connection** to Azure set up
- Resource group available (or created in pipeline)
- Azure CLI installed in agent (default in `ubuntu-latest`)

---

## 🧾 Step-by-Step Instructions

---

### 🔹 Step 1: Create Service Connection

1. Go to **Project Settings > Service Connections**
2. Create a **new Azure Resource Manager** connection
3. Authorize via `az login` or service principal
4. Name it: `AzureRMServiceConnection`

---

### 🔹 Step 2: Create `azure-pipelines.yml`

```yaml
trigger:
  branches:
    include:
      - main

variables:
  imageName: 'aci-demo'
  acrName: 'youracrname.azurecr.io'
  resourceGroup: 'aci-rg'
  containerName: 'aci-demo-container'
  tag: '$(Build.BuildId)'

stages:
- stage: BuildAndPush
  jobs:
  - job: Build
    pool:
      vmImage: 'ubuntu-latest'
    steps:
    - checkout: self

    - task: Docker@2
      displayName: Build and Push Docker Image
      inputs:
        containerRegistry: 'AzureRMServiceConnection'
        repository: '$(imageName)'
        command: 'buildAndPush'
        Dockerfile: '**/Dockerfile'
        tags: |
          $(tag)

- stage: DeployACI
  dependsOn: BuildAndPush
  jobs:
  - job: Deploy
    pool:
      vmImage: 'ubuntu-latest'
    steps:
    - task: AzureCLI@2
      displayName: Deploy to Azure Container Instances
      inputs:
        azureSubscription: 'AzureRMServiceConnection'
        scriptType: 'bash'
        scriptLocation: 'inlineScript'
        inlineScript: |
          az container create \
            --name $(containerName) \
            --resource-group $(resourceGroup) \
            --image $(acrName)/$(imageName):$(tag) \
            --registry-login-server $(acrName) \
            --registry-username $(ACR_USERNAME) \
            --registry-password $(ACR_PASSWORD) \
            --dns-name-label $(containerName)-$(Build.BuildId) \
            --ports 80 \
            --location eastus
🔐 You must create pipeline secrets for ACR_USERNAME and ACR_PASSWORD in Pipeline > Variables > Keep Secret.

🔹 Step 3: Push Code and Run Pipeline
Commit azure-pipelines.yml to your repo

Push changes to main branch

The pipeline will:

Build the Docker image

Push it to ACR

Deploy to Azure Container Instances (ACI)

✅ Expected Outcome
A CI/CD pipeline automates Docker image creation and ACI deployment

Each new push to main updates the ACI container with a new version

The ACI instance is publicly accessible (via DNS label)

