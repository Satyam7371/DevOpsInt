## 🛠️ Prerequisites

- Azure DevOps organization and project
- Project Administrator permissions
- Credentials or tokens for the service (e.g., Azure subscription, DockerHub account)

---

## 🧭 Step-by-Step Instructions

---

### 🔹 Step 1: Navigate to Service Connections

1. Go to [https://dev.azure.com](https://dev.azure.com)
2. Open your project
3. Click on **Project Settings (⚙️)** in the lower-left corner
4. Under **Pipelines**, select **Service connections**
5. Click **+ New service connection**

---

### 🔹 Step 2: Select a Service Type

Choose a service type based on your use case. Examples:

- **Azure Resource Manager** → For deploying to Azure
- **Docker Registry** → For pushing/pulling Docker images
- **GitHub** → To fetch code or trigger workflows

---

### 🔹 Step 3: Configure the Service Connection

#### ✅ For Azure Resource Manager:
1. Choose **Service principal (automatic)** or **manual**
2. Select your **subscription** and **scope level** (management group, subscription, or resource group)
3. Provide a **connection name** (e.g., `AzureRM-Prod`)
4. Grant access permission to all pipelines (recommended)
5. Click **Save**

#### ✅ For Docker Registry:
1. Enter **Docker ID**, **password**, and **registry URL**
2. Name the connection (e.g., `DockerHub-Dev`)
3. Save

---

### 🔹 Step 4: Use the Service Connection in Pipelines

In a YAML pipeline:

```yaml
resources:
  repositories:
  - repository: templates
    type: git
    name: shared/templates
    endpoint: GitHub-ServiceConnection

jobs:
- job: deploy
  pool:
    vmImage: 'ubuntu-latest'
  steps:
  - task: AzureCLI@2
    inputs:
      azureSubscription: 'AzureRM-Prod'
      scriptType: 'bash'
      scriptLocation: 'inlineScript'
      inlineScript: |
        az group list
✅ Expected Outcome
A service connection is created and securely stores credentials

You can deploy to Azure, publish to Docker Hub, or fetch from GitHub securely

Pipelines now authenticate automatically using the connection

