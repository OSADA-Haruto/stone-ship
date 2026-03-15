# Practice Guide

> 🇯🇵 [日本語版はこちら](onboarding.md)

This document explains the workflow for contributing to the stone-ship project,
covering Git / GitHub basics, how to practice with your own Fork, and how to submit your work to the main repository.

---

## Table of Contents

- [Practice Guide](#practice-guide)
  - [Table of Contents](#table-of-contents)
  - [Purpose of This Guide](#purpose-of-this-guide)
  - [Workflow Overview](#workflow-overview)
  - [Terminology](#terminology)
  - [Step 1 — Install Prerequisites](#step-1--install-prerequisites)
  - [Step 2 — Fork the Repository](#step-2--fork-the-repository)
  - [Step 3 — Clone Your Fork Locally](#step-3--clone-your-fork-locally)
  - [Step 4 — Register upstream (the main repository)](#step-4--register-upstream-the-main-repository)
  - [Step 5 — Create a Practice Branch and Work](#step-5--create-a-practice-branch-and-work)
    - [Create a practice branch](#create-a-practice-branch)
    - [Writing and editing](#writing-and-editing)
    - [Commit](#commit)
    - [Push to your Fork](#push-to-your-fork)
  - [Step 6 — Build and Verify](#step-6--build-and-verify)
  - [Step 7 — Sync with upstream Updates](#step-7--sync-with-upstream-updates)
  - [Step 8 — Contributing: Send a Pull Request](#step-8--contributing-send-a-pull-request)
    - [1. Rename your branch to follow the conventions](#1-rename-your-branch-to-follow-the-conventions)
    - [2. Create a PR on GitHub](#2-create-a-pr-on-github)
  - [FAQ](#faq)

---

## Purpose of This Guide

stone-ship is a repository where multiple authors collaboratively write a textbook in LaTeX.
Editing the main repository (`bin-utokyo/stone-ship`, referred to as "upstream") directly risks
affecting other members with unfinished work or mistakes.

This project therefore adopts a **Fork-based workflow**.
You practice freely in your own copy (Fork) of the upstream repository,
and once your work is complete, you send a pull request (PR) to the upstream.
This workflow is identical to the standard contribution process used in open-source projects.

```
[upstream] bin-utokyo/stone-ship          ← do not edit directly
                │
                │  Fork (copy on GitHub)
                ▼
[you] <yourID>/stone-ship                 ← practice freely here
                │
                │  Pull Request (propose when ready)
                ▼
[upstream] bin-utokyo/stone-ship          ← merged after review
```

---

## Workflow Overview

| Step | Where | What |
|---|---|---|
| 1 | Local | Install prerequisites |
| 2 | GitHub | Fork the upstream to create your own repository |
| 3 | Local | Clone your Fork |
| 4 | Local | Register upstream as a remote |
| 5 | Local | Create a branch and write / practice |
| 6 | Local | Build and check the PDF |
| 7 | Local | Sync updates from upstream into your Fork |
| 8 | GitHub | Send a pull request to upstream |

---

## Terminology

| Term | Meaning |
|---|---|
| **Repository (repo)** | A place that stores files and their change history |
| **Fork** | Copying another person's repository to your own GitHub account |
| **Clone** | Copying a GitHub repository to your local machine |
| **origin** | The remote you cloned from (= your Fork) |
| **upstream** | The original repository you forked from (= the main repository) |
| **Branch** | A diverging line of change history, used to isolate independent work |
| **Commit** | Recording changes to the repository |
| **Push** | Sending local commits to a remote repository |
| **Pull Request (PR)** | A proposal to have your changes incorporated into another repository |

---

## Step 1 — Install Prerequisites

Refer to the "Prerequisites" section of [CONTRIBUTING.en.md](CONTRIBUTING.en.md) and install the following.

| Software | Role |
|---|---|
| **TeX Live** (full installation recommended) | LaTeX compilation |
| **Git** | Version control |

After installation, verify that everything works:

```bash
# macOS / Linux
git --version
platex --version
bibtex --version
dvipdfmx --version
```

```powershell
# Windows (PowerShell)
git --version
platex --version
bibtex --version
dvipdfmx --version
```

If all commands return version numbers, you are ready to proceed.

---

## Step 2 — Fork the Repository

1. Open the upstream repository (`https://github.com/bin-utokyo/stone-ship`) while logged in to GitHub.
2. Click the **Fork** button in the upper-right corner.
3. Confirm that **Owner** shows your own account, then click **Create fork**.

Once complete, your repository will be available at `https://github.com/<yourGitHubID>/stone-ship`.

> **Note**: A Fork is an independent copy under your account.
> No matter how many changes or commits you make inside your Fork, the upstream is completely unaffected.

---

## Step 3 — Clone Your Fork Locally

Clone your Fork using its URL (`https://github.com/<yourGitHubID>/stone-ship.git`).

```bash
# Replace <yourGitHubID> with your actual GitHub ID
git clone https://github.com/<yourGitHubID>/stone-ship.git
cd stone-ship
```

After cloning, check the registered remotes:

```bash
git remote -v
```

If `origin` points to your Fork, everything is correct:

```
origin  https://github.com/<yourGitHubID>/stone-ship.git (fetch)
origin  https://github.com/<yourGitHubID>/stone-ship.git (push)
```

---

## Step 4 — Register upstream (the main repository)

Add the upstream repository as a remote named `upstream` so you can pull in future updates.

```bash
git remote add upstream https://github.com/bin-utokyo/stone-ship.git
```

Verify again:

```bash
git remote -v
```

Both `origin` (your Fork) and `upstream` (the main repository) should appear:

```
origin    https://github.com/<yourGitHubID>/stone-ship.git (fetch)
origin    https://github.com/<yourGitHubID>/stone-ship.git (push)
upstream  https://github.com/bin-utokyo/stone-ship.git (fetch)
upstream  https://github.com/bin-utokyo/stone-ship.git (push)
```

> **Note**: Treat `upstream` as read-only.
> Attempting to push directly to `upstream` will fail because you do not have write access.

---

## Step 5 — Create a Practice Branch and Work

Keep the `main` branch as a clean sync point with upstream.
Always do your work on a separate branch.

### Create a practice branch

```bash
# Make sure you are on the main branch
git checkout main

# Create and switch to a practice branch (any descriptive name is fine)
git checkout -b practice/sample-chapter
```

### Writing and editing

Use `src/chapters/sample.tex` as a reference when editing or adding chapter files.
For detailed LaTeX conventions, see [style-guide.en.md](style-guide.en.md).

### Commit

```bash
# Stage the changed files
git add src/chapters/practice.tex src/bibliography/practice.bib

# Commit with a concise message
git commit -m "Add practice chapter: sample chapter exercise"
```

### Push to your Fork

```bash
git push origin practice/sample-chapter
```

> **Feel free to commit and push as many times as you like during practice.**
> Changes inside your Fork never reach the upstream.

---

## Step 6 — Build and Verify

Run the following from the repository root:

```bash
# macOS / Linux
zsh utility/compile.sh
```

```powershell
# Windows (PowerShell)
.\utility\compile.ps1
```

> **Windows first run**: You may need to configure the execution policy.
> See the "Building" section of [CONTRIBUTING.en.md](CONTRIBUTING.en.md) for details.

If the build succeeds, `build/main.pdf` will be generated. Open it to check the output.

For build errors, refer to the "Common errors" section in [CONTRIBUTING.en.md](CONTRIBUTING.en.md).

---

## Step 7 — Sync with upstream Updates

When the upstream is updated (e.g., another member merges a chapter),
you need to pull those changes into your Fork.

```bash
# Fetch the latest state of upstream
git fetch upstream

# Switch to main
git checkout main

# Merge upstream/main into your local main
git merge upstream/main

# Push the updated main to your Fork
git push origin main
```

To bring these changes into your working branch as well:

```bash
# Switch to your working branch
git checkout practice/sample-chapter

# Merge main into your branch
git merge main
```

---

## Step 8 — Contributing: Send a Pull Request

**Contributing means taking the changes you have completed on your Fork and proposing to apply them to the upstream (`bin-utokyo/stone-ship`) `main` branch via a pull request (PR).**
Your changes are only reflected in the upstream after a reviewer approves the PR and it is merged.
During practice, no matter how much you commit and push to your Fork, nothing reaches the upstream — so you can work freely.

Once your writing is complete and you are ready to propose it to the upstream, follow the steps below.

> **Before sending a PR, confirm that**:
> - The build completes successfully locally (`build/main.pdf` is generated)
> - You have followed the conventions in [style-guide.en.md](style-guide.en.md)
> - You have satisfied all checklist items in [CONTRIBUTING.en.md](CONTRIBUTING.en.md)

### 1. Rename your branch to follow the conventions

For a real contribution, align your branch name with the naming rules in [CONTRIBUTING.en.md](CONTRIBUTING.en.md).

| Purpose | Branch name format | Example |
|---|---|---|
| Writing / editing a chapter | `chapter/<number or name>` | `chapter/2`, `chapter/demand` |

```bash
# Rename a practice branch to a production branch name
git checkout -b chapter/2 practice/sample-chapter
git push origin chapter/2
```

### 2. Create a PR on GitHub

1. Open your Fork (`https://github.com/<yourGitHubID>/stone-ship`).
2. Click **Compare & pull request** (shown immediately after a push).
   If it is not visible, go to the **Pull requests** tab and click **New pull request**.
3. Set **base repository** to `bin-utokyo/stone-ship` and **base** to `main`.
4. Set **head repository** to your Fork and **compare** to your working branch.
5. Fill in the PR template: summary, type of change, and checklist.
6. Click **Create pull request** to submit.

> If a reviewer requests changes, simply add more commits to the same branch and push to your Fork —
> the PR will be updated automatically.

---

## FAQ

**Q. I accidentally committed to the `main` branch during practice.**

A. A commit to your Fork's `main` does not affect the upstream at all.
However, it can complicate syncing with `upstream/main`. Fix it with:

```bash
# Undo the last commit (changes remain in the working tree)
git reset HEAD~1
```

---

**Q. The upstream was updated significantly after I forked it. What should I do?**

A. Follow the procedure in [Step 7](#step-7--sync-with-upstream-updates) to merge `upstream/main`.
If conflicts arise, resolve them manually in the affected files, then commit.

---

**Q. I want to show my work to someone.**

A. Share your Fork's URL (`https://github.com/<yourGitHubID>/stone-ship`) and they will be able to
browse files and commit history on GitHub.
If you have pushed your work, they can also check build results via Actions (if configured).

---

**Q. I want to clean up old branches.**

A. You can delete practice branches from both local and remote:

```bash
# Delete a local branch
git branch -d practice/sample-chapter

# Delete the branch from your Fork (origin)
git push origin --delete practice/sample-chapter
```
