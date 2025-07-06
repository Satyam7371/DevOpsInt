## 🛠️ Prerequisites

- Azure DevOps project already created
- Repository initialized with a `master` branch
- Project Administrator access
- At least one user added as Contributor

---

## 🧭 Step-by-Step Instructions

### 🔹 Step 1: Go to Branch Policies

1. Open your Azure DevOps project.
2. Navigate to **Repos > Branches**
3. Locate the `master` branch.
4. Click the **three dots (`...`)** next to `master` → Select **Branch policies**

---

### 🔹 Step 2: Restrict Access via Permissions

1. In the left menu, go to **Project Settings > Repositories**
2. Select the repo → Click on **Security**
3. Choose the `Contributors` group.
4. Set these permissions for `master` branch:
   - **Contribute**: **Deny**
   - **Force push (rewrite history & delete branches)**: **Deny**
   - **Create branch**: Allow (optional)
   - **Bypass policies**: **Not set / Deny**

5. For `Project Administrators` group:
   - **Contribute**: **Allow**
   - **Bypass policies when pushing**: **Allow**
   - **Bypass branch policies**: **Allow**

---

### 🔹 Step 3: Enforce Pull Requests (Optional but Recommended)

Still under Branch Policies for `master`:
- ✅ Require a minimum number of reviewers
- ✅ Check for linked work items
- ✅ Enforce successful builds (if CI/CD is configured)

---

### ✅ Expected Outcome

- **Contributors** will see a **permission denied** error when trying to push to `master`:
remote: TF401027: You need the Git 'Contribute' permission to perform this action.
