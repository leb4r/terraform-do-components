output "name" {
  description = "The name of the certificate being managed by this component."
  value       = digitalocean_certificate.this.name
}

output "id" {
  description = "The ID of the certificate being managed by this component."
  value       = digitalocean_certificate.this.id
}

output "uuid" {
  description = "The UUID of the certificate being managed by this component."
  value       = digitalocean_certificate.this.uuid
}
