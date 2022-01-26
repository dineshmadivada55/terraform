provider "aws"{
    region = "ap-south-1"
    access_key = "AKIAXTU7WBMC5C4PJWJZ"
    secret_key = "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"
}

resource "aws_vpc" "my_vpc" {
	cidr_block = "10.0.0.0/16"
	tags = {
		"Name" = "my_vpc"
	}
}
resource "aws_subnet" "my-subnet" {
	vpc_id = aws_vpc.my_vpc.id
	cidr_block = "10.0.0.0/24"
	availability_zone = "ap-south-1a"
	tags = {
		"Name" = "my_subnet"
	}
}

output "subnetid" {
value = aws_subnet.my-subnet.id
}
