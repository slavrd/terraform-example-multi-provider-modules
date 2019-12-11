# Terraform example: multi providers with module

A simple terraform project to demonstrate the passing provider configurations to modules.

The projects uses a module to create two AWS S3 buckets in two different AWS regions. The multiple AWS provider configurations are defined in the root module. Then the sub-module in `s3-bucket` is called twice to create two s3 buckets. 

The 1st time the `s3-bucket` is called it inherits implicitly the default AWS provider configuration from the root module. The second time the alternate AWS provider configuration is passed explicitly.

## Prerequisites

* Install [terraform](https://www.terraform.io/downloads.html) `>=0.12`

## Running the example

* Initialize `terraform init`
* Run terraform, providing the two AWS regions. For example
  
  ```Bash
  terraform apply \
    -var aws_region_default=us-east-1 \
    -var aws_region_2=us-east-2
  ```

* Confirm that the two buckets are created and are in the two provided regions e.g. using the AWS console.
* Destroy the created resources, providing the same AWS regions. For example:

  ```Bash
  terraform destroy \
    -var aws_region_default=us-east-1 \
    -var aws_region_2=us-east-2
  ```
