output "vpc_id" {
  description = "ID of the VPC that was created"
  value       = digitalocean_vpc.this.id
}
