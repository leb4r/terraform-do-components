variable "cluster_name" {
  description = "Canonical name of DOKS Cluster to deploy kube-prometheus-stack to, used to fetch authentication data"
  type        = string
}

variable "create_namespace" {
  description = "Set to `false` to use an existing namespace"
  type        = bool
  default     = true
}

variable "namespace" {
  description = "Kubernetes Namespace to deploy kube-prometheus-stack in"
  type        = string
  default     = "monitoring"
}

variable "kube_prometheus_stack_chart_version" {
  description = "The version of the Helm Chart that installs kube-prometheus-stack"
  type        = string
  default     = "19.2.2"
}
