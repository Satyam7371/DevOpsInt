## 🛠️ Prerequisites

- Azure DevOps project with:
  - A working pipeline (YAML or Classic)
  - Pipeline library access
- Permissions to edit pipelines and manage variable/task groups

---

## 🧭 Step-by-Step Instructions

---

### 🔹 Part A: Create a Variable Group

1. Go to **Pipelines > Library**
2. Click **+ Variable group**
   - Name: `AppSettings`
   - Add variables:
     - `environmentName` = dev
     - `buildConfiguration` = Release
     - (Optional: Mark secrets)
3. Click **Save**

> ✅ Use this group in YAML with linking enabled

```yaml
variables:
- group: AppSettings
🔹 Part B: Create a Task Group (Classic Pipelines)
Go to Pipelines > Task groups

Click + Create task group

Select tasks from an existing pipeline (e.g., restore, build, test)

Name: BuildAndTest

Define parameters (e.g., solution name, output path)

Save and reuse in multiple pipelines

🔹 Part C: Set Variable Scope by Stage (YAML)
You can override or scope variables per stage:

yaml
Copy
Edit
variables:
  globalVar: 'value-global'

stages:
- stage: Dev
  variables:
    stageVar: 'dev-scope'
  jobs:
  - job: build
    steps:
    - script: echo "Global: $(globalVar), Stage: $(stageVar)"

- stage: Prod
  variables:
    stageVar: 'prod-scope'
  jobs:
  - job: deploy
    steps:
    - script: echo "Global: $(globalVar), Stage: $(stageVar)"
✅ globalVar is shared; stageVar is overridden in each stage.

🔹 Part D: Link Variable Group to Specific Stage
yaml
Copy
Edit
stages:
- stage: Dev
  variables:
  - group: DevGroup
  jobs:
  - job: devJob
    steps:
    - script: echo "ENV: $(environmentName)"

- stage: Prod
  variables:
  - group: ProdGroup
  jobs:
  - job: prodJob
    steps:
    - script: echo "ENV: $(environmentName)"
Each stage uses a separate variable group, allowing safe environment-specific configs.

✅ Expected Outcome
Centralized variable groups provide shared config across pipelines.

Task groups improve reuse of logic like builds/tests.

Stage-specific variables ensure proper scoping and environment separation.

