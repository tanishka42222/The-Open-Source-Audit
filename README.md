# OSS Audit — Firefox
**Student Name:** Tanishka Sharma  
**Registration Number:** 24BCE11422
**Course:** CSE0002 — Open Source Software | VIT Bhopal University  
**Software Audited:** Firefox Web Browser (Mozilla Public License 2.0)  
**Repository:** `oss-audit-24BSA10141`

---

## About This Project

This repository contains the five shell scripts for the Open Source Software Capstone Project — *The Open Source Audit*. The project audits **Firefox**, examining its origin story (Netscape open-sourcing in 1998, the Browser Wars), Mozilla Public License 2.0, philosophy, Linux footprint, FOSS ecosystem, and a comparison with proprietary alternatives (Google Chrome).

---

## Repository Contents

| File | Description |
|------|-------------|
| `script1_system_identity.sh` | Displays system info: Firefox version, distro, kernel, uptime, user, and MPL 2.0 license details |
| `script2_package_inspector.sh` | Checks if a FOSS package is installed, shows version/metadata, and prints a philosophy note (case statement) |
| `script3_disk_permission_auditor.sh` | Audits system directories and Firefox-specific paths: permissions, ownership, and disk usage using a for loop |
| `script4_log_analyzer.sh` | Reads a log file line by line, counts keyword matches, and displays the last 5 matches |
| `script5_manifesto_generator.sh` | Interactively generates and saves a personalised open-source philosophy statement |
| `README.md` | This file |

The project report PDF is submitted separately via the VITyarthi portal.

---

## Environment Requirements

- **OS:** Ubuntu 22.04 LTS or any Debian-based Linux
- **Shell:** Bash (version 4.0+)
- **Dependencies:** `firefox`, `uname`, `whoami`, `uptime`, `dpkg`, `apt-cache`, `ls`, `du`, `grep`, `awk`, `cut`, `date` — install Firefox with `sudo apt install firefox` or `snap install firefox`
- **Permissions:** Script 4 may require `sudo` to read `/var/log/syslog`

---

## Setup Instructions

### Step 1 — Clone the repository
```bash
git clone https://github.com/[your-github-username]/oss-audit-24BSA10141.git
cd oss-audit-24BSA10141
```

### Step 2 — Make all scripts executable
```bash
chmod +x *.sh
```

---

## Running Each Script

### Script 1 — System Identity Report
Displays system info and Firefox license details.
```bash
./script1_system_identity.sh
```
**Expected output:** Firefox version, distribution name, kernel, uptime, user info, date/time, and MPL 2.0 license statement.

---

### Script 2 — FOSS Package Inspector
Checks if a package is installed and prints a philosophy note.
```bash
# Inspect the firefox package (default)
./script2_package_inspector.sh

# Inspect a specific package
./script2_package_inspector.sh firefox
./script2_package_inspector.sh vlc
./script2_package_inspector.sh python3
```
**Expected output:** Package install status, version, and a philosophy note about the package.

> **Note:** If Firefox is installed as a Snap, dpkg may not find it. The script handles this with a Snap fallback check.

---

### Script 3 — Disk and Permission Auditor
Audits system directories and Firefox-specific installation paths.
```bash
./script3_disk_permission_auditor.sh
```
**Expected output:** Formatted table of directories with permissions, owner, group, and size. Also checks `/snap/firefox/current/`, `/etc/firefox`, `~/.mozilla/firefox`, and `~/snap/firefox`.

---

### Script 4 — Log File Analyzer
Reads a log file and counts keyword matches.
```bash
# Analyse syslog for 'firefox' entries (default)
sudo ./script4_log_analyzer.sh /var/log/syslog firefox

# Search for Snap update events
sudo ./script4_log_analyzer.sh /var/log/syslog snap

# Custom keyword
sudo ./script4_log_analyzer.sh /var/log/syslog mozilla
```
**Expected output:** Match count and the last 5 matching lines.

> **Note:** May require sudo or `adm` group membership: `sudo usermod -aG adm $USER`

---

### Script 5 — Open Source Manifesto Generator
Interactive — asks three questions and saves a personalised manifesto.
```bash
./script5_manifesto_generator.sh
```
**Follow the prompts:**
1. Enter a tool you use every day (e.g., `Firefox`, `bash`, `Python`)
2. Enter one word for what the open web means (e.g., `equality`, `freedom`)
3. Enter something you would build and share (e.g., `a privacy dashboard`)

**Expected output:** A manifesto printed to the terminal and saved as `manifesto_[yourusername].txt`.

---

## Troubleshooting

| Issue | Solution |
|-------|----------|
| `Permission denied` on script | Run `chmod +x scriptname.sh` |
| `firefox: command not found` | Install with `sudo apt install firefox` or `snap install firefox` |
| Script 1 shows "Firefox not found" | Try `snap run firefox --version` — Script 1 checks both paths |
| Log file not found (Script 4) | Script auto-detects fallbacks; or try `./script4_log_analyzer.sh /var/log/dpkg.log firefox` |
| `dpkg: not found` (Script 2) | Replace `dpkg -l` with `rpm -qa` for RPM-based systems |
| Script outputs nothing | Ensure Bash is your shell: `echo $SHELL` should show `/bin/bash` |

---

## License

These scripts are written for educational purposes as part of the VIT Bhopal OSS course. They may be freely used and modified.

---

*VIT Bhopal University | CSE0002 — Open Source Software | Capstone Project*
