resource "aws_vpc" "vpc_terraform" {
  cidr_block = var.cidr_vpc

  tags = {
    Name = "VPC-terraform"
  }
}
