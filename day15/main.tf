provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "name" {
    ami = "ami-0fa3fe0fa7920f68e"
    instance_type = "t3.micro"
    tags = {
      Name = "webhook-jenkins"
    }
}
