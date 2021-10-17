resource "digitalocean_domain" "this" {
  name = var.domain_name
}

resource "digitalocean_project_resources" "this" {
  count   = var.project_id != null ? 1 : 0
  project = var.project_id
  resources = [
    digitalocean_domain.this.urn
  ]
}
