output "created_at" {
  description = "The date and time when the project was created (ISO8601)"
  value       = digitalocean_project.this.created_at
}

output "id" {
  description = "ID of the project created"
  value       = digitalocean_project.this.id
}

output "name" {
  description = "The Name of the project created"
  value       = digitalocean_project.this.name
}

output "owner_id" {
  description = "The ID of the project owner"
  value       = digitalocean_project.this.owner_id
}

output "owner_uuid" {
  description = "The unique universal identifier of the project owner"
  value       = digitalocean_project.this.owner_uuid
}

output "updated_at" {
  description = "The date and time when the project was last updated (ISO8601)"
  value       = digitalocean_project.this.updated_at
}
