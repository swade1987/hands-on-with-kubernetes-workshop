# Upgrading Kismatic

## Download the Linux version of Kismatic

Firstly you will need to download the latest release of Kismatic from [here](https://github.com/apprenda/kismatic/releases)

NOTE: Make sure you download the **linux** binary and **NOT** the darwin one (e.g. kismatic-v1.6.0-linux-amd64.tar.gz)

Copy the tar file into the `terraform/user-data` directory.

## Update the "kismatic_tar_file" variable

The `kismatic_tar_file` variable in `terraform/variables.tf` needs to be upgraded (see below):

```
variable "kismatic_tar_file" {
  default = "kismatic-v1.6.0-linux-amd64.tar.gz"
}
```