variable "chart_version" {
  description = "The version of the Helm Chart that installs kube-prometheus-stack"
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

variable "load_balancer_enabled" {
  description = "Whether or not to configure a load balancer for the service"
  type        = bool
  default     = true
}

variable "load_balancer_id" {
  description = "ID of the load balancer to assign to the service"
  type        = string
  default     = null
}

variable "load_balancer_certificate_id" {
  description = "ID of the certificate to assign to the load balancer"
  type        = string
  default     = null
}

variable "load_balancer_hostname" {
  description = ""
  type        = string
  default     = null
}

variable "load_balancer_http2_ports" {
  description = <<-EOT
    Use this annotation to specify which ports of the load balancer should use the HTTP2 protocol.

    Values are a comma separated list of ports (for example, 443, 6443, 7443).
    If specified, you must also specify either service.beta.kubernetes.io/do-loadbalancer-tls-passthrough or service.beta.kubernetes.io/do-loadbalancer-certificate-id.

    If service.beta.kubernetes.io/do-loadbalancer-protocol is not set to http2, then this annotation is required for implicit HTTP2 usage.
    Unlike service.beta.kubernetes.io/do-loadbalancer-tls-ports, no default port is assumed for HTTP2 to retain compatibility with the semantics of implicit HTTPS usage.
  EOT
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

variable "load_balancer_protocol" {
  description = "The protocol of the load balancer"
  type        = string
  default     = null

  validation {
    condition     = contains(["tcp", "http", "https", "http2"], var.load_balancer_protocol)
    error_message = "Error: `load_balancer_protocol` must be `tcp, http, https, or http2`."
  }
}

variable "namespace" {
  description = "Kubernetes Namespace to deploy `echo-server` in"
  type        = string
  default     = "echo-server"
}

variable "project_id" {
  description = "The ID of the project to assign the resources to"
  type        = string
  default     = null
}
