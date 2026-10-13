# IIB Assignment 2

**Module:** DS1202 ICT Infrastructure Basics, Politeknik Brunei (Semester 1, 2026/2027)
**Assessment:** AS02 – Server Access & Git Proficiency

## 1. Project Overview

This project covers three things: passwordless SSH access to the lab Linux server, a shell script (`sysinfo.sh`) that prints a system-information report, and a full Git workflow (branch, commit, merge, push) published to GitHub.

### What `sysinfo.sh` reports

| Section | Details |
|---|---|
| Hostname | Name of the server |
| OS / Kernel | Distribution name and kernel version |
| Memory usage | Total, used, and free memory |
| Disk usage | Usage per mounted filesystem |
| *(feature-logging)* | <e.g. uptime, CPU load, report saved to `logs/` with a timestamp> |

## 2. Repository/Folder Structure

```
ds1202-project/
├── scripts/
│   └── sysinfo.sh
├── docs/
├── logs/
└── README.md
```

## 3. Setup

Replace `username` and `<lab-server>` with your own account and the lab server address.

### 3.1 Generate an SSH key (Ed25519)

```bash
ssh-keygen -t ed25519 -C "your.email@pb.edu.bn"
```

The key pair is saved to `~/.ssh/id_ed25519` (private) and `~/.ssh/id_ed25519.pub` (public).

### 3.2 Copy the public key to the server

```bash
ssh-copy-id username@<lab-server>
```

The public key is then appended to `~/.ssh/authorized_keys` on the server.

### 3.3 Log in without a password

```bash
ssh username@<lab-server>
```

### 3.4 Creating the directory structure and set permissions

```bash
mkdir -p ~/ds1202-project/{scripts,docs,logs}
chmod 755 ~/ds1202-project
```

### 3.5 Making the script executable

```bash
chmod +x ~/ds1202-project/scripts/sysinfo.sh
```

## 4. Running the Script

```bash
~/ds1202-project/scripts/sysinfo.sh
```

<Add one or two lines on where the report is printed and, after the enhancement, where it is saved, e.g. `logs/sysinfo_<timestamp>.log`.>

## 5. Git Workflow

| Step | Command | Purpose |
|---|---|---|
| Initialise | `git init` | Create the repository |
| First commit | `git add . && git commit -m "Add directory structure and sysinfo script"` | Record the baseline |
| Branch | `git switch -c feature-logging` | Work on the enhancement in isolation |
| Enhance and commit | `git commit -am "Add logging section to sysinfo script"` | Edit the script and record the enhancement on the branch |
| Merge | `git switch main` then `git merge feature-logging` | Bring the enhancement into `main` |
| Remote | `git remote add origin git@github.com:<you>/ds1202-project.git` | Link the GitHub repository |
| Push | `git push -u origin main` and `git push origin feature-logging` | Publish `main` and the feature branch |

Merge outcome: <clean merge / conflict in `sysinfo.sh` resolved and committed>.

View the history with:

```bash
git log --graph --oneline --all
```

