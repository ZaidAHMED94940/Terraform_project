# Getting Started with Terraform

This guide will help you get started with Terraform for basic infrastructure management, including creating an EC2 instance, a DynamoDB table, and using Terraform modules.

## Prerequisites

- Install Terraform: [Terraform Installation Guide](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
- AWS Account: Set up an AWS account to provision resources.
- AWS CLI: Install and configure the AWS CLI with `aws configure`.
- Text editor or IDE (e.g., VSCode, IntelliJ, etc.).
- Basic understanding of AWS services like EC2, DynamoDB, and IAM.

## Steps

### 1. Initialize a Terraform Project

1. Create a new directory for your Terraform project.
2. Inside the directory, create a file named `main.tf`.
3. Define the Terraform provider and backend configuration.

```hcl
provider "aws" {
  region = "us-east-1"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
```

### 2. Create an EC2 Instance

1. Add the following code to `main.tf` to create an EC2 instance.

```hcl
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0" # Update with your region's AMI
  instance_type = "t2.micro"

  tags = {
    Name = "TerraformExampleInstance"
  }
}
```

2. Run the following commands to provision the instance:

```bash
terraform init
terraform plan
terraform apply
```

### 3. Create a DynamoDB Table

1. Add the following code to `main.tf` to create a DynamoDB table.

```hcl
resource "aws_dynamodb_table" "example" {
  name           = "ExampleTable"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "id"

  attribute {
    name = "id"
    type = "S"
  }

  tags = {
    Name = "TerraformExampleTable"
  }
}
```

2. Re-run `terraform apply` to provision the DynamoDB table.

### 4. Use Terraform Modules

1. Create a `modules` folder for reusable Terraform code. Inside it, define a module for common resources.
2. For example, create a module to handle EC2 instances:

**Directory Structure:**
```
modules/
  ec2/
    main.tf
main.tf
```

**`modules/ec2/main.tf`:**
```hcl
variable "ami" {}
variable "instance_type" {}

resource "aws_instance" "example" {
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name = "ModuleInstance"
  }
}
```

**`main.tf`:**
```hcl
module "ec2_module" {
  source         = "./modules/ec2"
  ami            = "ami-0c55b159cbfafe1f0"
  instance_type  = "t2.micro"
}
```

### 5. Clean Up

1. To destroy all resources managed by Terraform, run:

```bash
terraform destroy
```

### 6. Explore More

- Learn about state management: `terraform state list` and `terraform state show`.
- Use variables and outputs to make configurations dynamic.
- Explore remote state with AWS S3.

## Resources

- [Terraform Documentation](https://www.terraform.io/docs)
- [AWS Terraform Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [HashiCorp Learn](https://learn.hashicorp.com/)

## Next Steps

- Add security groups and IAM roles to your EC2 instance.
- Use data sources to fetch existing AWS resources.
- Deploy a multi-tier application using modules and configurations.
