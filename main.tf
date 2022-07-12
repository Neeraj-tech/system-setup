provider "aws" {
region = "ap-south-1"
profile = "default"
}
resource "aws_instance" "controller" {
ami = "ami-068257025f72f470d"
instance_type = "t2.micro"
key_name = "EC2new"
security_groups = ["launch-wizard-2"]
tags = {
Name = "Controller"
}
}
output "controller_ip" {
  value = aws_instance.controller.public_ip
}

output "controller_zone" {
  value = aws_instance.controller.availability_zone
}

