resource "digitalocean_domain" "this" {
  name = var.domain_name
}

resource "digitalocean_record" "this" {
  for_each = { for i, record in var.records : i => record }

  domain   = digitalocean_domain.this.id
  type     = each.value.type
  name     = each.value.name
  priority = try(each.value.priority, null)
  weight   = try(each.value.weight, null)
  ttl      = try(each.value.ttl, null)
  flags    = try(each.value.flags, null)
  tag      = try(each.value.tag, null)
  port     = try(each.value.port, null)
  value    = each.value.value
}

resource "digitalocean_project_resources" "this" {
  count   = var.project_id != null ? 1 : 0
  project = var.project_id
  resources = [
    digitalocean_domain.this.urn
  ]
}
