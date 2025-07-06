## 🛠️ Prerequisites

- Azure DevOps project
- At least one repository connected (e.g., Azure Repos Git or GitHub)
- A working build pipeline (YAML or Classic)
- Optional: a release pipeline with defined stages and artifacts

---

## 🔹 Part A: Apply Build Triggers (CI and Schedule)

### 1. ✅ Continuous Integration (CI) Trigger in YAML

In `azure-pipelines.yml`:
```yaml
trigger:
  branches:
    include:
      - main
      - release/*
This triggers the build when commits are pushed to main or any release/* branch.

2. 🕒 Scheduled Build Trigger
yaml
Copy
Edit
schedules:
  - cron: "0 3 * * 1-5"  # Every weekday at 3:00 AM UTC
    displayName: Daily Build
    branches:
      include:
        - main
    always: true
3. ⚙️ Enable/Configure Triggers via Classic UI
Go to Pipelines > Builds > Edit

Select Triggers

✅ Enable “Continuous Integration”

Add branch filters

Set scheduled builds (optional)

Save the pipeline

🔹 Part B: Apply Release Triggers
1. 🚀 Trigger Release from Build Artifact
Go to Pipelines > Releases

Click on the pipeline → Select Artifact

Enable Continuous Deployment Trigger:

✅ Check “Enable continuous deployment trigger”

Set filters (e.g., only trigger when main is built)

Save

2. 🕒 Add a Scheduled Trigger for Release
Go to the Stage → Click Pre-deployment conditions

Enable Schedule

Time zone, days, and time

Useful for time-based deployments (e.g., after hours)

Save the stage and pipeline

✅ Expected Outcome
Build pipelines are triggered automatically:

On new commits (CI)

On a defined schedule (nightly or weekly)

Release pipelines are triggered:

When build artifacts are available

On a defined schedule (e.g., 3 AM deployment)

