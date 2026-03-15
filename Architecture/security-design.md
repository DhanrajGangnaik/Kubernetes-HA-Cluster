# Security Design

## Security Objectives

- reduce direct exposure of services
- centralize service access through edge proxy and DNS
- separate management and workload clusters
- restrict access to internal-only services where possible

## Current Controls

- internal DNS names only
- NGINX edge proxy as controlled entry point
- Rancher management cluster separated from Talos workload cluster
- Prometheus exposed intentionally via controlled route
- cluster configs stored outside the cluster and version-controlled selectively

## Future Improvements

- TLS on all internal services
- SSO / OIDC integration
- secrets management
- network policies
- backup encryption