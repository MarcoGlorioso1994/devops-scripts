# bash/ 📁

This folder contains small operational bash scripts useful for backups, health checks and log rotation.

Files:

- `backup.sh` — create a simple tar.gz backup of a path.
- `healthcheck.sh` — check an HTTP endpoint and return a suitable exit code for monitoring.
- `rotate_logs.sh` — rotate and compress log files, keep recent backups.

Usage: make the scripts executable (`chmod +x *.sh`) and adapt paths as needed.