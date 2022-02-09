data "digitalocean_domain" "parent_domain" {
  name = var.parent_domain_name
}

resource "digitalocean_domain" "this" {
  name = var.sub_domain_name
}

resource "digitalocean_record" "ns" {
  for_each = {}

  domain   = data.digitalocean_domain.parent_domain.id
  type     = each.value.type
  name     = each.value.name
  priority = try(each.value.priority, null)
  weight   = try(each.value.weight, null)
  ttl      = try(each.value.ttl, null)
  flags    = try(each.value.flags, null)
  tag      = try(each.value.tag, null)
  value    = each.value.value
}

resource "digitalocean_project_resources" "this" {
  count   = var.project_id != null ? 1 : 0
  project = var.project_id
  resources = [
    digitalocean_domain.this.urn
  ]
}
