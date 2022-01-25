# Component: `vpc`

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_digitalocean"></a> [digitalocean](#requirement\_digitalocean) | ~> 2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_digitalocean"></a> [digitalocean](#provider\_digitalocean) | 2.14.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [digitalocean_vpc.this](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ip_range"></a> [ip\_range](#input\_ip\_range) | The CIDR of the VPC | `string` | `"10.10.10.0/24"` | no |
| <a name="input_region"></a> [region](#input\_region) | The DigitalOcean region to deploy resources to | `string` | `"nyc3"` | no |
| <a name="input_vpc_description"></a> [vpc\_description](#input\_vpc\_description) | Canonical description to give the the VPC | `string` | `"Managed by Terraform"` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | Name to give VPC, if not set `project_name` will be used, if `project_name` is not set, it will use `domain_name` | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_created_at"></a> [created\_at](#output\_created\_at) | The date and time of when the VPC was created |
| <a name="output_default"></a> [default](#output\_default) | A boolean indicating whether or not the VPC is the default for the region |
| <a name="output_id"></a> [id](#output\_id) | The unique identifier for the VPC |
| <a name="output_urn"></a> [urn](#output\_urn) | The uniform resource name (URN) for the VPC |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
