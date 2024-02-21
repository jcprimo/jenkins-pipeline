#vpc
data "aws_availability_zones" "azs"{}

module "jenkins-server-vpc" {
  source            = "terraform-aws-modules/vpc/aws"
  name              = "jenkins-server-vpc"
  cidr              = var.vpc_cidr_block
  private_subnets   = var.private_subnet_cidr_blocks
  public_subnets    = var.public_subnet_cidr_blocks
  azs               = data.aws_availability_zones.azs.names

  enable_nat_gateway    = true
  single_nat_gateway    = true
  enable_dns_hostnames  = true

    tags = {
    "kubernetes.io/cluster/myjenkins-server-eks-cluster" = "shared"
  }

  public_subnet_tags = {
    "kubernetes.io/cluster/myjenkins-server-eks-cluster" = "shared"
    "kubernetes.io/role/elb"                  = 1
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/myjenkins-server-eks-cluster" = "shared"
    "kubernetes.io/role/internal-elb"         = 1
  }
}