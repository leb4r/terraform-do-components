resource "digitalocean_droplet" "this" {
  name              = var.name
  image             = var.image
  region            = var.region
  size              = var.size
  backups           = var.backups
  droplet_agent     = var.droplet_agent
  graceful_shutdown = var.graceful_shutdown
  monitoring        = var.monitoring
  ssh_keys          = var.ssh_keys
  vpc_uuid          = var.vpc_uuid
  ipv6              = var.ipv6
}

resource "digitalocean_project_resources" "this" {
  count   = var.project_id != null ? 1 : 0
  project = var.project_id
  resources = [
    digitalocean_droplet.this.urn
  ]
}
