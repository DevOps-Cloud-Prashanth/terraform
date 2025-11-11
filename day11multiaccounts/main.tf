resource "aws_instance" "name" {
  ami="ami-07860a2d7eb515d9a" 
  instance_type = "t3.micro"

}

resource "aws_s3_bucket" "name" {
    bucket = "tybuwbdsjbcscjPrashanth"
    provider = aws.mumbai
  
}
#its used to create resource in existing and  resource from another account or two accounts configure with one developer to create resources from both accounts
