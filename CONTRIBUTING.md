# Contributing to the Kalamazoo Valley Community College Computer Lab Scripts

We appreciate your interest in our publicly available lab script repository! This repository is maintained primarily to support the technicians and staff of **Kalamazoo Valley Community College**.

-----

## Important Contribution Policy

This repository is **publicly available** for transparency and sharing, and anyone is welcome to **fork** and use the scripts in their own environment.

**However, we are currently only considering Pull Requests (PRs) from authorized Kalamazoo Valley Community College technicians and IT staff.**

### If You Are an External User:

  * **Feel free to Fork!** If you like the repository, please fork it to your own GitHub account (`YourName/lab-scripts`) and maintain your own version for your institution.
  * We generally **will not merge** external feature requests or scripts.

### If You Are an Authorized Kalamazoo Valley Community College Technician:

Please follow the standard workflow below to ensure your changes are reviewed, tested, and merged promptly.

-----

## Contribution Workflow (For Authorized Technicians)

We use the standard **fork-and-branch** method for contributions.

### 1. **Sync Your Fork**

Always ensure your local `main` branch is up-to-date with the official upstream repository **before** you start working.

```bash
# Assuming 'upstream' is the official repo:
git checkout main
git pull upstream main
```

### 2. **Create a Feature Branch**

Do not commit directly to `main`. Create a new branch with a clear name (e.g., `fix/power-shell-bug` or `feat/add-new-printer-script`).

```bash
git checkout -b your-descriptive-branch-name
```

### 3. **Commit and Push**

Make your script changes, commit them with a descriptive message, and push the branch to your fork.

```bash
git add .
git commit -m "fix: Corrected drive mapping for new imaging system"
git push origin your-descriptive-branch-name
```

### 4. **Submit a Pull Request (PR)**

1.  Go to the main **Kalamazoo Valley Community College** repository on GitHub.
2.  Click **"New pull request."**
3.  Select your branch to propose your changes.
4.  Provide a clear **Title** (what was changed) and **Description** (why it was changed).
5.  Assign a reviewer from the IT team if necessary.

Thank you for helping us maintain robust computer lab environments!