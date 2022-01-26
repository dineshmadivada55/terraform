provider "aws"{
    region = "ap-south-1"
    access_key = "AKIAXTU7WBMC5C4PJWJZ"
    secret_key = "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"
}

resource "aws_instance" "ec2_basic" {
    ami = "ami-08ee6644906ff4d6c"
    instance_type = "t2.micro"
    subnet_id = data.subnetid
    tags = {
        Name = "byterraform"
    }
}
