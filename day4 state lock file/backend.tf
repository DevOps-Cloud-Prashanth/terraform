terraform {
  backend "s3" {
    bucket = "prashanthbucccket"
    key    = "day-4/terraform.tfstate"
    region = "ap-south-1"
  }
}
