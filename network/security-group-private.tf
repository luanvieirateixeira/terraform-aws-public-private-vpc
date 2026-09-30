resource "aws_security_group" "security_group_terraform_private" {
  name        = "Security_group_terraform_private"
  description = "Permite conexao SSH e ICMP"
  vpc_id      = aws_vpc.vpc_terraform.id

  tags = {
    Name = "SG Terraform Privada"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_private" {
  security_group_id = aws_security_group.security_group_terraform_private.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_icmp_private" {
  security_group_id = aws_security_group.security_group_terraform_private.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = -1
  ip_protocol       = "icmp"
  to_port           = -1
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4_private" {
  security_group_id = aws_security_group.security_group_terraform_private.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}