#!/usr/bin/env python3
"""
config_loader.py - helper to load YAML config files
"""
import yaml
from pathlib import Path
from typing import Any, Dict


def load_config(path: str) -> Dict[str, Any]:
    p = Path(path)
    with p.open() as fh:
        return yaml.safe_load(fh)


if __name__ == "__main__":
    import sys
    if len(sys.argv) < 2:
        print("Usage: config_loader.py <config.yaml>")
        sys.exit(1)
    cfg = load_config(sys.argv[1])
    print(cfg)