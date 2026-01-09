#!/usr/bin/env bash
set -euo pipefail
# backup.sh - simple backup script
# Usage: ./backup.sh [/path/to/src] [/path/to/dest]

BACKUP_SRC="${1:-/var/www}"
BACKUP_DEST="${2:-/var/backups}"
TIMESTAMP=$(date +"%Y%m%d-%H%M%S")

mkdir -p "${BACKUP_DEST}"

tar -czf "${BACKUP_DEST}/backup-${TIMESTAMP}.tar.gz" -C "$(dirname "${BACKUP_SRC}")" "$(basename "${BACKUP_SRC}")"

echo "Backup saved to ${BACKUP_DEST}/backup-${TIMESTAMP}.tar.gz"