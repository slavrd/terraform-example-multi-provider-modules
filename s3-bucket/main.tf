variable "bucket_prefix" {
    type = string
    description = "Prefix to be used for the bucket name."
}

resource "aws_s3_bucket" "bucket" {
  bucket   = "${var.bucket_prefix}-${formatdate("YYMMDDhhmm",timestamp())}"
  acl      = "private"

   lifecycle {
    ignore_changes = [bucket]
  }

  tags = {
    Name    = "TF example multi module alternate provider"
    project = "tf-example-multi-provider-modules"
  }
}

terraform {
    required_version = ">= 0.12"
}