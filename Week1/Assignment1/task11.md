# Task 11: Practice More Git Commands

## 📌 Description
This task is focused on exploring and practicing additional Git commands that go beyond the basics. These commands are especially helpful for debugging, inspecting repositories, and improving your workflow. Mastering them will help you work more efficiently and confidently with Git.

---

## 🧪 Advanced Git Commands to Practice

### 1. **Check Remote URLs**
```bash
git remote -v
Shows the remote repository URLs associated with your local repo.

2. Show Commit History in One Line
bash
Copy
Edit
git log --oneline
Gives a concise view of commit history.

3. Show Branches
bash
Copy
Edit
git branch         # List local branches
git branch -r      # List remote branches
git branch -a      # List all branches
4. Rename a Branch
bash
Copy
Edit
git branch -m old-branch-name new-branch-name
5. Delete a Branch
bash
Copy
Edit
git branch -d branch-name          # Delete local branch
git push origin --delete branch-name  # Delete remote branch
6. View Differences Between Commits
bash
Copy
Edit
git diff                            # See unstaged changes
git diff --staged                   # See staged changes
git diff commit1 commit2            # See diff between two commits
7. Stash Changes
bash
Copy
Edit
git stash                # Temporarily saves uncommitted changes
git stash list           # View stashes
git stash apply          # Re-apply stashed changes
git stash drop           # Delete a stash
8. Tagging a Commit
bash
Copy
Edit
git tag v1.0.0
git push origin v1.0.0
Useful for marking release points (like v1.0, v2.0 etc.).

9. Amend the Last Commit
bash
Copy
Edit
git commit --amend -m "Updated commit message"
10. Blame a File
bash
Copy
Edit
git blame filename
Shows who made each change to a file line-by-line — useful for tracking down bugs.

