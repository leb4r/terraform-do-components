resource "kubernetes_namespace" "this" {
  count = var.create_namespace ? 1 : 0
  metadata {
    name = var.namespace
  }
}

locals {
  namespace = var.create_namespace ? kubernetes_namespace.this[0].metadata[0].name : var.namespace

  load_balancer_values = [
    {
      name  = "service.type"
      value = "LoadBalancer"
    },
    {
      name  = "service.port"
      value = "80"
    }
  ]

  # see https://docs.digitalocean.com/products/kubernetes/how-to/configure-load-balancers/
  load_balancer_service_annotations = var.load_balancer_enabled ? merge(
    var.load_balancer_id != null ? { "kubernetes.digitalocean.com/load-balancer-id" = var.load_balancer_id } : {},
    var.load_balancer_protocol != null ? { "service.beta.kubernetes.io/do-loadbalancer-protocol" = var.load_balancer_protocol } : {},
    var.load_balancer_name != null ? { "service.beta.kubernetes.io/do-loadbalancer-name" = var.load_balancer_name } : {},
    var.load_balancer_certificate_id != null ? { "service.beta.kubernetes.io/do-loadbalancer-certificate-id" = var.load_balancer_certificate_id } : {},
    var.load_balancer_hostname != null ? { "service.beta.kubernetes.io/do-loadbalancer-hostname" = var.load_balancer_hostname } : {},
    var.load_balancer_http2_ports != null ? { "service.beta.kubernetes.io/do-loadbalancer-http2-ports" = var.load_balancer_http2_ports } : {}
  ) : {}
}

resource "helm_release" "echo_server" {
  name       = "echo-server"
  repository = "https://leb4r.github.io/charts"
  chart      = "echo-server"
  namespace  = local.namespace
  version    = var.chart_version

  atomic  = var.helm_atomic
  wait    = var.helm_wait
  timeout = var.helm_timeout

  values = var.load_balancer_enabled ? compact([
    yamlencode({
      service = {
        annotations = local.load_balancer_service_annotations
      }
    })
  ]) : []

  dynamic "set" {
    for_each = { for i, v in local.load_balancer_values : i => v if var.load_balancer_enabled }

    content {
      name  = set.value.name
      value = set.value.value
    }
  }
}
