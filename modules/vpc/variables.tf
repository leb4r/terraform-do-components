variable "description" {
  description = "A free-form text field up to a limit of 255 characters to describe the VPC"
  type        = string
  default     = "Managed by Terraform"
}

variable "ip_range" {
  description = <<-EOT
    The range of IP addresses for the VPC in CIDR notation.
    Network ranges cannot overlap with other networks in the same account and must be in range of private addresses as defined in RFC1918.
    It may not be larger than /16 or smaller than /24
  EOT
  type        = string
  default     = "10.10.10.0/24"
}

variable "name" {
  description = "A name for the VPC. Must be unique and contain alphanumeric characters, dashes, and periods only. If not set `project_name` will be used"
  type        = string
}

variable "region" {
  description = "The DigitalOcean region slug for the VPC's location"
  type        = string
  default     = "nyc3"
}
