resource "digitalocean_vpc" "this" {
  name        = var.vpc_name
  description = var.vpc_description
  region      = var.region
  ip_range    = var.ip_range

  # give a little more time for dependent resources to delete
  timeouts {
    delete = "5m"
  }
}
