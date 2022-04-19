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

  dynamic "set" {
    for_each = { for i, v in local.load_balancer_values : i => v if var.load_balancer_enabled }

    content {
      name  = set.value.name
      value = set.value.value
    }
  }
}
