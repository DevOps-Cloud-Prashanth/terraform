resource "aws_vpc" "name" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name= "dev-vpc"
  }
}

resource "aws_subnet" "name" {
    vpc_id = aws_vpc.name.id
    cidr_block = "10.0.0.0/24"
    tags = {
      Name= "mysubnet"
    }
  
}

resource "aws_instance" "name" {
    
    ami = var.ami
    associate_public_ip_address = true
    instance_type = var.instance_type
    subnet_id = aws_subnet.name.id
    tags = {
      Name= "terraform-instance"
    }
}