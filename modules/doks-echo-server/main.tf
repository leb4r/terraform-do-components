resource "kubernetes_namespace" "this" {
  count = var.create_namespace ? 1 : 0
  metadata {
    name = var.namespace
  }
}

locals {
  namespace = var.create_namespace ? kubernetes_namespace.this[0].metadata[0].name : var.namespace
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
}
