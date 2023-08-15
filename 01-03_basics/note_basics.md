# Notes

[toc]



# 01. Install Terraform and Setup with AWS

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

# 02. Basic Usage

`main.tf`

```bash
$ terraform init        # sets up terraform backend and state storage

($ terraform fmt         # format)
($ terraform validate    # and validate)

$ terraform plan        # to view changes
$ terraform apply       # create the resources

($ terraform show        # inspect state)

$ terraform destroy     # clean up resources
```

The EC2 will be provisioned in the region's default VPC's public subnet, with a public IP.

## Terraform Init and Providers

### Terraform Architecture

Terraform state ->
Terraform config ->

=> Terraform Core => (e.g.) AWS Provider => AWS

#### Available proviers

https://registry.terraform.io/

### Terraform init

`$ terraform init`

- downloads necessary providers and store them in `.terraform` directory
- creates `.terraform.lock.hcl` file to log info of dependencies

## Terraform State Management

## state file

`terraform.tfstate` is a JSON file containing information of resources and data objects deployed through Terraform. It contains sensitive information.

State files can be stored either locally or in a remote object store (S3), or in a managed service (Terraform Cloud).

## plan, apply, destroy

### plan

`$ terraform plan` compares desired state (as in terraform configuration) with the actual state (the Terraform state file), identifies discrepancies, outputs the differences and actions needed to reconcile the two.

### apply

`$ terraform apply` executes the actions in terraform plan, creates, modifies or deletes resources to match the desired state. Then updates the Terraform state file.

### destroy

`$ terraform destroy` removes all resources associated with the Terraform configuration, typically used to clean up at the end of a project.

## Remote Backend

### Terraform Cloud

Managed offering by HashiCorp. WebUI. Free for up to 5 users.

Configure it:

```json
terraform {
  backend "remote" {
  	organization = "xxx"
	}
	
	workspaces {
    name = "xxxxx"
  }
}
```



### Self-managed AWS S3 + DynamoDB

S3 stores state file, DDB table manages concurrency.

#### Bootstrap it:

1. Create a Terraform config and do a local init, apply to provision the S3 and DDB needed:
   1. [remote-backend-s3/main.tf](./remote-backend-s3/main.tf)
   2. terraform init, terraform plan, terraform apply

2. Update the contigure to use the remote backend "s3"

```json
terraform {
  backend = "s3" {
  	bucket = "my-bucket"
  	key = "my-tf/terraform.tfstate"
  	region = "my-region"
  	dynamodb_table = "my-ddb-table"
  	encrypt = true
	}
}
```

3. Run `$ terraform init` again to update the backend config
   local state file will be cleared and a new state file will be created in the specified S3 with specified key



