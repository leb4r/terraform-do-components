# Component: `doks-echo-server`

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
| <a name="input_load_balancer_certificate_id"></a> [load\_balancer\_certificate\_id](#input\_load\_balancer\_certificate\_id) | ID of the certificate to assign to the load balancer | `string` | `null` | no |
| <a name="input_load_balancer_enabled"></a> [load\_balancer\_enabled](#input\_load\_balancer\_enabled) | Whether or not to configure a load balancer for the service | `bool` | `true` | no |
| <a name="input_load_balancer_hostname"></a> [load\_balancer\_hostname](#input\_load\_balancer\_hostname) | n/a | `string` | `null` | no |
| <a name="input_load_balancer_http2_ports"></a> [load\_balancer\_http2\_ports](#input\_load\_balancer\_http2\_ports) | Use this annotation to specify which ports of the load balancer should use the HTTP2 protocol.<br><br>Values are a comma separated list of ports (for example, 443, 6443, 7443).<br>If specified, you must also specify either service.beta.kubernetes.io/do-loadbalancer-tls-passthrough or service.beta.kubernetes.io/do-loadbalancer-certificate-id.<br><br>If service.beta.kubernetes.io/do-loadbalancer-protocol is not set to http2, then this annotation is required for implicit HTTP2 usage.<br>Unlike service.beta.kubernetes.io/do-loadbalancer-tls-ports, no default port is assumed for HTTP2 to retain compatibility with the semantics of implicit HTTPS usage. | `string` | `null` | no |
| <a name="input_load_balancer_id"></a> [load\_balancer\_id](#input\_load\_balancer\_id) | ID of the load balancer to assign to the service | `string` | `null` | no |
| <a name="input_load_balancer_name"></a> [load\_balancer\_name](#input\_load\_balancer\_name) | This setting lets you specify a custom name or to rename an existing DigitalOcean Load Balancer. The name must:<br><br>Be less than or equal to 255 characters.<br>Start with an alphanumeric character.<br>Consist of alphanumeric characters or the ‘.’ (dot) or ‘-’ (dash) characters, except for the final character which must not be a ‘-’ (dash).<br><br>If you do not specify a custom name, the load balancer defaults to a name starting with the character a appended by the Service UID. | `string` | `null` | no |
| <a name="input_load_balancer_protocol"></a> [load\_balancer\_protocol](#input\_load\_balancer\_protocol) | The protocol of the load balancer | `string` | `null` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Kubernetes Namespace to deploy `echo-server` in | `string` | `"echo-server"` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID of the project to assign the resources to | `string` | `null` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
