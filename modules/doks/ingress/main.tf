locals {
  load_balancer_annotations = var.load_balancer_annotations_enabled ? merge(
    var.load_balancer_id != null ? { "kubernetes.digitalocean.com/load-balancer-id" = var.load_balancer_id } : {},
    var.load_balancer_name != null ? { "service.beta.kubernetes.io/do-loadbalancer-protocol" = var.load_balancer_name } : {},
  ) : {}
}

resource "helm_release" "ingress_nginx" {
  name       = "ingress-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  version    = var.chart_version

  create_namespace = var.create_namespace
  namespace        = var.namespace

  atomic  = var.helm_atomic
  wait    = var.helm_wait
  timeout = var.helm_timeout

  values = var.load_balancer_annotations_enabled ? compact([
    yamlencode({
      service = {
        annotations = local.load_balancer_annotations
      }
    })
  ]) : []

  set {
    name  = "controller.publishService.enabled"
    value = "true"
  }
}
