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

output "endpoint" {
  description = "The URL of the API server on the Kubernetes master node"
  sensitive   = true
  value       = digitalocean_kubernetes_cluster.this.kube_config[0].host
}

output "id" {
  description = "The ID of the cluster"
  value       = digitalocean_kubernetes_cluster.this.id
}

output "kube_config" {
  description = "The kubeconfig to use for the cluster"
  sensitive   = true
  value       = digitalocean_kubernetes_cluster.this.kube_config[0].raw_config
}
