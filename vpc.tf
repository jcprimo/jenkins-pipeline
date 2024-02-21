resource "aws_vpc" "jenkins-server-vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "${var.env_prefix}-vpc"
  }
}
resource "aws_subnet" "jenkins-server-subnet-1" {
  vpc_id = aws_vpc.jenkins-server-vpc.id
  cidr_block = var.subnet_cidr_block
  availability_zone = var.availability_zone
  tags = {
    Name = "${var.env_prefix}-subnet-1"
  }
}
resource "aws_internet_gateway" "jenkins-server-igw" {
  vpc_id = aws_vpc.jenkins-server-vpc.id
  tags = {
    Name = "${var.env_prefix}-igw"
  }
}
resource "aws_default_route_table" "main-rtbl" {
  default_route_table_id = aws_vpc.jenkins-server-vpc.default_route_table_id
  route{
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.jenkins-server-igw.id
  }
  tags = {
    Name = "${var.env_prefix}-main-rtbl"
  }
}

resource "aws_default_security_group" "jenkins-sg" {
  vpc_id = aws_vpc.jenkins-server-vpc.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name="${var.env_prefix}-jenkins-sg"
  }
}