resource "aws_instance" "name" {
  ami           = "ami-01760eea5c574eb86"
  count         = 1
  instance_type = "t3.micro"
  tags = {
    Name = "public-ec2"
  }


  lifecycle {
    create_before_destroy = true  #before destroy it will create a new resouces command to check #terraform destroy
  }
   lifecycle {
     ignore_changes = [ instance_type ]    #for specific changes will ignore #terraform apply
   }
  lifecycle {
    prevent_destroy = true     #it will prevent the rresources to not delete #terraform destroy 
  }

}
    
