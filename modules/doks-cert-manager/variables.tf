variable "api_token" {
  description = "The DigitalOcean API token `cert-manager` will use, this should be separate from the token used to deploy these resources"
  type        = string
  sensitive   = true
}

variable "chart_version" {
  description = "The version of the Helm Chart that installs external-dns"
  type        = string
  default     = "6.1.3"
}

variable "cluster_name" {
  description = "Canonical name of DOKS Cluster to deploy kube-prometheus-stack to, used to fetch authentication data"
  type        = string
}

variable "create_namespace" {
  description = "Set to `false` to use an existing namespace"
  type        = bool
  default     = true
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

variable "namespace" {
  description = "Kubernetes Namespace to deploy kube-prometheus-stack in"
  type        = string
  default     = "cert-manager"
}
