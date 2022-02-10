variable "chart_version" {
  description = "The version of the `ingress-nginx` Helm Chart to install"
  type        = string
  default     = "0.2.0"
}

variable "cluster_name" {
  description = "Name of DOKS Cluster to deploy `ingress-nginx` to, used to fetch authentication data for provider"
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
  default     = 600
}

variable "helm_wait" {
  description = "Will wait unitl all resources are in a ready state before marking the release as successful. It will wait as long as `timeout`"
  type        = bool
  default     = true
}

variable "namespace" {
  description = "Kubernetes Namespace to deploy `ingress-nginx` in"
  type        = string
  default     = "ingress"
}
