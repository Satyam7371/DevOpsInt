## 🛠️ Prerequisites

- Azure DevOps project
- A .NET web application project (e.g., ASP.NET Core)
- Azure App Service created
- Azure Resource Manager **service connection** to Azure
- App Service credentials (available via the service connection)

---

## 🧾 Step-by-Step Instructions

---

### 🔹 Step 1: Create a Service Connection

1. Go to **Project Settings > Service Connections**
2. Create a new **Azure Resource Manager** connection
3. Authorize using `az login` or Service Principal
4. Give it a name (e.g., `AzureConnection`)

---

### 🔹 Step 2: Create the CI/CD YAML Pipeline

Create a file named `azure-pipelines.yml` in the root of your repo:

```yaml
trigger:
  branches:
    include:
      - main

variables:
  buildConfiguration: 'Release'
  azureSubscription: 'AzureConnection'
  appName: 'Your-AppService-Name'
  webAppPackagePath: '$(System.DefaultWorkingDirectory)/**/*.zip'

stages:
- stage: Build
  displayName: Build Stage
  jobs:
  - job: BuildJob
    pool:
      vmImage: 'windows-latest'
    steps:
    - task: UseDotNet@2
      inputs:
        packageType: 'sdk'
        version: '7.x.x'  # use your .NET version
        installationPath: $(Agent.ToolsDirectory)/dotnet

    - task: DotNetCoreCLI@2
      inputs:
        command: 'restore'
        projects: '**/*.csproj'

    - task: DotNetCoreCLI@2
      inputs:
        command: 'build'
        projects: '**/*.csproj'
        arguments: '--configuration $(buildConfiguration)'

    - task: DotNetCoreCLI@2
      inputs:
        command: 'publish'
        publishWebProjects: true
        arguments: '--configuration $(buildConfiguration) --output $(Build.ArtifactStagingDirectory)'
        zipAfterPublish: true

    - task: PublishBuildArtifacts@1
      inputs:
        PathtoPublish: '$(Build.ArtifactStagingDirectory)'
        ArtifactName: 'drop'

- stage: Deploy
  displayName: Deploy to Azure App Service
  dependsOn: Build
  jobs:
  - job: DeployJob
    pool:
      vmImage: 'windows-latest'
    steps:
    - task: AzureWebApp@1
      inputs:
        azureSubscription: '$(azureSubscription)'
        appType: 'webApp'
        appName: '$(appName)'
        package: '$(webAppPackagePath)'
✅ Expected Outcome
The pipeline will:

Restore, build, and publish the .NET application

Generate a .zip artifact

Deploy that package to Azure App Service automatically

After each commit to the main branch, the app is re-deployed

