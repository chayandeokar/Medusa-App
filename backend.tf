terraform {
  backend "s3" {
    bucket = "medusa-terraform-states"
    key    = "terraform"
    region = "ap-south-1"
  }
}
