# new.tf

provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "example" {
  bucket = "example-bucket-${random_string.random_id.id}"
}

[root@ip-20-0-0-55 terraform_file]#
