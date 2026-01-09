# DevOps Scripts

## Overview
Collection of small, focused operational scripts and Python utilities for common tasks such as backups, endpoint health checks, log rotation, and basic log analysis.

## Architecture
- Diagram: (optional — add diagram file or link)
- Components:
  - `bash/`: lightweight shell scripts for operational tasks
  - `python/`: Python utilities for checks and analysis
  - `configs/`: YAML configuration files used by scripts

## Tech Stack
- Shell: Bash
- Language: Python 3.11
- Tools: tar, gzip, curl, requests, PyYAML

## How to Run (local)
1. Make bash scripts executable:

```bash
chmod +x bash/*.sh
```

2. Install Python dependencies:

```bash
pip install -r python/requirements.txt
```

3. Edit configuration files in `configs/` (e.g., `app.yaml`) to fit your environment, then run the appropriate script.

## CI/CD
No CI/CD pipeline is configured by default. Recommended pipeline steps:
1. Lint shell scripts (shellcheck) and Python (flake8/ruff)
2. Run Python tests (`pytest`)
3. Optionally build and publish artifacts or container images

## What I Learned
- Keep scripts small and single-responsibility
- Prefer explicit configuration files (YAML) over hard-coded values
- Validate inputs and fail loudly in scripts for reliable automation
