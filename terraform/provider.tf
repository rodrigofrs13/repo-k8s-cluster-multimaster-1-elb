provider "aws" {
  region                  = "us-east-1"
  shared_credentials_file = "C:/Users/roee/.aws/credentials"
  profile                 = "default"
}

terraform {
  backend "s3" {
    bucket         = "remote-terraform-tfstate"
    key            = "descomplicandokubernetes/terraform.state"
    region         = "us-east-1" //não pode ser variavel
    profile        = "default"
    encrypt        = true
  }
}