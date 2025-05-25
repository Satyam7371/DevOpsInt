# Task 8: Branching, Merging, and Pull Requests

## 📌 Description
This task introduces you to working with branches in Git. You'll create a new branch, make and commit changes, push it to the remote repository, and finally merge it back into the `master` (or `main`) branch using a pull request (on GitHub). You will also learn about different merge types.

---

## 🌿 Types of Merges

### 1. **Fast-Forward Merge**
- Happens when there’s no new commit on the base branch since branching.
- Git just moves the pointer forward.

### 2. **Three-Way Merge**
- Used when both branches have new commits.
- Git creates a new “merge commit” that combines changes.

### 3. **Squash Merge**
- Combines all feature branch commits into a single commit on the target branch.
- Keeps history clean.

### 4. **Rebase (Alternative to Merge)**
- Reapplies commits from one branch onto another base tip.
- Creates linear history (can be risky if used improperly).

---

## 🛠️ Steps to Complete the Task

### 1. **Create a New Branch**
```bash
git checkout -b feature-branch
2. Add and Commit Changes
Make changes or add a file:

bash
Copy
Edit
echo "Feature content" > feature.txt
git add feature.txt
git commit -m "Add feature.txt"
3. Push the New Branch to Remote
bash
Copy
Edit
git push -u origin feature-branch
4. Create a Pull Request (PR)
Go to your GitHub repository.

Click "Compare & pull request" next to your new branch.

Add a description and click "Create pull request".

Review, then click "Merge pull request" to merge into main or master.

5. Clean Up (Optional)
After merging, you can delete the feature branch:

bash
Copy
Edit
git branch -d feature-branch              # delete locally
git push origin --delete feature-branch   # delete from GitHub
✅ Result
You have successfully:

Created a feature branch

Committed and pushed changes

Created and completed a pull request to merge with the main branch
