#!/usr/bin/env python3
"""
api_checker.py - simple script to check API endpoints

Usage: python api_checker.py configs/app.yaml
"""
import sys
import requests
import yaml


def check_endpoints(config_path: str) -> None:
    with open(config_path) as fh:
        config = yaml.safe_load(fh)

    for name, url in config.get("endpoints", {}).items():
        try:
            r = requests.get(url, timeout=5)
            print(f"{name}: {r.status_code} {r.reason}")
        except Exception as e:
            print(f"{name}: ERROR - {e}")


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: api_checker.py <config.yaml>")
        sys.exit(1)
    check_endpoints(sys.argv[1])