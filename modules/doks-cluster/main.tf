resource "digitalocean_kubernetes_cluster" "this" {
  name     = var.cluster_name
  region   = var.region
  version  = var.cluster_version
  vpc_uuid = var.vpc_id
  ha       = var.ha

  node_pool {
    name       = "${var.cluster_name}-default-node-pool"
    size       = var.node_size
    auto_scale = true
    min_nodes  = var.min_nodes
    max_nodes  = var.max_nodes
  }
}

resource "digitalocean_project_resources" "this" {
  count   = var.project_id != null ? 1 : 0
  project = var.project_id
  resources = [
    digitalocean_kubernetes_cluster.this.urn
  ]
}
