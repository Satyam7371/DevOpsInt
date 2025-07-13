## 🛠️ Prerequisites

- Azure DevOps project and React app repo
- Azure Linux VM created and publicly accessible
- NGINX or web server installed on VM (with write access to `/var/www/html` or custom path)
- SSH private key and username
- Service connection for SSH in Azure DevOps

---

## 🧭 Step-by-Step Instructions

---

### 🔹 Step 1: Create an SSH Service Connection

1. Go to **Project Settings > Service Connections**
2. Click **+ New service connection > SSH**
3. Enter the following:
   - Hostname (public IP of VM)
   - Port: `22`
   - Username (e.g., `azureuser`)
   - Paste the **private SSH key**
   - Name it: `AzureVM-SSH`
4. Save

---

### 🔹 Step 2: Create `azure-pipelines.yml`

```yaml
trigger:
  branches:
    include:
      - main

variables:
  buildDir: 'build'
  vmAppPath: '/var/www/html'
  sshServiceConnection: 'AzureVM-SSH'

stages:
- stage: Build
  jobs:
  - job: BuildReactApp
    pool:
      vmImage: 'ubuntu-latest'
    steps:
    - task: NodeTool@0
      inputs:
        versionSpec: '18.x'
      displayName: 'Install Node.js'

    - script: |
        npm install
        npm run build
      displayName: 'Install Dependencies and Build React App'

    - task: PublishBuildArtifacts@1
      inputs:
        PathtoPublish: '$(buildDir)'
        ArtifactName: 'reactapp'

- stage: Deploy
  dependsOn: Build
  jobs:
  - job: DeployToVM
    pool:
      vmImage: 'ubuntu-latest'
    steps:
    - download: current
      artifact: reactapp

    - task: CopyFilesOverSSH@0
      inputs:
        sshEndpoint: '$(sshServiceConnection)'
        sourceFolder: '$(Pipeline.Workspace)/reactapp'
        contents: '**'
        targetFolder: '$(vmAppPath)'
        cleanTargetFolder: true
      displayName: 'Copy Build Files to Azure VM'
🔹 Step 3: Configure the Azure VM
On your Azure VM:

Ensure NGINX or Apache is installed and configured to serve /var/www/html

Make sure directory permissions allow write from your SSH user

Allow HTTP (port 80) in NSG (Network Security Group)

✅ Expected Outcome
On push to main, the pipeline builds the React app

The final static files are copied to the Azure VM via SSH

App is served publicly through NGINX or Apache

