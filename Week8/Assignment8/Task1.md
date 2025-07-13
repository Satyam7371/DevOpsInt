## 🛠️ Prerequisites

- Azure DevOps project with:
  - Azure Boards enabled
  - Several work items (tasks, bugs, user stories)
  - Basic or Stakeholder access
- Project-level access to **Boards** and **Dashboards**

---

## 🧭 Step-by-Step Instructions

### 🔹 Step 1: Create a Work Item Query

1. Navigate to **Boards > Queries**
2. Click **New Query**
3. Define filters:
   - **Work Item Type**: User Story, Bug, or Task
   - **State**: Active, Resolved, etc.
   - **Assigned To**: [Me] or specific users
   - **Area Path** / **Iteration Path** (optional)

#### Example: Active Bugs Assigned to Me
```text
Work Item Type = Bug
State = Active
Assigned To = @Me
Click Run Query

Save the query:

Name: My Active Bugs

Folder: Shared Queries

Permissions: Public (if shared with team)

🔹 Step 2: Create or Configure a Dashboard
Go to Dashboards

Select an existing dashboard or click + New Dashboard

Name: Team Tracker

Team: Select your team

Visibility: Team or Organization

🔹 Step 3: Add Widgets to the Dashboard
Click Edit on your dashboard

Click + Add Widget

Choose useful widgets:

Query Results → Select your saved query (My Active Bugs)

Chart for Work Items → Pie/Bar chart based on queries

Sprint Overview

Assigned to Me

Burndown/Burnup Chart

Team Velocity

Configure widget settings:

Title

Refresh interval

Filters (State, Assigned To, Tags)

Click Save and Done Editing

🔹 Step 4: Share the Dashboard
Click the gear icon (⚙️) on the dashboard

Set sharing permissions:

Team visibility

Project-wide access

Copy and share the dashboard link

✅ Expected Outcome
Custom queries filter and organize work items by condition (e.g., bugs assigned to a user)

Dashboards visually summarize sprint status, open issues, team velocity, and user workload

Project stakeholders can monitor project progress without accessing raw data

