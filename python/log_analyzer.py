#!/usr/bin/env python3
"""
log_analyzer.py - basic log analysis

Counts ERROR/WARNING/INFO-like lines and prints a summary.
"""
import sys
from collections import Counter


def analyze_log(path: str) -> Counter:
    counters = Counter()
    with open(path) as fh:
        for line in fh:
            if "ERROR" in line:
                counters["ERROR"] += 1
            elif "WARNING" in line:
                counters["WARNING"] += 1
            else:
                counters["INFO"] += 1
    return counters


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: log_analyzer.py <logfile>")
        sys.exit(1)
    counts = analyze_log(sys.argv[1])
    for k, v in counts.items():
        print(f"{k}: {v}")