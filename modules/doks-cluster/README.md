# Component `doks-cluster`

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
| [digitalocean_kubernetes_cluster.this](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/kubernetes_cluster) | resource |
| [digitalocean_project_resources.this](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/project_resources) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_upgrade"></a> [auto\_upgrade](#input\_auto\_upgrade) | A boolean value indicating whether the cluster will be automatically upgraded to new patch releases during it's maintenance window | `bool` | `false` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The canonical name of the Kubernetes cluster | `string` | n/a | yes |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | The version of Kubernetes to deploy | `string` | n/a | yes |
| <a name="input_ha"></a> [ha](#input\_ha) | Set to `true` to deploy an HA Control Plane | `bool` | `false` | no |
| <a name="input_maintenance_policy"></a> [maintenance\_policy](#input\_maintenance\_policy) | A block representing the cluster's maintenance window. Updates will be applied within this window. `auto_upgrade` must be set to `true` for this to have an effect | <pre>object({<br>    day        = string,<br>    start_time = string,<br>  })</pre> | `null` | no |
| <a name="input_max_nodes"></a> [max\_nodes](#input\_max\_nodes) | The maximum number of workers in the node pool | `number` | `3` | no |
| <a name="input_min_nodes"></a> [min\_nodes](#input\_min\_nodes) | The minimum number of workers in the node pool | `number` | `1` | no |
| <a name="input_node_size"></a> [node\_size](#input\_node\_size) | The size of the nodes in the pool | `string` | `"s-2vcpu-2gb"` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID of the project to assign the resources to | `string` | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | The DigitalOcean region to deploy resources to | `string` | `"nyc3"` | no |
| <a name="input_surge_upgrade"></a> [surge\_upgrade](#input\_surge\_upgrade) | Enable/disable surge upgrades for a cluster | `bool` | `false` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A list of tag names to be applied to the Kubernetes cluster | `list(string)` | `[]` | no |
| <a name="input_vpc_uuid"></a> [vpc\_uuid](#input\_vpc\_uuid) | The ID of the VPC to deploy the cluster in | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ca_certificate"></a> [ca\_certificate](#output\_ca\_certificate) | The base64 encoded public certificate for the cluster's certificate authority |
| <a name="output_client_key"></a> [client\_key](#output\_client\_key) | The DigitalOcean API access token used by clients to access the cluster |
| <a name="output_cluster_subnet"></a> [cluster\_subnet](#output\_cluster\_subnet) | The range of IP addresses in the overlay network of the Kubernetes cluster |
| <a name="output_created_at"></a> [created\_at](#output\_created\_at) | The date and time when the Kubernetes cluster was created |
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | The URL of the API server on the Kubernetes master node |
| <a name="output_id"></a> [id](#output\_id) | The ID of the cluster |
| <a name="output_ipv4_address"></a> [ipv4\_address](#output\_ipv4\_address) | The public IPv4 address of the Kubernetes master node. This will not be set if high availability is configured on the cluster |
| <a name="output_kube_config"></a> [kube\_config](#output\_kube\_config) | The kubeconfig to use for the cluster |
| <a name="output_maintenance_policy"></a> [maintenance\_policy](#output\_maintenance\_policy) | A block representing the cluster's maintenance window. Update will be applied within this window |
| <a name="output_name"></a> [name](#output\_name) | The name of the cluster |
| <a name="output_service_subnet"></a> [service\_subnet](#output\_service\_subnet) | The range of assignable IP addresses for services running in the Kubernetes cluster |
| <a name="output_status"></a> [status](#output\_status) | A string indicating the current status of the cluster. Potential values include running, provisioning, and errored |
| <a name="output_updated_at"></a> [updated\_at](#output\_updated\_at) | The date and time when the Kubernetes cluster was last updated |
| <a name="output_urn"></a> [urn](#output\_urn) | The uniform resource name (URN) for the Kubernetes cluster |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
