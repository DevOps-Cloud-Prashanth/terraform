# resource "aws_instance" "name" {
#     ami = "ami-0cae6d6fe6048ca2c"
#     instance_type = "t3.micro"
#     count = 2
#      tags = {
#         Name = "dev"      #here from 1 to 7 if we use terraform apply 2 instance will create with same name 
#      }
#   tags = {
#       Name = "dev-${count.index}"   #here 5 to 7 commended 1 to 11 if we apply terraform apply 2 instances will  created with count 0 and 1 example dev0 and dev1
#     }
# }

variable "env" {
    type = list(string)
    default = [ "dev" ,"test" ,"prod"]
  
}

resource "aws_instance" "name" {
    ami = "ami-0cae6d6fe6048ca2c"
    instance_type = "t3.micro"
    count = length(var.env)
    # tags = {
    #   Name = "dev"
    # }
  tags = {
      Name = var.env[count.index]
    }
 }

 #here above from 13 to 31 if we apply terraform apply 3 instances will create and after if we delete or remove test instance from 
 #default[test] here prod will delete because  here index is there so its start from 012 like that so prod will delete in console and test will renamed as prod
 #this is the main drawback of count