data "digitalocean_kubernetes_cluster" "this" {
  name = var.cluster_name
}

provider "kubernetes" {
  host  = data.digitalocean_kubernetes_cluster.this.endpoint
  token = data.digitalocean_kubernetes_cluster.this.kube_config[0].token
  cluster_ca_certificate = base64decode(
    data.digitalocean_kubernetes_cluster.this.kube_config[0].cluster_ca_certificate
  )
}

provider "helm" {
  kubernetes {
    host               = data.digitalocean_kubernetes_cluster.this.endpoint
    token              = data.digitalocean_kubernetes_cluster.this.kube_config[0].token
    client_certificate = data.digitalocean_kubernetes_cluster.this.kube_config[0].client_certificate
    client_key         = data.digitalocean_kubernetes_cluster.this.kube_config[0].client_key
    cluster_ca_certificate = base64decode(
      data.digitalocean_kubernetes_cluster.this.kube_config[0].cluster_ca_certificate
    )
  }
}
