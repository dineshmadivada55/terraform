provider "aws"{
    region = "ap-south-1"
    access_key = "AKIAXTU7WBMCSCM5UXGX"
    secret_key = "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"
}

resource "aws_instance" "ec2_basic" {
    ami = "ami-08ee6644906ff4d6c"
    instance_type = "t2.micro"
    tags = {
        Name = "byterraform"
    }
	user_data = "${file("data.sh")}"

}
