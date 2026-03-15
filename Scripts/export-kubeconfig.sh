#!/usr/bin/env bash
set -euo pipefail

OUT_FILE="${1:-./kubeconfig.export}"

cp ~/.kube/config "$OUT_FILE"
echo "Exported kubeconfig to $OUT_FILE"