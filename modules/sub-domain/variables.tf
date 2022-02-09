variable "parent_domain_name" {
  description = "The parent domain that the sub-domain belongs to"
  type        = string
}

variable "sub_domain_name" {
  description = "Subdomain name to create (e.g. `example.com`)"
  type        = string
}

variable "project_id" {
  description = "The ID of the project to assign the resources to"
  type        = string
  default     = null
}
