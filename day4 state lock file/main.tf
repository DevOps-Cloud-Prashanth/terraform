# Create a VPC
resource "aws_vpc" "name" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "asdfghjkl"
  }
}

# Create a Subnet inside the VPC
resource "aws_subnet" "name" {
  vpc_id     = aws_vpc.name.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "ruchit"
  }
}



resource "aws_instance" "name" {
  ami = "ami-01760eea5c574eb86"
  instance_type = "t3.micro"
  count = 4
  tags = {
    Name = "instance"
  }
}
