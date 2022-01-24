variable "ami" {
  type    = string
  default = "ami-08ee6644906ff4d6c"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "tags" {
  type = map(string)
  default = {
    "Name" = "terraform_variable"
  }
}
