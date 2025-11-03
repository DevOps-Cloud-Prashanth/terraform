module "name" {
  source = "../day7 module"
  ami = "ami-01760eea5c574eb86"
  instance_type = "t3.micro"

} 



  #if we want any code from another folder we use module in terraform 
  # reusable
