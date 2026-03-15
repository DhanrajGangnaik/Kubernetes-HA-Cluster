## Steps Performed

1. generated Talos machine configs
2. configured control plane and worker node IPs
3. bootstrapped Talos cluster
4. retrieved kubeconfig
5. verified node readiness

## Validation Commands

```bash
kubectl get nodes
talosctl health