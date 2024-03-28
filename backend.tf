terraform {
  backend "s3" {
    bucket = "medusa-terraform-state"
    key    = "terraform"
    region = "ap-south-1"
  }
}
