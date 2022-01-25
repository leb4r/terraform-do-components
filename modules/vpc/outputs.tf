output "created_at" {
  description = "The date and time of when the VPC was created"
  value       = digitalocean_vpc.this.created_at
}

output "default" {
  description = "A boolean indicating whether or not the VPC is the default for the region"
  value       = digitalocean_vpc.this.default
}

output "id" {
  description = "The unique identifier for the VPC"
  value       = digitalocean_vpc.this.id
}

output "urn" {
  description = "The uniform resource name (URN) for the VPC"
  value       = digitalocean_vpc.this.urn
}
