# Disaster Recovery

## Recovery Priorities

1. restore DNS and edge proxy
2. restore Rancher management cluster access
3. restore Talos kubeconfig and talosconfig
4. verify imported workload cluster state
5. restore monitoring access

## Minimal Recovery Toolkit

- talosconfig
- kubeconfig
- edge proxy configs
- DNS records
- Git repository