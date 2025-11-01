resource "aws_instance" "name" {
  ami = "ami-01760eea5c574eb86"
  instance_type = "t3.micro"
  tags = {
    Name = "ec2-1"
  }
}


#terraform import resource.name resouce id or resouce name #this command is used to import any resources from aws console through terraform

                           #examples 1.instance,2.s3
#terraform import aws_instance.name i-010ab9de2cb0cbe71 #this command is used to import instance resources from aws console through terraform

#terraform import aws_s3_bucket prashanth12376576 #this command is used to import s3 resources from aws console through terraform
