resource "aws_instance" "name" {
  ami           = "ami-01760eea5c574eb86"
  count         = 1
  instance_type = "t3.micro"
  tags = {
    Name = "public-ec2"
  }


  lifecycle {
    create_before_destroy = true
  }
   lifecycle {
     ignore_changes = [ instance_type ]    
   }
  lifecycle {
    prevent_destroy = true
  }

}
    