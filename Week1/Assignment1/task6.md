Description
Version control is a system that tracks changes to files over time. It allows multiple people to collaborate, monitor progress, and revert to previous versions when necessary. Git is the most widely used distributed version control system, essential for modern software development.

This task introduces Git, covering its installation, setup, and the most commonly used commands.

🛠️ Installation and Configuration
Install Git
On Ubuntu/Debian:

bash
Copy
Edit
sudo apt update
sudo apt install git
On macOS (using Homebrew):

bash
Copy
Edit
brew install git
On Windows:

Download and install from https://git-scm.com/download/win

Configure Git
bash
Copy
Edit
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
git config --list
This sets your global username and email for commits and verifies the configuration.

🔁 Basic Git Commands
1. Initialize a Git Repository
bash
Copy
Edit
git init
Creates a new Git repository in your project folder.

2. Add Files to the Staging Area
bash
Copy
Edit
git add filename      # Add a specific file
git add .             # Add all files
3. Commit the Changes
bash
Copy
Edit
git commit -m "Your commit message"
Saves the changes you've added to the staging area.

4. Check the Status
bash
Copy
Edit
git status
Shows the current state of the working directory and staging area.

5. View Commit History
bash
Copy
Edit
git log
Displays a list of all commits in the repository.

6. Connect to a Remote Repository
bash
Copy
Edit
git remote add origin https://github.com/your-username/your-repo.git
Links your local Git repository to a remote GitHub repository.

7. Push Changes to Remote
bash
Copy
Edit
git push -u origin main
Sends your local commits to the remote repository.

8. Pull Changes from Remote
bash
Copy
Edit
git pull origin main
Fetches and integrates changes from the remote repository.
