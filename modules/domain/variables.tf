variable "domain_name" {
  description = "Domain name to create (e.g. `example.com`)"
  type        = string
}

variable "project_id" {
  description = "The ID of the project to assign the resources to"
  type        = string
  default     = null
}

variable "records" {
  description = <<-EOF
    A list of record objects to create.
    See https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/record#argument-reference for the exact object definition.
  EOF
  type = list(object({
    type     = string
    name     = string
    priority = optional(number)
    weight   = optional(number)
    ttl      = optional(number)
    flags    = optional(number)
    tag      = optional(string)
    port     = optional(number)
    value    = string
  }))
  default = []
}
