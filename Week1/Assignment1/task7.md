# Task 7: Setup Remote Repository, Add File, Commit and Push to Master

## 📌 Description
In this task, you’ll learn how to connect your local Git project to a remote repository like GitHub, add a file, commit the changes, and push the commit to the `master` (or `main`) branch. This is a fundamental part of using Git and GitHub for collaborative development and version control.

---

## 🧰 Prerequisites
- Git should be installed and configured.
- A GitHub account.
- A GitHub repository already created.

---

## 🛠️ Steps to Complete the Task

### 1. **Create a Local Git Repository**
If you don’t already have a local repo, create one and initialize Git:
```bash
mkdir my-project
cd my-project
git init
2. Add a File to the Repository
Create a new file:

bash
Copy
Edit
echo "# My First Commit" > README.md
Stage the file:

bash
Copy
Edit
git add README.md
3. Commit the Changes
bash
Copy
Edit
git commit -m "Add README.md"
This saves your changes to the local repository.

4. Link to a Remote Repository
Replace the URL with your own GitHub repo link:

bash
Copy
Edit
git remote add origin https://github.com/your-username/your-repo.git
You can verify it with:

bash
Copy
Edit
git remote -v
5. Push to the Master (or Main) Branch
bash
Copy
Edit
git push -u origin master
Or if your default branch is main:

bash
Copy
Edit
git push -u origin main
💡 The -u flag sets origin master/main as the default upstream branch.

✅ Result
You now have:

A local Git repository.

A file added and committed.

The changes pushed to the master/main branch of your remote GitHub repository.

