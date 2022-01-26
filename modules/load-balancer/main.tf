resource "digitalocean_loadbalancer" "this" {
  name                   = var.name
  region                 = var.region
  size                   = var.size
  algorithm              = var.algorithm
  vpc_uuid               = var.vpc_uuid
  redirect_http_to_https = var.redirect_http_to_https
  droplet_ids            = var.droplet_ids
  droplet_tag            = var.droplet_tag

  dynamic "sticky_sessions" {
    for_each = try(var.sticky_sessions, null) != null ? [var.sticky_sessions] : []

    content {
      type               = sticky_sessions.value.type
      cookie_name        = try(sticky_sessions.value.cookie_name, null)
      cookie_ttl_seconds = try(sticky_sessions.value.cookie_ttl_seconds, null)
    }
  }

  dynamic "healthcheck" {
    for_each = try(var.healthcheck, null) != null ? [var.healthcheck] : []

    content {
      port     = healthcheck.value.port
      protocol = healthcheck.value.protocol

      path                     = try(healthcheck.value.path, null)
      check_interval_seconds   = try(healthcheck.value.check_interval_seconds, null)
      response_timeout_seconds = try(healthcheck.value.response_time_seconds, null)
      unhealthy_threshold      = try(healthcheck.value.unhealthy_threshold, null)
      healthy_threshold        = try(healthcheck.value.healthy_threshold, null)
    }
  }

  dynamic "forwarding_rule" {
    for_each = var.forwarding_rules

    content {
      entry_port     = forwarding_rule.value.entry_port
      entry_protocol = forwarding_rule.value.entry_protocol

      target_port     = forwarding_rule.value.target_port
      target_protocol = forwarding_rule.value.target_protocol

      certificate_name = try(forwarding_rule.value.certificate_name, null)
      tls_passthrough  = try(forwarding_rule.value.tls_passthrough, null)
    }
  }
}

resource "digitalocean_project_resources" "this" {
  count   = try(var.project_id, null) != null ? 1 : 0
  project = var.project_id
  resources = [
    digitalocean_loadbalancer.this.urn
  ]
}
