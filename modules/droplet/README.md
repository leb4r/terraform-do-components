# Component: `droplet`

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
| [digitalocean_droplet.this](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/droplet) | resource |
| [digitalocean_project_resources.this](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/project_resources) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_backups"></a> [backups](#input\_backups) | Boolean controlling if backups are made | `bool` | `false` | no |
| <a name="input_droplet_agent"></a> [droplet\_agent](#input\_droplet\_agent) | A boolean indicating whether to install the DigitalOcean agent used for providing access to the Droplet web console in the control panel. By default, the agent is installed on new Droplets but installation errors (i.e. OS not supported) are ignored. To prevent it from being installed, set to false. To make installation errors fatal, explicitly set it to true | `bool` | `null` | no |
| <a name="input_graceful_shutdown"></a> [graceful\_shutdown](#input\_graceful\_shutdown) | A boolean indicating whether the droplet should be gracefully shut down before it is deleted | `bool` | `null` | no |
| <a name="input_image"></a> [image](#input\_image) | The image ID/slug of the Droplet | `string` | `"ubuntu-20-04-x64"` | no |
| <a name="input_ipv6"></a> [ipv6](#input\_ipv6) | Boolean controlling if IPv6 is enabled | `bool` | `false` | no |
| <a name="input_monitoring"></a> [monitoring](#input\_monitoring) | Boolean controlling whether monitoring agent is installed | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the Droplet | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID of the project to assign the resources to | `string` | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | The region of the Droplet | `string` | `"nyc3"` | no |
| <a name="input_size"></a> [size](#input\_size) | The unique slug that identifies the type of Droplet. You can find a list of available slugs on DigitalOcean API documentation | `string` | `"s-1vcpu-1gb"` | no |
| <a name="input_ssh_keys"></a> [ssh\_keys](#input\_ssh\_keys) | A list of SSH key IDs or fingerprints to enable in the format [12345, 123456]. To retrieve this info, use the DigitalOcean API or CLI (doctl compute ssh-key list). Once a Droplet is created keys can not be added or removed via this provider. Modifying this field will prompt you to destroy and recreate the Droplet | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | value | `list(string)` | `[]` | no |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | A string that represents the desired User Data for the Droplet | `string` | `""` | no |
| <a name="input_vpc_uuid"></a> [vpc\_uuid](#input\_vpc\_uuid) | The IP of the VPC for the Droplet | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the Droplet |
| <a name="output_image"></a> [image](#output\_image) | The image of the Droplet |
| <a name="output_ipv4_address"></a> [ipv4\_address](#output\_ipv4\_address) | The Public IPv4 address of the Droplet |
| <a name="output_ipv4_address_private"></a> [ipv4\_address\_private](#output\_ipv4\_address\_private) | The private IPv4 address of the Droplet |
| <a name="output_ipv6"></a> [ipv6](#output\_ipv6) | Whether IPv6 is enabled |
| <a name="output_ipv6_address"></a> [ipv6\_address](#output\_ipv6\_address) | The Public IPv6 address of the Droplet |
| <a name="output_locked"></a> [locked](#output\_locked) | Is the Droplet locked |
| <a name="output_price_hourly"></a> [price\_hourly](#output\_price\_hourly) | The Droplet's hourly price |
| <a name="output_price_monthly"></a> [price\_monthly](#output\_price\_monthly) | The Droplet's monthly price |
| <a name="output_private_networking"></a> [private\_networking](#output\_private\_networking) | Is private networking enabled for the Droplet |
| <a name="output_region"></a> [region](#output\_region) | The region of the Droplet |
| <a name="output_size"></a> [size](#output\_size) | The instance size of the Droplet |
| <a name="output_status"></a> [status](#output\_status) | The status of the Droplet |
| <a name="output_tags"></a> [tags](#output\_tags) | The tags associated with the Droplet |
| <a name="output_urn"></a> [urn](#output\_urn) | The uniform resource name of the Droplet |
| <a name="output_vcpus"></a> [vcpus](#output\_vcpus) | The number of virtual CPU's assigned to the Droplet |
| <a name="output_volume_ids"></a> [volume\_ids](#output\_volume\_ids) | A list of the block storage volumes attached to the Droplet |
| <a name="output_vpc_uuid"></a> [vpc\_uuid](#output\_vpc\_uuid) | The ID of the VPC where the Droplet will be located |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
