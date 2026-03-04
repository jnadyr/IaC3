terraform {
  backend "s3" {
    bucket = "terraform-state-jnadyr"
    key    = "prod/terraform.tfstate"
    region = "us-east-2"
  }
}
