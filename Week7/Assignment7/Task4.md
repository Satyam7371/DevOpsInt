## 🛠️ Prerequisites

- Azure DevOps project with a Git repository
- Azure Pipelines YAML or classic pipeline set up
- At least one feature branch (`feature/*`, `main`, etc.)
- Admin or project-level permissions

---

## 🧭 Step-by-Step Guide

### 🔹 A. Apply Branch Filters in a YAML Pipeline

Open your pipeline YAML file (`azure-pipelines.yml`) and define branch triggers:

```yaml
trigger:
  branches:
    include:
      - main
      - release/*
    exclude:
      - feature/experimental
This configuration:

✅ Triggers the pipeline on main and any release/* branches

❌ Ignores commits pushed to feature/experimental

🔹 B. Apply Path Filters in YAML
yaml
Copy
Edit
trigger:
  paths:
    include:
      - src/**
      - app/**

pr:
  paths:
    include:
      - src/**
      - app/**
This ensures:

CI runs only when files in src/ or app/ are changed

PR validation triggers on changes to these paths

🔹 C. Apply Branch Filters in PR Branch Policies (Portal)
Go to Repos > Branches

Click ... next to the branch (e.g., main) → Branch Policies

Under Build Validation, add a required pipeline

Set Build expiration, Trigger on PR, etc.

In Branch filters:

✅ Include: feature/*, hotfix/*

❌ Exclude: experimental/*

🔹 D. Apply Path Filters in PR Build Validation (GUI)
In the same policy setup window (under Repos > Branches > Policies):

Under the selected pipeline, click Path filters

Add rules like:

src/*

infra/pipelines/*

Only PRs that modify these paths will trigger the policy

✅ Expected Outcome
CI pipelines will trigger only on defined branches and files.

Pull request validations will apply selectively, saving build time and enforcing targeted quality controls.

Developers can experiment in isolated paths/branches without triggering unnecessary builds.

