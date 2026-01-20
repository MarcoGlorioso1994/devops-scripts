#!/bin/bash

while getopts "s:p:l:" opt; do
  case $opt in
    s) SERVICE_NAME="$OPTARG" ;;
    p) PORT="$OPTARG" ;;
    l) LOG_DIR="$OPTARG" ;;
    *)
      echo "Usage: $0 -s service -p port -l log_dir"
      exit 1
      ;;
  esac
done

LOG_FILE="$LOG_DIR/healthcheck.log"
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

echo "[$TIMESTAMP] Starting health check..." >> "$LOG_FILE"

# Check service status
if pgrep "$SERVICE_NAME" > /dev/null; then
    echo "[$TIMESTAMP] Process $SERVICE_NAME is running" >> "$LOG_FILE"
else
    echo "[$TIMESTAMP] ERROR: Process $SERVICE_NAME is NOT running" >> "$LOG_FILE"
    exit 1
fi

# Check port listening
if ss -lnt | grep -q ":$PORT"; then
    echo "[$TIMESTAMP] Port $PORT is listening" >> "$LOG_FILE"
else
    echo "[$TIMESTAMP] ERROR: Port $PORT is NOT listening" >> "$LOG_FILE"
    exit 2
fi

echo "[$TIMESTAMP] Health check PASSED" >> "$LOG_FILE"
exit 0