variable "algorithm" {
  description = "The load balancing algorithm used to determine which backend Droplet will be selected by a client"
  type        = string
  default     = "round_robin"

  validation {
    condition     = contains(["round_robin", "least_connections"], var.algorithm)
    error_message = "Error: `algorithm` must be either `round_robin` or `least_connections`."
  }
}

variable "droplet_ids" {
  description = "List of Droplet IDs that are meant to be associated with the Load Balancer"
  type        = list(string)
  default     = []
}

variable "droplet_tag" {
  description = "The name of a Droplet tag corresponding to Droplets to be assigned to the Load Balancers"
  type        = string
  default     = null
}

variable "enable_backend_keepalive" {
  description = "A boolean value indicating whether HTTP keepalive connections are maintained to target Droplets"
  type        = bool
  default     = false
}

variable "enable_proxy_protocol" {
  description = "A boolean value indicating whether PROXY Protocol should be used to pass information from connecting client requests to the backend service"
  type        = bool
  default     = false
}

variable "forwarding_rules" {
  description = "List of forwarding rules to be assigned with the Load Balancer"
  type = list(object({
    entry_port       = number,
    entry_protocol   = string,
    target_port      = number,
    target_protocol  = string,
    certificate_name = optional(string),
    tls_passthrough  = optional(bool)
  }))
}

variable "healthcheck" {
  description = "Healthcheck configuration to apply to the Load Balancer"
  type = object({
    port                   = number,
    protocol               = string,
    path                   = optional(string),
    check_interval_seconds = optional(number),
    unhealthy_threshold    = optional(number),
    healthy_threshold      = optional(number)
  })
  default = null
}

variable "name" {
  description = "Canonical name to give the Load Balancer"
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

variable "redirect_http_to_https" {
  description = "A boolean value indicating whether HTTP requests to the Load Balancer on port 80 will be redirected to HTTPS on port 443"
  type        = bool
  default     = false
}

variable "sticky_sessions" {
  description = "A sticky_sessions block to be assigned to the Load Balancer."
  type = object({
    type               = string,
    cookie_name        = optional(string),
    cookie_ttl_seconds = optional(number)
  })
  default = {
    type = "none"
  }
}

variable "size" {
  description = "The size of the Load Balancer"
  type        = string
  default     = "lb-small"

  validation {
    condition     = contains(["lb-small", "lb-medium", "lb-large"], var.size)
    error_message = "Error: `size` must be either `lb-small`, `lb-medium`, or `lb-large`."
  }
}

variable "vpc_uuid" {
  description = "The ID of the VPC where the load balancer will be located"
  type        = string
  default     = null
}
