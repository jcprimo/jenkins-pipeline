#backend.tf defines where the state file lives.
terraform {
  backend "s3" {
    bucket = "primo-remote-state-file"
    region = "us-west-1"
    key = "jenkins-pipeline/.terraform/terraform.tfstate"
  }
}