#!/usr/bin/env bash
set -euo pipefail
# rotate_logs.sh - rotate logs in a directory and keep recent backups
# Usage: ./rotate_logs.sh [LOG_DIR] [KEEP_DAYS]

LOG_DIR="${1:-/var/log/myapp}"
KEEP="${2:-7}"

mkdir -p "$LOG_DIR"
for f in "$LOG_DIR"/*.log; do
  [ -e "$f" ] || continue
  mv "$f" "$f.$(date +%Y%m%d%H%M%S)"
  touch "$f"
  gzip -9 "$f."* || true
done

# remove old backups
find "$LOG_DIR" -name "*.log.*.gz" -type f -mtime +${KEEP} -delete

echo "Rotation complete"