# Upgrading Kismatic

## Download the Linux version of Kismatic

Firstly you will need to download the latest release of Kismatic from [here](https://github.com/apprenda/kismatic/releases)

## Update the "kismatic_version" variable

The `kismatic_version` variable in `terraform/variables.tf` needs to be upgraded (see below):

```
variable "kismatic_version" {
  default = "v1.7.0"
}

```