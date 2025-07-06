## 🛠️ Prerequisites

- Azure DevOps project with at least one Git repo
- `main` or `master` branch initialized
- Project Administrator permissions

---

## 🧭 Step-by-Step Instructions

### 🔹 Step 1: Navigate to Branch Security

1. Go to [Azure DevOps Portal](https://dev.azure.com/)
2. Select your project → **Repos > Branches**
3. Click the **three dots (`...`)** next to `main` or `master` → Select **Branch Security**

---

### 🔹 Step 2: Set Branch Security Permissions

#### For `Contributors` group:
- **Contribute** → ❌ Deny  
- **Force push (rewrite history & delete)** → ❌ Deny  
- **Create branch** → ✅ Allow (optional)  
- **Bypass policies when pushing** → ❌ Deny  

#### For `Project Administrators`:
- **Contribute** → ✅ Allow  
- **Bypass policies when pushing** → ✅ Allow  
- **Force push** → ✅ Allow  

Click **Save changes** after updating each permission.

---

### 🔹 Step 3: Apply Branch Lock

1. Go to **Repos > Branches**
2. Click on the lock icon next to the branch name (`main`/`master`)  
   Or right-click on the branch and select **Lock**

✅ This prevents:
- Direct pushes
- Pull request merges
- Branch deletion

> Locked branches can only be unlocked by users with elevated permissions (like Project Administrators).

---

## ✅ Expected Outcome

- Regular contributors cannot push, delete, or force-push to protected branches.
- Locked branches remain read-only, preventing accidental or unauthorized updates.
- Admins maintain full control over critical branches.

---
