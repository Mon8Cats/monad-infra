# Summary

## Connect to cluster

```bash
# configure cluster credential
gcloud container clusters get-credentials 
    [cluster-name] 
    --region us-central1
    --project [project_id]

kubectl version # client version, server version, kustomize version
kubectl get nodes 
kubectl get nodes - o wide

kubectl get namespaces
kubectl create namespace my-namespace
kubectl apply -f my-resources-yaml/  # apply all files in this folder?
kubectl get deploy 
kubectl get pods
kubectl describe [my-pod-name]
kubectl get svc # type, cluster-ip, external-ip, ports, 
kubectl delete -f my-resources-yaml/

terraform state list
rm -rf .terraform 


provider "kubernetes" {
  host                   = "https://${google_container_cluster.primary.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(google_container_cluster.primary.master_auth.0.cluster_ca_certificate)
}

data "google_client_config" "default" {}


```

## Container Cluster

- A top-level k8s resources that manager the entire cluster environment.
- It consists of a control plane, node pools, networking and security configuration.

## Container Node Pool

- A set of VM instances (nodes) that share the same configuration within a cluster.

## Kustomizer

- It allows me to customize K8s manifests without modifying the original YAML files by applying overlays on base configuration.
- deployment.yaml, kustomization.yaml, 
- kubectl apply -k .
- Kustomize vs Helm? 

## Steps

- VCP, Subnet, Firewalls
- Service account
- Container Cluster, Container Node Pool
- user -> kubectl -> Kube API Server Public IP -> Node Public IP (kubectl)
- Cluster: External endpoint = Public IP

## GKE Cluster, Namespace

- Namespace is a logical partition within a K8s cluster that allow me to organize, isolate, and manage resources.
- default, kube-system, kube-public, kube-node-lease
- Deploying a resource to a namespace: metadata: namespace: [my-name-space]
- namespace: logical isolation within the cluster
- node pool: physical separation of worker nodes

## Deployment, Service

- deployment, replica set, pods
- load balancer service
- user -> internet ->
  - GKE cluster: load balancer service (-> service port -> target port) ->
  - GKE worker node: pod, workload (-> container port)  
- selector (in service) -> selector : match labels (in pod)


## Kubernetes Hierarchy in GKE

- Cluster: 
  - control plane, worker nodes
- Nodes (worker nodes)
  - master node, worker nodes
  - kubelet, container runtime, kube proxy
- Pods
  - the smallest deployable unit
  - shares network and storage
- Containers
  - a lightweight, standalone executable package tht includes an application and its dependencies
  - container runtime:
  - lifecycle
- workloads:
  - an application running on Kubernetes
  - deployment, statefulset, daemonset, job, cronjob
- Cluster
  - Nodes (Worker Machines)
    - Pods (Scheduling Unit)
        - Containers (Application Process)
        - Storage & Network Configurations
    - DaemonSets (Node-wide processes)
    - StatefulSets (Persistent Workloads)
    - Deployments (Stateless Workloads)
    - Jobs / CronJobs (Task-based Workloads)


## Kubernetes Provider 

- It is used to manage Kubernetes resources (Pods, Deployments, Services, etc.) within a GKE cluster.
- It allows Terraform to interact with the Kubernetes API after the GKE cluster has been created. 


## Why Use the Kubernetes Provider in Terraform?

- Infrastructure as Code: Automate cluster and workload deployment.
- Consistency: Enforce Kubernetes resource configurations via Terraform.
- Security: Control access to Kubernetes resources using IAM.
- Scalability: Manage large-scale Kubernetes clusters with Terraform modules.

## Request Pipeline

- External Request => Load Balancer 
- => Gateway API => Route (Ingress/HttpRoute) 
- => Kubernetes Service => Pod (Application)
- (1) A user or API Client makes a request.
- (2) The request resolves via DNS to a public ip.
- (3) The load balancer distributes requests across K8s nodes.
- (4) Gateway API allows better traffic management, multi-cluster routing.
- (5) K8s routing defines HTTP(s) routing inside the cluster.
- (6) K8s service forwards traffic to backend pods.
