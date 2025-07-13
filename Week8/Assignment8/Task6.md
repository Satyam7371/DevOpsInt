## 🛠️ Prerequisites

- Azure DevOps project with a working **Release pipeline**
- At least one environment/stage defined
- Required users added to the project
- Pipeline permissions to configure releases

---

## 🧭 Step-by-Step Instructions

---

### 🔹 Step 1: Open Release Pipeline

1. Go to **Pipelines > Releases**
2. Click on your release pipeline or create a new one
3. Add a stage (e.g., Dev, QA, Prod)

---

### 🔹 Step 2: Configure Pre-Deployment Approvers

1. Hover over the stage (e.g., `QA`) and click the **Pre-deployment conditions (⚙️ gear icon)** on the left side
2. Toggle **Pre-deployment approvals** to **Enabled**
3. Click **+ Add** and select users or groups to approve
4. (Optional) Configure timeout and auto-approve settings:
   - Approval timeout (e.g., 2 days)
   - Email notifications
   - Require all approvers or any one

---

### 🔹 Step 3: Configure Post-Deployment Approvers

1. Hover over the stage and click the **Post-deployment conditions (⚙️ gear icon)** on the right side
2. Toggle **Post-deployment approvals** to **Enabled**
3. Add approvers and configure settings similarly

---

### 🔹 Step 4: Save and Trigger Release

1. Click **Save**
2. Create a **new release** using the pipeline
3. The release will now **pause** until:
   - Pre-deployment approvers approve the deployment
   - Deployment completes
   - Post-deployment approvers give final confirmation

---

## ✅ Expected Outcome

- The release pipeline will **pause** for approval before and/or after deployment.
- Only users listed as approvers can approve or reject.
- This adds a layer of security and governance to your release process.
