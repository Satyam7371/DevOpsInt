# Task 10: Branching, Merging, and Resolving Merge Conflicts in Git

## 📌 Description
In this task, you'll explore Git's powerful branching and merging capabilities, and learn how to resolve merge conflicts when they occur. Branching allows developers to work on new features without affecting the main codebase, while merging brings those changes back into the main branch. Merge conflicts happen when changes from different branches overlap and Git can't automatically decide which changes to keep.

---

## 🌿 Branching and Merging Overview

### 1. **Create a New Branch**
```bash
git checkout -b feature-branch
2. Make Changes and Commit
bash
Copy
Edit
echo "New feature" > feature.txt
git add feature.txt
git commit -m "Add feature"
3. Switch Back to Main Branch
bash
Copy
Edit
git checkout main
4. Merge the Feature Branch
bash
Copy
Edit
git merge feature-branch
⚔️ Merge Conflicts
When Do Conflicts Occur?
Conflicts happen when:

Two branches have changes in the same line of a file.

One branch deletes a file that another branch edits.

🧩 Resolving Merge Conflicts
1. Attempt the Merge
bash
Copy
Edit
git merge feature-branch
If there's a conflict, Git will output something like:

pgsql
Copy
Edit
Auto-merging file.txt
CONFLICT (content): Merge conflict in file.txt
2. Open the Conflicted File
Git will mark conflicts like this:

diff
Copy
Edit
<<<<<<< HEAD
This is from main branch
=======
This is from feature branch
>>>>>>> feature-branch
Manually edit to resolve:

text
Copy
Edit
This is the final merged version.
3. Stage the Resolved File
bash
Copy
Edit
git add file.txt
4. Complete the Merge
bash
Copy
Edit
git commit
✅ Best Practices for Merging
Always pull latest changes before merging:

bash
Copy
Edit
git pull origin main
Communicate with your team about large changes.

Keep commits small and focused to make conflict resolution easier.

