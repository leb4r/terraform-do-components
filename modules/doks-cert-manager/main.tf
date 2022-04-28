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

resource "helm_release" "cert_manager" {
  name       = "cert-manager"
  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"
  namespace  = local.namespace
  version    = var.chart_version

  atomic  = var.helm_atomic
  wait    = var.helm_wait
  timeout = var.helm_timeout

  set {
    name  = "installCRDs"
    value = "true"
  }
}

# see https://cert-manager.io/docs/configuration/acme/dns01/digitalocean/
resource "kubernetes_secret" "digitalocean_issuer" {
  metadata {
    name = "digitalocean-issuer"
  }

  data = {
    access-token = var.api_token
  }

  depends_on = [
    helm_release.cert_manager
  ]
}

resource "kubernetes_manifest" "digitalocean_issuer" {
  manifest = {
    apiVersion = "cert-manager.io/v1"
    kind       = "Issuer"

    metadata = {
      name = "digitalocean-issuer"
    }

    spec = {
      acme = {
        solvers = [
          {
            dns01 = {
              digitalocean = {
                tokenSecretRef = {
                  name = "digitalocean-issuer",
                  key  = "access-token"
                }
              }
            }
          }
        ]
      }
    }
  }

  depends_on = [
    kubernetes_secret.digitalocean_issuer
  ]
}
