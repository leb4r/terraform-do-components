# Component: `load-balancer`

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
| [digitalocean_loadbalancer.this](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/loadbalancer) | resource |
| [digitalocean_project_resources.this](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/project_resources) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_algorithm"></a> [algorithm](#input\_algorithm) | The load balancing algorithm used to determine which backend Droplet will be selected by a client | `string` | `"round_robin"` | no |
| <a name="input_droplet_ids"></a> [droplet\_ids](#input\_droplet\_ids) | List of Droplet IDs that are meant to be associated with the Load Balancer | `list(string)` | `[]` | no |
| <a name="input_droplet_tag"></a> [droplet\_tag](#input\_droplet\_tag) | The name of a Droplet tag corresponding to Droplets to be assigned to the Load Balancers | `string` | `null` | no |
| <a name="input_enable_backend_keepalive"></a> [enable\_backend\_keepalive](#input\_enable\_backend\_keepalive) | A boolean value indicating whether HTTP keepalive connections are maintained to target Droplets | `bool` | `false` | no |
| <a name="input_enable_proxy_protocol"></a> [enable\_proxy\_protocol](#input\_enable\_proxy\_protocol) | A boolean value indicating whether PROXY Protocol should be used to pass information from connecting client requests to the backend service | `bool` | `false` | no |
| <a name="input_forwarding_rules"></a> [forwarding\_rules](#input\_forwarding\_rules) | List of forwarding rules to be assigned with the Load Balancer | <pre>list(object({<br>    entry_port       = number,<br>    entry_protocol   = string,<br>    target_port      = number,<br>    target_protocol  = string,<br>    certificate_name = optional(string),<br>    tls_passthrough  = optional(bool)<br>  }))</pre> | n/a | yes |
| <a name="input_healthcheck"></a> [healthcheck](#input\_healthcheck) | Healthcheck configuration to apply to the Load Balancer | <pre>object({<br>    port                   = number,<br>    protocol               = string,<br>    path                   = optional(string),<br>    check_interval_seconds = optional(number),<br>    unhealthy_threshold    = optional(number),<br>    healthy_threshold      = optional(number)<br>  })</pre> | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Canonical name to give the Load Balancer | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID of the project to assign the resources to | `string` | `null` | no |
| <a name="input_redirect_http_to_https"></a> [redirect\_http\_to\_https](#input\_redirect\_http\_to\_https) | A boolean value indicating whether HTTP requests to the Load Balancer on port 80 will be redirected to HTTPS on port 443 | `bool` | `false` | no |
| <a name="input_region"></a> [region](#input\_region) | The DigitalOcean region to deploy resources to | `string` | `"nyc3"` | no |
| <a name="input_size"></a> [size](#input\_size) | The size of the Load Balancer | `string` | `"lb-small"` | no |
| <a name="input_sticky_sessions"></a> [sticky\_sessions](#input\_sticky\_sessions) | A sticky\_sessions block to be assigned to the Load Balancer. | <pre>object({<br>    type               = string,<br>    cookie_name        = optional(string),<br>    cookie_ttl_seconds = optional(number)<br>  })</pre> | <pre>{<br>  "type": "none"<br>}</pre> | no |
| <a name="input_vpc_uuid"></a> [vpc\_uuid](#input\_vpc\_uuid) | The ID of the VPC where the load balancer will be located | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the Load Balancer |
| <a name="output_ip"></a> [ip](#output\_ip) | The IP of the Load Balancer |
| <a name="output_name"></a> [name](#output\_name) | The Name of the Load Balancer |
| <a name="output_project"></a> [project](#output\_project) | ID of the project the Load Balancer belongs to |
| <a name="output_region"></a> [region](#output\_region) | The region of the Load Balancer |
| <a name="output_urn"></a> [urn](#output\_urn) | The uniform resource name for the Load Balancer |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
