variable "env" {
    type = list(string)
    default = [ "dev","test","prod"]
  
}

resource "aws_instance" "name" {
    ami ="ami-0cae6d6fe6048ca2c"
    instance_type = "t3.micro"
    for_each = toset(var.env) 
    # tags = {
    #   Name = "dev"
    # }
  tags = {
      Name = each.value
    }
}

#here if  we run this code 3 instances will create and if we delete test or remove from here and after applying 
#terraform apply only test will delete not prod because we are  here using for_each and "list(string)"
#values are here "dev" "test" "prod"