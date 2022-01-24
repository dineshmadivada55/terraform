provider "aws"{
    region = "ap-south-1"
    access_key = "AKIAXTU7WBMC64ZK2H4X"
    secret_key = "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"
}

resource "aws_instance" "ec2_basic" {
    ami = "ami-08ee6644906ff4d6c"
    instance_type = "t2.micro"
    tags = {
        Name = "byterraform"
    }
}
