terraform {
  backend "s3" {
    bucket = "ihihiibucket1aws"
    key    = "day-2/terraform.tfstate"
    region = "ap-south-1"
  }
}