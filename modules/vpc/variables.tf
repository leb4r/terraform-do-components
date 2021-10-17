variable "region" {
  description = "The DigitalOcean region to deploy resources to"
  type        = string
  default     = "nyc3"
}

variable "ip_range" {
  description = "The CIDR of the VPC"
  type        = string
  default     = "10.10.10.0/24"
}

variable "vpc_name" {
  description = "Name to give VPC, if not set `project_name` will be used, if `project_name` is not set, it will use `domain_name`"
  type        = string
}

variable "vpc_description" {
  description = "Canonical description to give the the VPC"
  type        = string
  default     = "Managed by Terraform"
}
