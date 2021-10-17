output "domain_name" {
  description = "Name of teh Domain that was associated with DigitalOcean"
  value       = digitalocean_domain.this.name
}
