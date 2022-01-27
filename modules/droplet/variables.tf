variable "backups" {
  description = "Boolean controlling if backups are made"
  type        = bool
  default     = false
}

variable "droplet_agent" {
  description = "A boolean indicating whether to install the DigitalOcean agent used for providing access to the Droplet web console in the control panel. By default, the agent is installed on new Droplets but installation errors (i.e. OS not supported) are ignored. To prevent it from being installed, set to false. To make installation errors fatal, explicitly set it to true"
  type        = bool
  default     = null
}

variable "graceful_shutdown" {
  description = "A boolean indicating whether the droplet should be gracefully shut down before it is deleted"
  type        = bool
  default     = null
}

variable "image" {
  description = "The image ID/slug of the Droplet"
  type        = string
  default     = "ubuntu-20-04-x64"
}

variable "ipv6" {
  description = "Boolean controlling if IPv6 is enabled"
  type        = bool
  default     = false
}

variable "monitoring" {
  description = "Boolean controlling whether monitoring agent is installed"
  type        = bool
  default     = false
}

variable "name" {
  description = "The name of the Droplet"
  type        = string
}

variable "project_id" {
  description = "The ID of the project to assign the resources to"
  type        = string
  default     = null
}

variable "region" {
  description = "The region of the Droplet"
  type        = string
  default     = "nyc3"
}

variable "size" {
  description = "The unique slug that identifies the type of Droplet. You can find a list of available slugs on DigitalOcean API documentation"
  type        = string
  default     = "s-1vcpu-1gb"
}

variable "ssh_keys" {
  description = "A list of SSH key IDs or fingerprints to enable in the format [12345, 123456]. To retrieve this info, use the DigitalOcean API or CLI (doctl compute ssh-key list). Once a Droplet is created keys can not be added or removed via this provider. Modifying this field will prompt you to destroy and recreate the Droplet"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "value"
  type        = list(string)
  default     = []
}

variable "user_data" {
  description = "A string that represents the desired User Data for the Droplet"
  type        = string
  default     = ""
}

variable "vpc_uuid" {
  description = "The IP of the VPC for the Droplet"
  type        = string
  default     = null
}
