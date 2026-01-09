# Bash Scripts

## Overview
Small, focused Bash scripts for common operational tasks: backups, HTTP health checks, and log rotation.

## Architecture
- Diagram: (optional)
- Components:
  - `backup.sh` — creates a tar.gz archive of a given path
  - `healthcheck.sh` — checks an HTTP endpoint and returns exit codes suitable for monitoring
  - `rotate_logs.sh` — rotates and compresses log files and retains recent archives

## Tech Stack
- Bash (POSIX-compatible)
- Core utilities: tar, gzip, find, cron (optional)

## How to Run (local)
1. Make scripts executable:

```bash
chmod +x bash/*.sh
```

2. Run (example):

```bash
./bash/backup.sh /var/log /backups/logs-$(date +%F).tar.gz
```

3. Integrate into cron/systemd timers as needed.

## CI/CD
No CI configured. Recommended checks:
- Shellcheck linting
- Unit-style checks or dry-runs where possible

## What I Learned
- Prefer idempotent operations and explicit error codes
- Validate inputs and avoid destructive defaults
- Keep scripts small and well-documented

Files:

- `backup.sh` — creates a tar.gz archive of a given path
- `healthcheck.sh` — checks an HTTP endpoint and returns exit codes suitable for monitoring
- `rotate_logs.sh` — rotates and compresses log files and retains recent archives

Usage: make the scripts executable (`chmod +x *.sh`) and adapt paths as needed.