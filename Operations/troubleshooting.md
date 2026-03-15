# Troubleshooting

## Issue: kubectl using localhost:8080
Cause: kubeconfig missing.
Fix: restore correct kubeconfig.

## Issue: kubeconfig pointed to worker node
Cause: wrong API server endpoint.
Fix: use control plane endpoint.

## Issue: Rancher chart incompatible with Talos Kubernetes version
Cause: Rancher chart required lower Kubernetes version.
Fix: deploy separate RKE2 management cluster.

## Issue: imported cluster agent failed to register
Cause: DNS resolution failure for Rancher hostname.
Fix: CoreDNS hosts entry and hostname-based access restored.

## Issue: Prometheus failed to start
Cause: YAML indentation error in `prometheus.yml`.
Fix: corrected `static_configs` and `labels` indentation.

## Issue: NodePort had no endpoints
Cause: incorrect selector.
Fix: patch existing service instead of creating a mismatched one.