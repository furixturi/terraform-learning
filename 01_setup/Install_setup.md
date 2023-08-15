# Install Terraform and Setup with AWS

## Install

HashiCorp Terraform install page:

- https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

With Homebrew

```bash
# install HashiCorp tap
$ brew tap hashicorp/tap
# install Terraform
$ brew install hashicorp/tap/terraform
```

## Configure AWS

Put your `Access Key ID` and `Secret access key` in your `~/.aws/credentials`

## Provision an EC2

`main.tf`

```bash
$ terraform init        # sets up terraform backend and state storage
$ terraform fmt         # format
$ terraform validate    # and validate
$ terraform plan        # to view changes
$ terraform apply       # create the resources
$ terraform destroy     # clean up resources
```

# 02 Terraform Init and Providers

## Terraform Architecture

Terraform state ->
Terraform config ->

=> Terraform Core => (e.g.) AWS Provider => AWS

### Available proviers

https://registry.terraform.io/

## Terraform init

`$ terraform init`

- downloads necessary providers and store them in `.terraform` directory
- creates `.terraform.lock.hcl` file to log info of dependencies
