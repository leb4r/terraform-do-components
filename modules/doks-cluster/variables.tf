variable "auto_upgrade" {
  description = "A boolean value indicating whether the cluster will be automatically upgraded to new patch releases during it's maintenance window"
  type        = bool
  default     = true
}

variable "ha" {
  description = <<-EOT
    Enable/disable the high availability control plane for a cluster.
    High availability can only be set when creating a cluster. Any update will create a new cluster
  EOT
  type        = bool
  default     = false
}

variable "maintenance_policy" {
  description = <<-EOT
    A block representing the cluster's maintenance window.
    Updates will be applied within this window. `auto_upgrade` must be set to `true` for this to have an effect
  EOT
  type = object({
    day        = string,
    start_time = string,
  })
  default = {
    day        = "sunday",
    start_time = "04:00"
  }
}

variable "default_node_pool" {
  description = <<-EOT
    A block representing the cluster's default node pool. Additional node pools may be
    added to the cluster. The name of the node pool is derived from `name`
  EOT
  type = object({
    size       = string,
    node_count = optional(number),
    auto_scale = optional(bool),
    min_nodes  = optional(number),
    max_nodes  = optional(number),
    tags       = optional(list(string)),
    labels     = optional(map(string)),
  })
  default = {
    size       = "s-2vcpu-2gb",
    auto_scale = true
    min_nodes  = 1
    max_nodes  = 3
  }
}

variable "min_nodes" {
  description = "The minimum number of workers in the node pool"
  type        = number
  default     = 1
}

variable "name" {
  description = "The canonical name of the Kubernetes cluster"
  type        = string
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

variable "surge_upgrade" {
  description = "Enable/disable surge upgrades for a cluster"
  type        = bool
  default     = false
}

variable "tags" {
  description = "A list of tag names to be applied to the Kubernetes cluster"
  type        = list(string)
  default     = []
}

variable "version_prefix" {
  description = "The version prefix, for example, `1.15.` will return the latest patch version of `1.15.x`"
  type        = string
}

variable "vpc_uuid" {
  description = "The ID of the VPC to deploy the cluster in"
  type        = string
  default     = null
}
