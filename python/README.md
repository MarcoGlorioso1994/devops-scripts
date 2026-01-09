# Python Utilities

## Overview
Python utilities for operational checks and lightweight log/config analysis.

## Architecture
- Diagram: (optional)
- Components:
  - `api_checker.py` — verifies configured API endpoints and reports status
  - `config_loader.py` — helper to load YAML configuration files
  - `log_analyzer.py` — summarizes and extracts insights from log files

## Tech Stack
- Python 3.11
- Libraries: `requests`, `PyYAML`

## How to Run (local)
1. Install dependencies:

```bash
pip install -r python/requirements.txt
```

2. Run examples:

```bash
python python/api_checker.py --config configs/app.yaml
python python/log_analyzer.py /var/log/myapp.log
```

## CI/CD
No CI configured. Recommended steps:
- Run Python linter (ruff/flake8)
- Run tests (pytest)

## What I Learned
- Keep utility scripts idempotent and config-driven
- Use small, focused modules to make testing easy
- Favor readable CLI interfaces with clear exit codes