variable "api_token" {
  description = "The DigitalOcean API token `external-dns` will use to manage DNS records, this should be separate from the token used to authenticate with Kubernetes"
  type        = string
  sensitive   = true
}

variable "chart_version" {
  description = "The version of the `external-dns` Helm Chart to install"
  type        = string
  default     = "6.1.3"
}

variable "cluster_name" {
  description = "Canonical name of DOKS Cluster to deploy kube-prometheus-stack to, used to authenticate"
  type        = string
}

variable "create_namespace" {
  description = "Set to `false` to use an existing namespace"
  type        = bool
  default     = false
}

variable "domain_filters" {
  description = "A list of DigitalOcean domains for `external-dns` to manage"
  type        = list(string)
  default     = []
}

variable "helm_atomic" {
  description = "If set, installation process purges chart on fail. The wait flag will be set automatically if atomic is used"
  type        = bool
  default     = true
}

variable "helm_timeout" {
  description = "Time in seconds to wait for any individual Kubernetes operation"
  type        = number
  default     = 300
}

variable "helm_wait" {
  description = "Will wait unitl all resources are in a ready state before marking the release as successful. It will wait as long as `timeout`"
  type        = bool
  default     = true
}

variable "interval" {
  description = "The interval for which `external-dns` will poll for changes to Ingress Services"
  type        = string
  default     = "1m"
}

variable "namespace" {
  description = "The Kubernetes Namespace to deploy `external-dns` to"
  type        = string
  default     = null
}

variable "policy" {
  description = <<-EOT
    Whether ExternalDNS will only insert DNS records (upsert-only) or create and delete them as needed (sync).
    Fortunately, since version 0.3, ExternalDNS supports the concept of ownership by creating accompanying TXT records in which it stores information about the domains it creates,
    limiting its scope of action to only those it created
  EOT
  type        = string
  default     = "sync"

  validation {
    condition     = contains(["sync", "upsert-only"], var.policy)
    error_message = "Error: `policy` must be either `sync` or `upsert-only`."
  }
}
