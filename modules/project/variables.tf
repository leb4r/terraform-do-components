variable "environment" {
  description = "The environment of the project (e.g. `Development`, `Staging`, or `Production`)"
  type        = string
  default     = "Development"
}

variable "description" {
  description = "A description to give to the project"
  type        = string
  default     = "Managed by Terraform"
}

variable "name" {
  description = "The canonical name to give to the project"
  type        = string
}

variable "purpose" {
  description = "The purpose of the project"
  type        = string
  default     = "Managed by Terraform"
}
