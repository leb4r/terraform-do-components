output "id" {
  description = "The ID of the Droplet"
  value       = digitalocean_droplet.this.name
}

output "image" {
  description = "The image of the Droplet"
  value       = digitalocean_droplet.this.image
}

output "ipv6" {
  description = "Whether IPv6 is enabled"
  value       = digitalocean_droplet.this.ipv6
}

output "ipv6_address" {
  description = "The Public IPv6 address of the Droplet"
  value       = digitalocean_droplet.this.ipv6_address
}

output "ipv4_address" {
  description = "The Public IPv4 address of the Droplet"
  value       = digitalocean_droplet.this.ipv4_address
}

output "ipv4_address_private" {
  description = "The private IPv4 address of the Droplet"
  value       = digitalocean_droplet.this.ipv4_address_private
}

output "locked" {
  description = "Is the Droplet locked"
  value       = digitalocean_droplet.this.locked
}

output "price_hourly" {
  description = "The Droplet's hourly price"
  value       = digitalocean_droplet.this.price_hourly
}

output "price_monthly" {
  description = "The Droplet's monthly price"
  value       = digitalocean_droplet.this.price_monthly
}

output "private_networking" {
  description = "Is private networking enabled for the Droplet"
  value       = digitalocean_droplet.this.private_networking
}

output "region" {
  description = "The region of the Droplet"
  value       = digitalocean_droplet.this.region
}

output "size" {
  description = "The instance size of the Droplet"
  value       = digitalocean_droplet.this.size
}

output "status" {
  description = "The status of the Droplet"
  value       = digitalocean_droplet.this.status
}

output "tags" {
  description = "The tags associated with the Droplet"
  value       = digitalocean_droplet.this.tags
}

output "vcpus" {
  description = "The number of virtual CPU's assigned to the Droplet"
  value       = digitalocean_droplet.this.vcpus
}

output "volume_ids" {
  description = "A list of the block storage volumes attached to the Droplet"
  value       = digitalocean_droplet.this.volume_ids
}

output "urn" {
  description = "The uniform resource name of the Droplet"
  value       = digitalocean_droplet.this.urn
}

output "vpc_uuid" {
  description = "The ID of the VPC where the Droplet will be located"
  value       = digitalocean_droplet.this.vpc_uuid
}
