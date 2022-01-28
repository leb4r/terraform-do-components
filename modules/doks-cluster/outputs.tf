output "ca_certificate" {
  description = "The base64 encoded public certificate for the cluster's certificate authority"
  sensitive   = true
  value       = digitalocean_kubernetes_cluster.this.kube_config[0].cluster_ca_certificate
}

output "client_key" {
  description = "The DigitalOcean API access token used by clients to access the cluster"
  sensitive   = true
  value       = digitalocean_kubernetes_cluster.this.kube_config[0].client_key
}

output "cluster_subnet" {
  description = "The range of IP addresses in the overlay network of the Kubernetes cluster"
  value       = digitalocean_kubernetes_cluster.this.cluster_subnet
}

output "created_at" {
  description = "The date and time when the Kubernetes cluster was created"
  value       = digitalocean_kubernetes_cluster.this.created_at
}

output "endpoint" {
  description = "The URL of the API server on the Kubernetes master node"
  sensitive   = true
  value       = digitalocean_kubernetes_cluster.this.kube_config[0].host
}

output "id" {
  description = "The ID of the cluster"
  value       = digitalocean_kubernetes_cluster.this.id
}

output "ipv4_address" {
  description = "The public IPv4 address of the Kubernetes master node. This will not be set if high availability is configured on the cluster"
  value       = digitalocean_kubernetes_cluster.this.ipv4_address
}

output "kube_config" {
  description = "The kubeconfig to use for the cluster"
  sensitive   = true
  value       = digitalocean_kubernetes_cluster.this.kube_config[0].raw_config
}

output "maintenance_policy" {
  description = "A block representing the cluster's maintenance window. Update will be applied within this window"
  value       = digitalocean_kubernetes_cluster.this.maintenance_policy
}

output "name" {
  description = "The name of the cluster"
  value       = digitalocean_kubernetes_cluster.this.name
}

output "region" {
  description = "The slug identifier for the region where the Kubernetes cluster will be created"
  value       = digitalocean_kubernetes_cluster.this.region
}

output "service_subnet" {
  description = "The range of assignable IP addresses for services running in the Kubernetes cluster"
  value       = digitalocean_kubernetes_cluster.this.service_subnet
}

output "status" {
  description = "A string indicating the current status of the cluster. Potential values include running, provisioning, and errored"
  value       = digitalocean_kubernetes_cluster.this.status
}

output "updated_at" {
  description = "The date and time when the Kubernetes cluster was last updated"
  value       = digitalocean_kubernetes_cluster.this.updated_at
}

output "urn" {
  description = "The uniform resource name (URN) for the Kubernetes cluster"
  value       = digitalocean_kubernetes_cluster.this.urn
}

output "version" {
  description = "The slug identifier of the version of Kubernetes used for the cluster"
  value       = digitalocean_kubernetes_cluster.this.version
}
