provider "aws"{
    region = "ap-south-1"
    access_key = "AKIAXTU7WBMCSCM5UXGX"
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

resource "aws_internet_gateway" "my-internetgateway" {
	vpc_id = aws_vpc.my_vpc.id
	tags = {
		"Name" = "my_igw"
	}
}

resource "aws_route_table" "my-route-table" {
        vpc_id = aws_vpc.my_vpc.id
	route {
		cidr_block = "0.0.0.0/0"
		gateway_id = aws_internet_gateway.my-internetgateway.id
	}
}

resource "aws_route_table_association" "my-association" {
	subnet_id = aws_subnet.my-subnet.id
	route_table_id = aws_route_table.my-route-table.id
}

resource "aws_security_group" "my-sg" {
	name = "my_sg"
        vpc_id = aws_vpc.my_vpc.id
	ingress {
	from_port = 22
	to_port = 22
	protocol = "tcp"
	cidr_blocks = ["0.0.0.0/0"]
	}
        egress {
        from_port = 0
        to_port = 0
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        }
	tags = {
		"Name" = "my-sg-custom"
	}
}

resource "aws_instance" "ec2_basic" {
    ami = "ami-08ee6644906ff4d6c"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.my-subnet.id
    vpc_security_group_ids = [aws_security_group.my-sg.id]
    tags = {
        Name = "byterraform"
    }
}
