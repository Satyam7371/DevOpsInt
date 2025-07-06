## 🛠️ Prerequisites

- Azure DevOps project with a **Release pipeline**
- At least one stage created in the Release pipeline
- Permissions to edit pipeline stages and configurations

---

## 🧭 Step-by-Step Guide

### 🔹 Step 1: Open Release Pipeline

1. Go to **Azure DevOps > Pipelines > Releases**
2. Open an existing release pipeline or create a new one
3. Hover over the stage and click the **Pre-deployment conditions (⚙️ gear icon)**

---

### 🔹 Step 2: Enable Gates

1. Under **Gates**, switch the toggle to **Enabled**
2. You’ll see options to configure up to 5 gates:

#### Available Gate Options:
- **Azure Monitor Alerts**: Block if an alert is active
- **Azure Function**: Run a function and wait for it to return a success
- **Invoke REST API**: Call an external service to validate deployment readiness
- **Query Work Items**: Require certain work items to exist or meet criteria
- **Query Azure DevOps Test Results**: Ensure test pass rate is above a threshold

---

### 🔹 Step 3: Example — Add Work Item Query Gate

1. Click **+ Add** > Select **Query Work Items**
2. Configure:
   - Project: `YourProject`
   - Query: Choose a saved shared query (e.g., “No Open Bugs”)
   - Required: At least 1 result must match
3. Add others like REST API or Azure Monitor as needed

---

### 🔹 Step 4: Set Gate Evaluation Settings

Under the Gates settings:
- **Delay before evaluation** (default: 5 mins)
- **Timeout value** (how long to wait for success)
- **Sampling interval** (how frequently to evaluate)

Save your configuration.

---

## ✅ Expected Outcome

- The pipeline stage will **only proceed** if all gate conditions pass.
- If gates fail (e.g., open bugs are found, or alerts are active), the deployment is **blocked or delayed** until resolved.
- This adds safety, compliance, and approval mechanisms before production releases.

---
