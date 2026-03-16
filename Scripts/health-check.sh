#!/bin/bash

echo "Checking node health"
kubectl get nodes

echo ""
echo "Checking system pods"
kubectl get pods -n kube-system

echo ""
echo "Checking monitoring stack"
kubectl get pods -n cattle-monitoring-system