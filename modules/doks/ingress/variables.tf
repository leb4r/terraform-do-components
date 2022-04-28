variable "chart_version" {
  description = "The version of the `ingress-nginx` Helm Chart to install"
  type        = string
  default     = "4.0.17"
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

variable "load_balancer_annotations_enabled" {
  description = "Whether or not to configure a load balancer annotations for the service"
  type        = bool
  default     = false
}

variable "load_balancer_id" {
  description = "ID of the load balancer to assign to the service"
  type        = string
  default     = null
}

variable "load_balancer_name" {
  description = <<-EOT
    This setting lets you specify a custom name or to rename an existing DigitalOcean Load Balancer. The name must:
    Be less than or equal to 255 characters.
    Start with an alphanumeric character.
    Consist of alphanumeric characters or the ‘.’ (dot) or ‘-’ (dash) characters, except for the final character which must not be a ‘-’ (dash).
    If you do not specify a custom name, the load balancer defaults to a name starting with the character a appended by the Service UID.
  EOT
  type        = string
  default     = null
}

variable "namespace" {
  description = "Kubernetes Namespace to deploy `ingress-nginx` in"
  type        = string
  default     = "ingress"
}
