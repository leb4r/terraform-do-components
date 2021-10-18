variable "cluster_name" {
  description = "The canonical name of the Kubernetes cluster"
  type        = string
}

variable "cluster_version" {
  description = "The version of Kubernetes to deploy"
  type        = string
  default     = "1.21.3-do.0"
}

variable "ha" {
  description = "Set to `true` to deploy an HA Control Plane"
  type        = bool
  default     = false
}

variable "max_nodes" {
  description = "The maximum number of workers in the node pool"
  type        = number
  default     = 3
}

variable "min_nodes" {
  description = "The minimum number of workers in the node pool"
  type        = number
  default     = 1
}

variable "node_size" {
  description = "The size of the nodes in the pool"
  type        = string
  default     = "s-2vcpu-2gb"
}

variable "project_id" {
  description = "The ID of the project to assign the resources to"
  type        = string
  default     = null
}

variable "region" {
  description = "The DigitalOcean region to deploy resources to"
  type        = string
  default     = "nyc3"
}

variable "vpc_id" {
  description = "The ID of the VPC to deploy the cluster in"
  type        = string
  default     = null
}
