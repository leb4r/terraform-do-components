# terraform-do-components

[![checkov](https://github.com/leb4r/terraform-do-components/actions/workflows/checkov.yml/badge.svg)](https://github.com/leb4r/terraform-do-components/actions/workflows/checkov.yml) [![pre-commit](https://github.com/leb4r/terraform-do-components/actions/workflows/pre-commit.yml/badge.svg)](https://github.com/leb4r/terraform-do-components/actions/workflows/pre-commit.yml)

Terraform templates that can be re-used in other projects. Built specifically for DigitalOcean.

## Usage

Any of the modules can be used in other projects like such:

```hcl
module "doks_cluster" {
  source       = "git::https://github.com/leb4r/terraform-do-components.git//doks-cluster?ref=main"
  cluster_name = "example-cluster"
}
```

## Notes

### DigitalOcean Authentication

None of the modules explicitly refer to a DigitalOcean API token. This is meant to force the usage of environment variables (e.g. `DIGITALOCEAN_ACCESS_TOKEN`) when passing authentication details to the provider. See the [provider documentation](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs#token) for which environment variables are valid.
