resource "aws_security_group" "security_group_terraform_public" {
  name        = "Security_group_terraform_public"
  description = "Permite conexao SSH, ICMP e trafego por toda internet"
  vpc_id      = aws_vpc.vpc_terraform.id

  tags = {
    Name = "SG Terraform Publica"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4_public" {
  security_group_id = aws_security_group.security_group_terraform_public.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_public" {
  security_group_id = aws_security_group.security_group_terraform_public.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4_public" {
  security_group_id = aws_security_group.security_group_terraform_public.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_vpc_security_group_ingress_rule" "allow_icmp_public" {
  security_group_id = aws_security_group.security_group_terraform_public.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = -1
  ip_protocol       = "icmp"
  to_port           = -1
}