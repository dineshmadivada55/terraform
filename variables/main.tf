provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIAXTU7WBMC64ZK2H4X"
  secret_key = "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"
}

resource "aws_instance" "ec2_basic" {
  ami           = var.ami
  instance_type = var.instance_type
  tags          = var.tags
  count         = 2
}
