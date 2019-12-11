variable "aws_region_default" {
  type        = string
  description = "AWS region to use for the default AWS provider configuration."
}

variable "aws_region_2" {
  type        = string
  description = "AWS region to use for the secondary AWS provider configuration."
}

provider "aws" {
  region = var.aws_region_default
}

provider "aws" {
  alias  = "aws2"
  region = var.aws_region_2
}

// use module by implicitely passing the default provider configuration
module "bucket_default_region" {
    source = "./s3-bucket/"
    bucket_prefix = "tf-exmample-default-provider"
}

// use module by explicitely passing the alternate provider configuration
module "bucket_alternate_region" {
    source = "./s3-bucket/"
    bucket_prefix = "tf-exmample-alternate-provider"
    providers = {
        aws = aws.aws2
    }
}

terraform {
    required_version = ">= 0.12"
}