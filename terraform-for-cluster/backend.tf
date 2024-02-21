# where is the state file
terraform {
  backend "s3" {
    bucket = "primo-remote-state-file"
    region = "us-west-1"
    key = "eks/.terraform/terraform.tfstate"
  }
}