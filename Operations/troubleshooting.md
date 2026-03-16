# Troubleshooting Guide

This document records operational issues encountered during the deployment and operation of the Kubernetes HA platform.

Each entry documents:

- issue description
- observed symptoms
- root cause
- resolution steps
- prevention measures

Sensitive details such as IP addresses, endpoints, and credentials are masked using placeholders.

---

# kubectl Connecting to localhost:8080

## Issue

kubectl commands failed to connect to the Kubernetes cluster.

## Symptoms

Running:
```
kubectl get nodes
```
returned:
```
The connection to the server localhost:8080 was refused.
```
## Root Cause

The kubeconfig file was not loaded in the environment, so kubectl attempted to connect to the default localhost endpoint.

## Resolution

Restored the correct kubeconfig and exported the environment variable.

Example:
```
export KUBECONFIG=<KUBECONFIG_PATH>
```

After restoring the configuration, cluster connectivity was verified.
```
kubectl get nodes
```

## Prevention
Always ensure kubeconfig is present and exported when switching systems or terminals.


---

# kubeconfig Pointing to Worker Node

## Issue

kubectl commands were directed to a worker node instead of the control plane endpoint.

## Symptoms

kubectl commands failed intermittently or returned incomplete cluster information.

## Root Cause

The kubeconfig file contained an incorrect Kubernetes API endpoint referencing a worker node instead of the control plane endpoint.

## Resolution

Updated the kubeconfig to reference the control plane endpoint.

Example:

```
server: https://<CONTROL_PLANE_ENDPOINT>
```

Cluster communication was restored.

## Prevention

Ensure kubeconfig references the control plane endpoint or load balancer instead of individual worker nodes.

---

# Rancher Helm Chart Incompatibility

## Issue

Rancher installation failed when deployed directly on the Talos Kubernetes cluster.

## Symptoms

Helm deployment produced compatibility errors indicating the Kubernetes version was unsupported.

## Root Cause

The Rancher Helm chart required a Kubernetes version different from the version running on the Talos cluster.

## Resolution

A dedicated management environment was created to host Rancher separately from the workload cluster.

Deployment flow:
```
Management Cluster
↓
Rancher Server
↓
Imported Talos Cluster
```

This separated the management plane from the workload cluster.

## Prevention

Always verify Helm chart compatibility with the target Kubernetes version before deployment.

---

# Imported Cluster Agent Failed to Register

## Issue

The Rancher cluster import agent failed to register the cluster.

## Symptoms

Cluster remained in "waiting for agent" state in the Rancher UI.

Agent logs indicated hostname resolution errors.

## Root Cause

The Rancher hostname could not be resolved by the cluster DNS configuration.

## Resolution

Added the Rancher hostname to the internal DNS configuration.

Example resolution methods included:

- updating CoreDNS host entries
- configuring internal DNS records
- verifying hostname resolution from cluster nodes

Cluster agent registration completed successfully after DNS correction.

## Prevention

Ensure Rancher hostname resolution is available to all cluster nodes before importing clusters.

---

# Prometheus Failed to Start

## Issue

Prometheus failed to start after configuration changes.

## Symptoms

Prometheus service entered a crash loop.

Logs indicated configuration parsing errors.

## Root Cause

A YAML formatting error existed in the Prometheus configuration file.

Specifically, indentation errors in:
```
static_configs
labels
```

## Resolution

Corrected the YAML structure in the configuration file and validated it using:

```
promtool check config <PROMETHEUS_CONFIG_PATH>
```

Prometheus started successfully after configuration correction.

## Prevention

Always validate Prometheus configuration using `promtool` before restarting the service.

---

# NodePort Service Had No Endpoints

## Issue

A NodePort service was accessible but returned no data.

## Symptoms

Requests to the NodePort returned empty responses or connection failures.

```
curl http://<NODE_ENDPOINT>:<NODEPORT>
```

returned no output.

## Root Cause

The service selector did not match any running pods.

This caused the service to have no active endpoints.

## Resolution

Patched the existing service to use the correct selector instead of creating a new mismatched service.

Verified endpoints using:

```
kubectl get endpoints -n <NAMESPACE>
```

Endpoints appeared correctly after the fix.

## Prevention

Ensure service selectors match pod labels before exposing services.

---

# Kubernetes IP Conflict

## Issue

A new node or VM failed to communicate with cluster services.

## Symptoms

Node could not join the cluster or experienced networking failures.

Network tests such as ping or curl returned inconsistent results.

## Root Cause

The IP address assigned to the node was already allocated to another virtual machine in the infrastructure.

## Resolution

Identified the conflicting system and reassigned a unique IP address.

Verified connectivity after reassignment.

## Prevention

Maintain an infrastructure IP allocation table to prevent address conflicts.

---

# Node Exporter DaemonSet Failed to Deploy

## Issue

Node exporter pods failed to deploy when installed in the monitoring namespace.

## Symptoms

DaemonSet reported zero running pods.

Events indicated PodSecurity policy violations.

## Root Cause

The namespace enforced restrictive PodSecurity settings preventing host-level metrics collection.

Node exporter requires access to host paths such as:

```
/proc
/sys
/
```

## Resolution

Adjusted namespace security configuration to allow node exporter deployment.

Redeployed the DaemonSet.

Verified deployment using:

```
kubectl get pods -n monitoring
```

## Prevention

Verify PodSecurity requirements for system monitoring components before deployment.

---

# Lessons Learned

The following operational practices were reinforced during the deployment process.

- Maintain infrastructure documentation including node roles and network allocations
- Validate configuration files before service restarts
- Separate management plane from workload cluster
- Ensure DNS resolution works across all cluster nodes
- Monitor service selectors and endpoints when exposing services
- Maintain backups of kubeconfig and cluster credentials
- Deploy observability early to simplify debugging
