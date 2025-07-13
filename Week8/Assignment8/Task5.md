## 🛠️ Prerequisites

- Azure DevOps project and organization
- Admin access to a Linux or Windows VM
- Internet connectivity on the VM
- Azure DevOps **PAT (Personal Access Token)** (optional for advanced setups)

---

## 🧭 Step-by-Step Instructions

---

### 🔹 Step 1: Create a New Agent Pool (Optional)

1. Go to **Project Settings > Agent Pools**
2. Click **Add pool**
   - Name: `SelfHostedPool`
   - Type: Self-hosted
3. Save

---

### 🔹 Step 2: Download Agent Package

1. Go to **Project Settings > Agent Pools > SelfHostedPool**
2. Click **New Agent**
3. Choose your OS: **Windows** or **Linux**
4. Follow the instructions provided for the system type

---

### 🔹 Step 3: Install Agent on Linux

#### A. SSH into your Linux machine:
```bash
ssh user@your-linux-vm
B. Download and extract agent:
bash
Copy
Edit
mkdir myagent && cd myagent
wget https://vstsagentpackage.azureedge.net/agent/3.236.1/vsts-agent-linux-x64-3.236.1.tar.gz
tar zxvf vsts-agent-linux-x64-3.236.1.tar.gz
C. Configure the agent:
bash
Copy
Edit
./config.sh
Enter: Azure DevOps URL (e.g., https://dev.azure.com/your-org)

Choose Agent Pool: SelfHostedPool

Enter authentication method: PAT or OAuth

D. Run the agent:
bash
Copy
Edit
./svc.sh install
./svc.sh start
🔹 Step 3: Install Agent on Windows
A. Download and extract agent:
Unzip the downloaded file to C:\agent

Open Command Prompt as Administrator

cmd
Copy
Edit
cd C:\agent
config.cmd
B. Input:
Azure DevOps URL

PAT token or credentials

Agent name

Pool selection

C. Start the agent:
c
Copy
Edit
run.cmd
Or install it as a service:

c
Copy
Edit
svc install
svc start
🔹 Step 4: Confirm Agent is Online
Go to Agent Pools > SelfHostedPool

Your agent should appear with status Online

🔹 Step 5: Use Agent in YAML Pipeline
yaml
Copy
Edit
pool:
  name: SelfHostedPool

jobs:
- job: Build
  steps:
    - script: echo "Running on self-hosted agent"
✅ Expected Outcome
A self-hosted agent is installed and connected to your Azure DevOps organization

It appears under Agent Pools and can run build or deployment jobs

Useful for custom environments, security, or offline work

