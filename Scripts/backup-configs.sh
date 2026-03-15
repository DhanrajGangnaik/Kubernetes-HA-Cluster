#!/usr/bin/env bash
set -euo pipefail

BACKUP_DIR="${1:-./backup}"
mkdir -p "$BACKUP_DIR"

cp -r ~/.kube "$BACKUP_DIR/" 2>/dev/null || true
cp -r ~/.talos "$BACKUP_DIR/" 2>/dev/null || true
cp -r ~/.ssh "$BACKUP_DIR/" 2>/dev/null || true

echo "Backup completed at: $BACKUP_DIR"