resource "aws_eip" "terraform_ngw_eip" {
  domain = "vpc"

  tags = {
    Name = "elastic-ip-terraform"
  }
}

resource "aws_nat_gateway" "terraform_ngw" {
  allocation_id = aws_eip.terraform_ngw_eip.id
  subnet_id     = aws_subnet.subnet_public_1a.id

  tags = {
    Name = "terraform-ngw"
  }
}