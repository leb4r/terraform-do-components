variable "domain_name" {
  description = "Domain name to create (e.g. `example.com`)"
  type        = string
}

variable "project_id" {
  description = "The ID of the project to assign the resources to"
  type        = string
  default     = null
}
