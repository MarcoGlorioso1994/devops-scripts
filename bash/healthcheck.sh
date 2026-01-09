#!/usr/bin/env bash
set -euo pipefail
# healthcheck.sh - basic healthcheck for an HTTP endpoint
# Usage: ./healthcheck.sh [URL]

URL="${1:-http://localhost:8080/health}"
HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$URL" || true)

if [ "$HTTP_STATUS" -ge 200 ] && [ "$HTTP_STATUS" -lt 400 ]; then
  echo "OK - ${URL} returned ${HTTP_STATUS}"
  exit 0
else
  echo "FAIL - ${URL} returned ${HTTP_STATUS}"
  exit 2
fi