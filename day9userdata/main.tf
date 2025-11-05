resource "aws_instance" "name" {
    ami = var.ami
    associate_public_ip_address = true
    instance_type = var.instance_type
    tags = {
      Name ="aws-instance"
    }
}