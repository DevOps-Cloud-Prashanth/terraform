# EC2 instance
resource "aws_instance" "name" {
  ami           = "ami-01760eea5c574eb86"
  instance_type = "t3.micro"
  count         = 1

  tags = {
    Name = "ec2-instance"
  }
}

# First S3 bucket (with ACL)
resource "aws_s3_bucket" "name1" {
  bucket = "my-unique-bucket-12345657875"   # Must be globally unique
  tags = {
    Name        = "target-resources-s3-bucket"
    Environment = "Production1"
  }
}

# Second S3 bucket (no ACL)
resource "aws_s3_bucket" "name2" {
  bucket = "my-unique-bucket-678905363"   # Must be globally unique
  tags = {
    Name        = "target-resources-s3"
    Environment = "Production2"
  }
}

#terraform init or terraform init -reconfigure #for intialization terraform -command
#terraform plan -target=aws_s3_bucket.name1 -target=aws_s3_bucket.name2 #for specific or target resourece -command
#terraform apply -target=aws_s3_bucket.name1 -target=aws_s3_bucket.name2 #for applying the specific or target resource