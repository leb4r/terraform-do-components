# terraform-do-components

[![checkov](https://github.com/leb4r/terraform-do-components/actions/workflows/checkov.yml/badge.svg)](https://github.com/leb4r/terraform-do-components/actions/workflows/checkov.yml) [![pre-commit](https://github.com/leb4r/terraform-do-components/actions/workflows/pre-commit.yml/badge.svg)](https://github.com/leb4r/terraform-do-components/actions/workflows/pre-commit.yml)

Terraform templates that can be re-used in other projects. Built specifically for DigitalOcean.

## Usage

[Reference the submodules](https://www.terraform.io/language/modules/sources#modules-in-package-sub-directories) like such:

```hcl
module "doks_cluster" {
  source       = "leb4r/components/do//modules/doks-cluster"
  version      = "0.1.0"

  cluster_name = "example-cluster"
}
```

## Notes

### DigitalOcean Authentication

None of the modules explicitly refer to a DigitalOcean API token. This is meant to force the usage of environment variables (e.g. `DIGITALOCEAN_ACCESS_TOKEN`) when passing authentication details to the provider. See the [provider documentation](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs#token) for which environment variables are valid.
