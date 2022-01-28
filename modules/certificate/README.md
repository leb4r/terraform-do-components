# Component: `certificate`

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_digitalocean"></a> [digitalocean](#requirement\_digitalocean) | ~> 2.0 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | ~> 3.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_digitalocean"></a> [digitalocean](#provider\_digitalocean) | ~> 2.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [digitalocean_certificate.this](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/certificate) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domains"></a> [domains](#input\_domains) | List of fully qualified domain names (FQDNs) for which the certificate will be issued.<br>The domains must be managed using DigitalOcean's DNS. Only valid when type is `lets_encrypt` | `list(string)` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the certificate for identification. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the certificate being managed by this component. |
| <a name="output_name"></a> [name](#output\_name) | The name of the certificate being managed by this component. |
| <a name="output_uuid"></a> [uuid](#output\_uuid) | The UUID of the certificate being managed by this component. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
