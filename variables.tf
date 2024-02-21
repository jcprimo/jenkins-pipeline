#variables.tf
variable "vpc_cidr_block" {
  type = string
  description = "Set the CIDR block for VPC"
}
variable "subnet_cidr_block" {
  type = string
  description = "Set the CIDR block for subnet"
}
variable "availability_zone" {
  type = string
  description = "Set the AWS availability region"
}
variable "env_prefix" {
  type = string
  description = "Set dev|test|prod Based on desired environment"
}
variable "instance_type" {
  type = string
  description = "Set the desired instance type for AWS EC2 instance"
}

variable "region" {
  type = string
  description = "AWS default region"
}