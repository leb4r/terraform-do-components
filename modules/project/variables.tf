variable "description" {
  description = "The description of the project"
  type        = string
  default     = "Managed by Terraform"
}

variable "environment" {
  description = "The environment of the project"
  type        = string
  default     = "Development"

  validation {
    condition     = contains(["Development", "Staging", "Production"], var.environment)
    error_message = "Error: `environment` must be either `Development`, `Staging` or `Production`."
  }
}

variable "name" {
  description = "The name of the project"
  type        = string
}

variable "purpose" {
  description = "The purpose of the project"
  type        = string
  default     = "Managed by Terraform"
}
