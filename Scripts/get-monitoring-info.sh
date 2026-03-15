#!/usr/bin/env bash
set -euo pipefail

echo "== Monitoring Pods =="
kubectl get pods -n cattle-monitoring-system

echo
echo "== Monitoring Services =="
kubectl get svc -n cattle-monitoring-system

echo
echo "== Monitoring Endpoints =="
kubectl get endpoints -n cattle-monitoring-system