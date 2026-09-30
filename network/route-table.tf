resource "aws_route_table" "terraform_public-route-table" {
  vpc_id = aws_vpc.vpc_terraform.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terraform_igw.id
  }

  tags = {
    Name = "terraform-pub-route_table"
  }
}

resource "aws_route_table" "terraform_private-route-table" {
  vpc_id = aws_vpc.vpc_terraform.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.terraform_ngw.id
  }

  tags = {
    Name = "terraform-priv-route_table"
  }
}