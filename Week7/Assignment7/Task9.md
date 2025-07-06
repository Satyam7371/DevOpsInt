## 📌 Description
This task demonstrates how to apply **branch-level security** and **branch policies** in Azure DevOps so that:
- ✅ Contributors **can create pull requests (PRs)**
- ❌ Contributors **cannot directly merge or push to `master`**
- ✅ Project Administrators **retain full access**

This is a best practice to enforce code review and prevent unauthorized changes to critical branches like `master` or `main`.

---

## 🛠️ Prerequisites

- Azure DevOps project with a Git repository
- `master` branch exists
- Users added as **Contributors** or **Project Administrators**

---

## 🧭 Step-by-Step Instructions

### 🔹 Step 1: Configure Branch Permissions

1. Go to your Azure DevOps project.
2. Navigate to:  
   **Project Settings > Repos > [Your Repo] > Security**
3. Select branch path:  
   `refs/heads/master`
4. Choose group: **Contributors**

#### Set Permissions:

| Permission                      | Setting  |
|-------------------------------|----------|
| **Contribute**                 | ❌ Deny  |
| **Create branch**              | ✅ Allow |
| **Force push (rewrite/delete)**| ❌ Deny  |
| **Bypass policies when pushing** | ❌ Deny |
| **Contribute to pull requests**| ✅ Allow |

Click **Save Changes**

✅ Contributors can now:
- Create feature branches
- Submit pull requests
❌ But **cannot push directly** to `master`

---

### 🔹 Step 2: Configure Branch Policy (Optional but Recommended)

1. Go to **Repos > Branches**
2. Click **... > Branch Policies** on the `master` branch

#### Enable these options:
- ✅ **Require a minimum number of reviewers** (e.g., 1 or 2)
- ✅ **Check for linked work items**
- ✅ **Build validation** (if using CI pipelines)
- ✅ **Limit merge types** (e.g., disallow squash or rebase)
- ✅ **Block direct pushes to branch**

Save the policy settings.

---

### 🔹 Step 3: Test Behavior

- As a Contributor, try to push directly to `master`:  
  🔒 You should get a **permission denied** error.

- Create a branch, make changes, and open a PR:  
  ✅ PR should succeed and be visible for review.

---

## ✅ Expected Outcome

- Contributors can only contribute via **pull requests**
- Direct push/merge to `master` is blocked
- Project administrators can still manage and approve changes
