variable "domains" {
  description = <<-EOT
    List of fully qualified domain names (FQDNs) for which the certificate will be issued.
    The domains must be managed using DigitalOcean's DNS. Only valid when type is `lets_encrypt`
  EOT
  type        = list(string)
}

variable "name" {
  description = "The name of the certificate for identification."
  type        = string
}
