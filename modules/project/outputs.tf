output "id" {
  description = "ID of the project created"
  value       = digitalocean_project.this.id
}

output "name" {
  description = "The Name of the project created"
  value       = digitalocean_project.this.name
}
