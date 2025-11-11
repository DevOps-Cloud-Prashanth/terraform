resource "aws_instance" "name" {
  ami="ami-0cae6d6fe6048ca2c" 
  instance_type = "t3.micro"
  tags = {
    Name = "prashanth"
  }

}

resource "aws_s3_bucket" "name" {
    bucket = "tybuwbdsjbcgvggyvscjanand"
    provider = aws.oregon
  
}


#this is multi providers concept and it create two resouces in two diffrent regions