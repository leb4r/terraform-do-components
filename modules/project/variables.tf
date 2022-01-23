variable "environment" {
  description = "The environment of the project (e.g. `Development`, `Staging`, or `Production`)"
  type        = string
  default     = "Development"

  validation {
    condition     = contains(["Development", "Staging", "Production"], var.environment)
    error_message = "Error: `environment` must be either `Development`, `Staging` or `Production`."
  }
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
