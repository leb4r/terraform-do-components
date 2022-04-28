locals {
  load_balancer_annotations = var.load_balancer_annotations_enabled ? merge(
    var.load_balancer_id != null ? { "kubernetes.digitalocean.com/load-balancer-id" = var.load_balancer_id } : {},
    var.load_balancer_name != null ? { "service.beta.kubernetes.io/do-loadbalancer-protocol" = var.load_balancer_name } : {},
  ) : {}

  service_annotations = local.load_balancer_annotations
}

resource "helm_release" "ingress_nginx" {
  name       = "ingress-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  version    = var.chart_version

  create_namespace = var.create_kubernetes_namespace
  namespace        = var.kubernetes_namespace

  atomic  = var.helm_atomic
  wait    = var.helm_wait
  timeout = var.helm_timeout

  values = var.load_balancer_annotations_enabled ? compact([
    yamlencode({
      service = {
        annotations = local.service_annotations
      }
    })
  ]) : []

  # -- Allows customization of the source of the IP address or FQDN to report
  # in the ingress status field. By default, it reads the information provided
  # by the service. If disable, the status field reports the IP address of the
  # node or nodes where an ingress controller pod is running.
  set {
    name  = "controller.publishService.enabled"
    value = "true"
  }
}
