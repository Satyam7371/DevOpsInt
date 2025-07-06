## 🛠️ Prerequisites

- Azure DevOps account: [https://dev.azure.com](https://dev.azure.com)
- Organization already created or use a free trial
- Project Admin or Organization Owner access

---

## 🧭 Step-by-Step Guide

### 🔹 Step 1: Create a New Project

1. Go to [Azure DevOps Portal](https://dev.azure.com)
2. Click on **New Project**
   - Name: `MyTeamProject`
   - Visibility: Private
   - Version Control: Git
   - Work item process: Agile (or choose as needed)
3. Click **Create**

---

### 🔹 Step 2: Add User Groups

#### A. Navigate to Project Settings → **Permissions**

1. Click **New Group**
   - Name: `Developers`
   - Description: Dev team with repo and pipeline access

2. Add members:
   - Click **Add**, then search and select user emails

Repeat for other groups:
- `Testers`
- `Admins`
- `Viewers`

---

### 🔹 Step 3: Configure Group Policies

#### A. Permissions for Developers
- **Repositories**: Contribute, Create branch, Read
- **Pipelines**: Edit build pipeline, View builds

#### B. Permissions for Testers
- **Pipelines**: View builds, Queue builds
- **Boards**: Edit work items, Add comments

#### C. Permissions for Admins
- Full control on repos, boards, and pipelines

#### D. Permissions for Viewers
- Read-only access

> Apply these by going to Project Settings → Permissions → Select group → Modify permissions as needed.

---

## 🔐 Optional: Configure Branch Policies (e.g., on `main`)
1. Go to **Repos > Branches**
2. Click **... > Branch Policies** on `main`
3. Add:
   - Require pull request reviews
   - Limit merge types
   - Build validation (optional)

---

## ✅ Expected Outcome

- Azure DevOps project is created with at least 3–4 user groups.
- Each group has defined access to repos, boards, and pipelines.
- Group-level security policies and permissions are enforced.
