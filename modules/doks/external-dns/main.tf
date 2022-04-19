# https://www.digitalocean.com/community/tutorials/how-to-automatically-manage-dns-records-from-digitalocean-kubernetes-using-externaldns
locals {
  namespace = var.create_namespace ? kubernetes_namespace.this[0].metadata[0].name : var.namespace
}

resource "kubernetes_namespace" "this" {
  count = var.create_namespace ? 1 : 0
  metadata {
    name = var.namespace
  }
}

resource "helm_release" "external_dns" {
  name       = "external-dns"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "external-dns"
  namespace  = local.namespace
  version    = var.chart_version

  atomic  = var.helm_atomic
  wait    = var.helm_wait
  timeout = var.helm_timeout

  values = [yamlencode({
    domainFilters = var.domain_filters
  })]

  set {
    name  = "provider"
    value = "digitalocean"
  }

  set {
    name  = "interval"
    value = var.interval
  }

  set {
    name  = "policy"
    value = var.policy
  }

  set_sensitive {
    name  = "digitalocean.apiToken"
    value = var.api_token
  }
}
