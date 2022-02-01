output "domain_name" {
  description = "Name of the Domain that is being managed by this component"
  value       = digitalocean_domain.this.name
}

output "id" {
  description = "ID of the Domain that is being managed by this component"
  value       = digitalocean_domain.this.name
}

output "records" {
  description = "List of records that are being managed by this componenet"
  value = [
    for record in digitalocean_record.this : record
  ]
}
