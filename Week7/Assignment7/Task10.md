## 🛠️ Prerequisites

- Azure DevOps project with:
  - A Git repository
  - Azure Pipelines configured (YAML or Classic)
  - Azure Boards enabled with existing work items
- Commits or PRs that reference work item IDs (e.g., `#123`)

---

## 🧭 Step-by-Step Instructions

### 🔹 Step 1: Reference Work Items in Commits

When committing code, include the work item ID in the message:
```bash
git commit -m "Fixes login bug. Resolves #42"
This will automatically link the commit and the triggered build to Work Item #42.

🔹 Step 2: Reference Work Items in Pull Requests
Push your changes and create a PR.

In the PR description, mention work items using #ID, e.g.:

less
Copy
Edit
This PR adds feature XYZ. Related to #101 and fixes #42.
Azure DevOps will automatically link the PR to those work items.

🔹 Step 3: View Work Items in Pipeline Runs
Navigate to Pipelines > [Your Pipeline]

Select a specific run

Go to the Summary > Related work items section

✅ You will see work items that were mentioned in:

Git commits

Pull requests

Manual associations

🔹 Step 4: Enforce Work Item Linking (Optional Policy)
Go to Repos > Branches > Branch Policies

Choose the target branch (e.g., main)

Enable Check for linked work items

This requires PRs to be associated with at least one work item before they can be completed.

🔹 Step 5: Link Work Items in Releases (Classic)
Go to Pipelines > Releases

Select a release run

Click on Work Items tab to see linked tasks, bugs, features

You can also add links manually

✅ Expected Outcome
Work items are automatically linked to builds and releases

You can trace deployments and builds back to user stories, bugs, and tasks

PRs and pipeline runs will show related work items, improving team visibility and traceability

