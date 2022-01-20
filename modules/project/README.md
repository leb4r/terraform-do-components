# Component: `project`

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
| [digitalocean_project.this](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/project) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | A description to give to the project | `string` | `"Managed by Terraform"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment of the project (e.g. `Development`, `Staging`, or `Production`) | `string` | `"Development"` | no |
| <a name="input_name"></a> [name](#input\_name) | The canonical name to give to the project | `string` | n/a | yes |
| <a name="input_purpose"></a> [purpose](#input\_purpose) | The purpose of the project | `string` | `"Managed by Terraform"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | ID of the project created |
| <a name="output_name"></a> [name](#output\_name) | The Name of the project created |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
