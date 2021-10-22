resource "digitalocean_certificate" "this" {
  name    = var.name
  type    = "lets_encrypt"
  domains = var.domains
}
