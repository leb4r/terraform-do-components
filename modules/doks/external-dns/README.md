# Component: `doks/external-dns`

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
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
| [helm_release.external_dns](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_namespace.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [digitalocean_kubernetes_cluster.this](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/data-sources/kubernetes_cluster) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_token"></a> [api\_token](#input\_api\_token) | The DigitalOcean API token `external-dns` will use to manage DNS records, this should be separate from the token used to authenticate with Kubernetes | `string` | n/a | yes |
| <a name="input_chart_version"></a> [chart\_version](#input\_chart\_version) | The version of the `external-dns` Helm Chart to install | `string` | `"6.1.3"` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Canonical name of DOKS Cluster to deploy kube-prometheus-stack to, used to authenticate | `string` | n/a | yes |
| <a name="input_create_namespace"></a> [create\_namespace](#input\_create\_namespace) | Set to `false` to use an existing namespace | `bool` | `false` | no |
| <a name="input_domain_filters"></a> [domain\_filters](#input\_domain\_filters) | A list of DigitalOcean domains for `external-dns` to manage | `list(string)` | `[]` | no |
| <a name="input_helm_atomic"></a> [helm\_atomic](#input\_helm\_atomic) | If set, installation process purges chart on fail. The wait flag will be set automatically if atomic is used | `bool` | `true` | no |
| <a name="input_helm_timeout"></a> [helm\_timeout](#input\_helm\_timeout) | Time in seconds to wait for any individual Kubernetes operation | `number` | `300` | no |
| <a name="input_helm_wait"></a> [helm\_wait](#input\_helm\_wait) | Will wait unitl all resources are in a ready state before marking the release as successful. It will wait as long as `timeout` | `bool` | `true` | no |
| <a name="input_interval"></a> [interval](#input\_interval) | The interval for which `external-dns` will poll for changes to Ingress Services | `string` | `"1m"` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | The Kubernetes Namespace to deploy `external-dns` to | `string` | `null` | no |
| <a name="input_policy"></a> [policy](#input\_policy) | Whether ExternalDNS will only insert DNS records (upsert-only) or create and delete them as needed (sync).<br>Fortunately, since version 0.3, ExternalDNS supports the concept of ownership by creating accompanying TXT records in which it stores information about the domains it creates,<br>limiting its scope of action to only those it created | `string` | `"sync"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
