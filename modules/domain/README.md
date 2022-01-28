# Component: `domain`

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_digitalocean"></a> [digitalocean](#requirement\_digitalocean) | ~> 2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_digitalocean"></a> [digitalocean](#provider\_digitalocean) | ~> 2.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [digitalocean_domain.this](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/domain) | resource |
| [digitalocean_project_resources.this](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/project_resources) | resource |
| [digitalocean_record.this](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/record) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | Domain name to create (e.g. `example.com`) | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID of the project to assign the resources to | `string` | `null` | no |
| <a name="input_records"></a> [records](#input\_records) | A list of record objects to create.<br>See https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/record#argument-reference for the exact object definition. | <pre>list(object({<br>    type     = string<br>    name     = string<br>    priority = optional(number)<br>    weight   = optional(number)<br>    ttl      = optional(number)<br>    flags    = optional(number)<br>    tag      = optional(string)<br>    port     = optional(number)<br>    value    = string<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_domain_name"></a> [domain\_name](#output\_domain\_name) | Name of the Domain that is being managed by this component |
| <a name="output_id"></a> [id](#output\_id) | ID of the Domain that is being managed by this component |
| <a name="output_records"></a> [records](#output\_records) | List of records that are being managed by this componenet |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
