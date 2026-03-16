#!/bin/bash

echo "Cluster Nodes"
kubectl get nodes -o wide

echo ""
echo "Pods"
kubectl get pods -A

echo ""
echo "Services"
kubectl get svc -A

echo ""
echo "Namespaces"
kubectl get ns