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
| <a name="provider_digitalocean"></a> [digitalocean](#provider\_digitalocean) | 2.14.0 |

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
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The canonical name of the Kubernetes cluster | `string` | n/a | yes |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | The version of Kubernetes to deploy | `string` | n/a | yes |
| <a name="input_ha"></a> [ha](#input\_ha) | Set to `true` to deploy an HA Control Plane | `bool` | `false` | no |
| <a name="input_max_nodes"></a> [max\_nodes](#input\_max\_nodes) | The maximum number of workers in the node pool | `number` | `3` | no |
| <a name="input_min_nodes"></a> [min\_nodes](#input\_min\_nodes) | The minimum number of workers in the node pool | `number` | `1` | no |
| <a name="input_node_size"></a> [node\_size](#input\_node\_size) | The size of the nodes in the pool | `string` | `"s-2vcpu-2gb"` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID of the project to assign the resources to | `string` | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | The DigitalOcean region to deploy resources to | `string` | `"nyc3"` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The ID of the VPC to deploy the cluster in | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ca_certificate"></a> [ca\_certificate](#output\_ca\_certificate) | The base64 encoded public certificate for the cluster's certificate authority |
| <a name="output_client_key"></a> [client\_key](#output\_client\_key) | The DigitalOcean API access token used by clients to access the cluster |
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | The URL of the API server on the Kubernetes master node |
| <a name="output_id"></a> [id](#output\_id) | The ID of the cluster |
| <a name="output_kube_config"></a> [kube\_config](#output\_kube\_config) | The kubeconfig to use for the cluster |
| <a name="output_name"></a> [name](#output\_name) | The name of the cluster |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
