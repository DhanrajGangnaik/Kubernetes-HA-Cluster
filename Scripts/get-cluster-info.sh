#!/usr/bin/env bash
set -euo pipefail

echo "Cluster Info"
kubectl cluster-info

echo
echo "Nodes"
kubectl get nodes -o wide

echo
echo "Namespaces"
kubectl get ns