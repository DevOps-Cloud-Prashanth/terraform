# variable "aws_region" {
#   description = "The region in which to create the infrastructure"
#   type        = string
#   nullable    = true
#   default     = "us-east-1" #here we need to define either us-west-1 or eu-west-2 if i give other region will get error 
#   validation {
#     condition = var.aws_region == "us-east-1" || var.aws_region == "eu-west-1"
#     error_message = "The variable 'aws_region' must be one of the following regions: us-west-2, eu-west-1"
#   }
# }

provider "aws" {
  region = "us-east-1"
  
}
#  }

#  resource "aws_s3_bucket" "dev" {
#     bucket = "statefile-configuresssgjgfiufgi"
    
  
# }

#after run this will get error like The variable 'aws_region' must be one of the following regions: us-west-2,│ eu-west-1, so it will allow any one region defined above in conditin block
#here if we put false here one bucket will create if we put true here that bucket will destroy create another one


### Example-2
# variable "create_bucket" {
#   type    = bool
#   default = true
# }

# resource "aws_s3_bucket" "example" {
#   count  = var.create_bucket ? 1 : 0
#   bucket = "my-terraform-example543653452"
# }

#here if we put true one bucket will create and if we put false nochanges will come


## Example-3
variable "environment" {
  type    = bool
  default = true
}

resource "aws_instance" "example" {
  count         = var.environment  ? 3 : 1
  ami           = "ami-0cae6d6fe6048ca2c"
  instance_type = "t3.micro"

  tags = {
    Name = "example-${count.index}"
  }
}

#here if we put false 0ne instance will create.destroy after creation
#if we put true and remove this (== "prod") and after run the code three instances will create

# #In this case:
# #If var.environment == "prod" → count = 3
# #Else (like dev, qa, etc.) → count = 1
# #terraform apply -var="environment=dev"