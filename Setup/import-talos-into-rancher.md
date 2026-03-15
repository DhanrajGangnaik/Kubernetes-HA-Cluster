# Goal

Register the Talos workload cluster into Rancher for centralized management.

## Key Issues Faced

- self-signed certificate trust during manifest download
- DNS resolution failure for `rancher.homelab.internal`
- incorrect direct IP usage breaking ingress host routing

## Final Fixes

- downloaded import manifest locally
- restored hostname-based Rancher access
- configured CoreDNS hosts entry for Rancher
- restarted cluster agent
- validated webhook deployment and cluster activation

## Result

The Talos cluster appeared as `Active` in Rancher.