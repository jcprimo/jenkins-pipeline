output "ec2_public_ip" {
  value = aws_instance.jenkins-server.public_ip
}