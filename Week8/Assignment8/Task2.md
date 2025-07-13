## 🛠️ Prerequisites

- Azure DevOps project with a working YAML or Classic pipeline
- Access to edit pipelines
- Optional: Secret variables for sensitive data

---

## 🧭 Step-by-Step Instructions

---

### 🔹 Part A: Define Variables in YAML Pipeline

```yaml
# azure-pipelines.yml
variables:
  appName: 'myApp'
  environment: 'dev'

stages:
- stage: Build
  jobs:
  - job: BuildJob
    steps:
    - script: echo "Building $(appName) in $(environment) environment"
Output:
Building myApp in dev environment

🔹 Part B: Define Variables via Azure DevOps UI
Go to Pipelines > Edit > Variables

Click + Add

Name: buildConfig

Value: Release

Check Keep this value secret (for sensitive data like tokens)

Use it in YAML:

yaml
Copy
Edit
  - script: echo "Build config: $(buildConfig)"
🔹 Part C: Use Runtime Parameters (Optional)
For user-defined inputs at runtime:

yaml
Copy
Edit
parameters:
  - name: deployEnv
    type: string
    default: 'staging'

jobs:
- job: Deploy
  steps:
  - script: echo "Deploying to ${{ parameters.deployEnv }}"
Use this when you want dropdowns or user-defined inputs before a run.

🔹 Part D: Use Output Variables Between Jobs
yaml
Copy
Edit
jobs:
- job: JobA
  steps:
    - script: echo "##vso[task.setvariable variable=myVar;isOutput=true]HelloFromA"
      name: SetVar

- job: JobB
  dependsOn: JobA
  variables:
    varFromA: $[ dependencies.JobA.outputs['SetVar.myVar'] ]
  steps:
    - script: echo "Received: $(varFromA)"
✅ Expected Outcome
You define and use variables for app names, environments, or secrets.

The pipeline becomes more dynamic, reusable, and maintainable.

Variables support multiple scopes: pipeline-wide, stage-level, job-level, and step-level.

