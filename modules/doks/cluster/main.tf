data "digitalocean_kubernetes_versions" "this" {
  version_prefix = var.version_prefix
}

resource "digitalocean_kubernetes_cluster" "this" {
  name          = var.name
  region        = var.region
  version       = data.digitalocean_kubernetes_versions.this.latest_version
  vpc_uuid      = var.vpc_uuid
  ha            = var.ha
  auto_upgrade  = var.auto_upgrade
  surge_upgrade = var.surge_upgrade
  tags          = var.tags

  dynamic "maintenance_policy" {
    for_each = var.maintenance_policy != null ? [var.maintenance_policy] : []

    content {
      day        = maintenance_policy.value.day
      start_time = maintenance_policy.value.start_time
    }
  }

  node_pool {
    name       = "${var.name}-default-node-pool"
    size       = var.default_node_pool["size"]
    node_count = try(var.default_node_pool["node_count"], null)
    auto_scale = try(var.default_node_pool["auto_scale"], null)
    min_nodes  = try(var.default_node_pool["min_nodes"], null)
    max_nodes  = try(var.default_node_pool["max_nodes"], null)
  }
}

resource "digitalocean_project_resources" "this" {
  count   = var.project_id != null ? 1 : 0
  project = var.project_id
  resources = [
    digitalocean_kubernetes_cluster.this.urn
  ]
}
