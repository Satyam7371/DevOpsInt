
## 🛠️ Prerequisites

- Azure DevOps project with a Git repository
- Initialized branch (e.g., `main`, `develop`)
- Organization or Project Admin permissions

---

## 🧭 Step-by-Step Guide

---

### 🔹 Part A: Apply Branch Policy

1. Go to your **Azure DevOps Project**
2. Navigate to **Repos > Branches**
3. Locate your branch (e.g., `main`) → Click **... > Branch policies**

#### Common policies to enable:
- ✅ **Require a minimum number of reviewers** (e.g., 2)
- ✅ **Check for linked work items**
- ✅ **Check for comment resolution**
- ✅ **Limit merge types** (e.g., no squash or rebase)
- ✅ **Build validation**  
   - Add your build pipeline
   - Enable "Automatically queue builds"
   - Optionally require successful builds to merge

Click **Save** to enforce policies.

---

### 🔹 Part B: Apply Branch Security

1. Navigate to **Project Settings > Repositories > [YourRepoName]**
2. Click **Security** (top-right corner)
3. Select the branch you want to secure (e.g., `refs/heads/main`)
4. Choose user/group (e.g., `Contributors` or `Project Administrators`)

#### Set permissions:

| Permission                      | Contributors | Project Admins |
|-------------------------------|--------------|----------------|
| Contribute                     | Deny         | Allow          |
| Force push                    | Deny         | Allow          |
| Delete                        | Deny         | Allow          |
| Bypass branch policies        | Deny         | Allow          |
| View repository               | Allow        | Allow          |

Click **Save Changes** after modifying each role's permissions.

---

## ✅ Expected Outcome

- Only authorized users can make changes to protected branches.
- Pull requests are enforced before merging.
- Contributors cannot bypass policy rules or force push.
- Secure and auditable workflows are implemented.

---
