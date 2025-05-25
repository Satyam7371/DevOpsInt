# 🚀 Automated .NET App Deployment to IIS via Azure DevOps

## 📘 Overview
This project automates the deployment of a .NET web app to Windows IIS using Azure DevOps CI/CD pipelines.

## 📁 Project Structure

```
├── azure-pipelines.yml          # CI/CD pipeline definition
├── deploy.ps1                   # PowerShell script to deploy app to IIS
├── validate.ps1                 # PowerShell script to validate deployment
├── pipeline_proof_sample.png    # Sample execution proof
├── MyWebApp/                    # Sample .NET web application
│   ├── Program.cs
│   ├── Startup.cs
│   ├── MyWebApp.csproj
│   └── Controllers/
│       └── HomeController.cs
```

## ⚙️ Setup Instructions

### 1. CI Pipeline
- Builds the .NET web app
- Runs tests (add if needed)
- Publishes artifacts to the pipeline

### 2. CD Pipeline
- Downloads build artifact
- Deploys files to IIS using `deploy.ps1`
- Verifies deployment using `validate.ps1`

### 3. Tools Required
- Azure DevOps account
- IIS configured on Windows server
- PowerShell remoting or Deployment Group access

## 📸 Proof Screenshot
See `pipeline_proof_sample.png` for mocked DevOps proof.

---

🛠️ Customize the pipeline and site details in the PowerShell scripts.
