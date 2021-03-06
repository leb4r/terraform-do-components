# Component: `doks/echo-server`

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_digitalocean"></a> [digitalocean](#requirement\_digitalocean) | ~> 2.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | ~> 2.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_digitalocean"></a> [digitalocean](#provider\_digitalocean) | ~> 2.0 |
| <a name="provider_helm"></a> [helm](#provider\_helm) | ~> 2.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | ~> 2.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.echo_server](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_namespace.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [digitalocean_kubernetes_cluster.this](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/data-sources/kubernetes_cluster) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_chart_version"></a> [chart\_version](#input\_chart\_version) | The version of the Helm Chart that installs kube-prometheus-stack | `string` | `"0.2.0"` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Canonical name of DOKS Cluster to deploy `echo-server` to, used to fetch authentication data for provider | `string` | n/a | yes |
| <a name="input_create_namespace"></a> [create\_namespace](#input\_create\_namespace) | Set to `false` to use an existing namespace | `bool` | `true` | no |
| <a name="input_helm_atomic"></a> [helm\_atomic](#input\_helm\_atomic) | If set, installation process purges chart on fail. The wait flag will be set automatically if atomic is used | `bool` | `true` | no |
| <a name="input_helm_timeout"></a> [helm\_timeout](#input\_helm\_timeout) | Time in seconds to wait for any individual Kubernetes operation | `number` | `600` | no |
| <a name="input_helm_wait"></a> [helm\_wait](#input\_helm\_wait) | Will wait unitl all resources are in a ready state before marking the release as successful. It will wait as long as `timeout` | `bool` | `true` | no |
| <a name="input_load_balancer_enabled"></a> [load\_balancer\_enabled](#input\_load\_balancer\_enabled) | Whether or not to configure a load balancer for the service | `bool` | `true` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Kubernetes Namespace to deploy `echo-server` in | `string` | `"echo-server"` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID of the project to assign the resources to | `string` | `null` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
