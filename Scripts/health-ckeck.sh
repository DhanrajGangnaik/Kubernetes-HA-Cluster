#!/usr/bin/env bash
set -euo pipefail

echo "== Nodes =="
kubectl get nodes -o wide

echo
echo "== All Pods =="
kubectl get pods -A

echo
echo "== Services =="
kubectl get svc -A

echo
echo "== Ingresses =="
kubectl get ingress -A