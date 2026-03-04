terraform {
  backend "s3" {
    bucket = "terraform-state-jnadyr"
    key    = "homolog/terraform.tfstate"
    region = "us-east-2"
  }
}
