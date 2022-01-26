output "id" {
  description = "The ID of the Load Balancer"
  value       = digitalocean_loadbalancer.this.id
}

output "ip" {
  description = "The IP of the Load Balancer"
  value       = digitalocean_loadbalancer.this.ip
}

output "name" {
  description = "The Name of the Load Balancer"
  value       = digitalocean_loadbalancer.this.name
}

output "region" {
  description = "The region of the Load Balancer"
  value       = digitalocean_loadbalancer.this.region
}

output "project" {
  description = "ID of the project the Load Balancer belongs to"
  value       = var.project_id != null ? join("", digitalocean_project_resources.this[*].project) : null
}

output "urn" {
  description = "The uniform resource name for the Load Balancer"
  value       = digitalocean_loadbalancer.this.urn
}
