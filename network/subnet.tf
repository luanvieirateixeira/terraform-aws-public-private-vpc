resource "aws_subnet" "subnet_private_1a" {
  vpc_id            = aws_vpc.vpc_terraform.id
  cidr_block        = var.cidr_subnet_private
  availability_zone = "us-east-1a"

  tags = {
    Name = "subnet-private-terraform"
  }
}

resource "aws_route_table_association" "associon_subnet-private-1a" {
  subnet_id      = aws_subnet.subnet_private_1a.id
  route_table_id = aws_route_table.terraform_private-route-table.id
}

resource "aws_subnet" "subnet_public_1a" {
  vpc_id                  = aws_vpc.vpc_terraform.id
  cidr_block              = var.cidr_subnet_public
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "subnet-public-terraform"
  }
}

resource "aws_route_table_association" "associon_subnet-public-1a" {
  subnet_id      = aws_subnet.subnet_public_1a.id
  route_table_id = aws_route_table.terraform_public-route-table.id
}