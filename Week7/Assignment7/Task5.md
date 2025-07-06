## 🛠️ Prerequisites

- Azure DevOps project with a Git repo
- Two branches: a target branch (`main`) and a source branch (`feature/my-feature`)
- `Contribute` and `Create pull request` permissions

---

## 🧭 Step-by-Step Guide

### 🔹 Step 1: Create a New Branch

Using Azure Repos or CLI:

```bash
git checkout -b feature/my-feature
Make code changes, then push the branch:

bash
Copy
Edit
git add .
git commit -m "Added new feature"
git push --set-upstream origin feature/my-feature
🔹 Step 2: Open Azure DevOps and Create a PR
Go to Repos > Pull Requests

Click New Pull Request

Fill in:

Source: feature/my-feature

Target: main (or master)

Title: Add new feature

Description: Add purpose, changes, testing notes, etc.

(Optional) Assign reviewers and add work items

Click Create

🔹 Step 3: Review and Approve (if you're a reviewer)
View diff between source and target

Add comments or suggestions

Approve or Reject the PR

🔹 Step 4: Complete the Pull Request
After approval:

Click Complete

Choose options:

✅ Delete source branch

✅ Squash commits (if needed)

Confirm merge

This merges feature/my-feature into main safely with traceable history.

✅ Expected Outcome
A pull request is created, reviewed, and merged via Azure DevOps.

Code is integrated into the main branch with approvals and build validation (if configured).

The development process follows best practices for collaboration and version control.
