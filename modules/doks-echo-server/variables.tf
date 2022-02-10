variable "chart_version" {
  description = "The version of the `echo-server` Helm Chart to install"
  type        = string
  default     = "0.2.0"
}

variable "cluster_name" {
  description = "Canonical name of DOKS Cluster to deploy `echo-server` to, used to fetch authentication data for provider"
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

variable "ingress_enabled" {
  description = "Whether or not to create an Ingress object"
  type        = bool
  default     = true
}

variable "namespace" {
  description = "Kubernetes Namespace to deploy `echo-server` in"
  type        = string
  default     = "echo-server"
}
