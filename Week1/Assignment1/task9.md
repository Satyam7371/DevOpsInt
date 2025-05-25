# Task 9: Undo Last Commit or Remove File from Remote Repository via CLI

## 📌 Description
In this task, you’ll learn how to undo the last commit and how to remove a mistakenly committed file from both your local and remote repository using Git commands via the command line interface (CLI). These are essential recovery operations every developer should be comfortable with.

---

## 🔁 Undoing the Last Commit

### 1. **Undo Last Commit (Keep Changes in Working Directory)**
This is useful if you made a mistake in your last commit but still want to keep the changes:
```bash
git reset --soft HEAD~1
2. Undo Last Commit (Discard Changes)
This will remove the commit and also discard changes:

bash
Copy
Edit
git reset --hard HEAD~1
⚠️ Warning: --hard will permanently delete changes from your working directory. Use carefully.

🗑️ Remove a File from Git and Remote Repo
1. Delete File Locally and Stage the Change
bash
Copy
Edit
git rm filename
2. Commit the Deletion
bash
Copy
Edit
git commit -m "Remove filename from repository"
3. Push the Change to Remote
bash
Copy
Edit
git push origin main
🔁 Replace main with master if that’s your default branch.

🚫 Revert a Commit (without altering history)
Use this when you want to reverse a commit but keep history intact:

bash
Copy
Edit
git revert <commit_hash>
🔍 You can find the commit hash using:

bash
Copy
Edit
git log
✅ Result
You now know how to:

Undo the last commit (soft and hard reset)

Revert a commit

Remove files from local and remote Git repositories
