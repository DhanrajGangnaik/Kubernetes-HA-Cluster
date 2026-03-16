#!/bin/bash

echo "Prometheus Pods"
kubectl get pods -n cattle-monitoring-system

echo ""
echo "Prometheus Service"
kubectl get svc -n cattle-monitoring-system

echo ""
echo "Node Exporter"
kubectl get daemonset -n cattle-monitoring-system