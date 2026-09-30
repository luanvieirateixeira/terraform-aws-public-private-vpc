resource "aws_instance" "EC2-Terraform-public" {
  ami                         = "ami-0b6d9d3d33ba97d99"
  instance_type               = "t3.micro"
  key_name                    = data.aws_key_pair.terraform-key.key_name
  subnet_id                   = var.subnet_public_id_vpc
  security_groups             = [var.sg_id_public_vpc]
  associate_public_ip_address = true
  availability_zone           = "us-east-1a"

  root_block_device {
    volume_size = 9
    volume_type = "gp3"
  }

  user_data = <<-EOF
#!/bin/bash
exec > /var/log/user-data.log 2>&1

# Aguarda a rede e tenta atualizar com fallback de mirrors
for i in {1..5}; do
  apt-get update -y && break || sleep 5
done

apt-get install -y ca-certificates curl gnupg

# Instalação limpa pelo repositório oficial Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

systemctl enable --now docker
usermod -aG docker ubuntu
EOF

  tags = {
    Name = "EC2-publica-Terraform"
  }
}

resource "aws_instance" "EC2-Terraform-private" {
  ami               = "ami-0b6d9d3d33ba97d99"
  instance_type     = "t3.micro"
  key_name          = data.aws_key_pair.terraform-key.key_name
  subnet_id         = var.subnet_private_id_vpc
  security_groups   = [var.sg_id_private_vpc]
  availability_zone = "us-east-1a"

  root_block_device {
    volume_size = 9
    volume_type = "gp3"
  }

  user_data = <<-EOF
#!/bin/bash
exec > /var/log/user-data.log 2>&1

# Aguarda a rede e tenta atualizar com fallback de mirrors
for i in {1..5}; do
  apt-get update -y && break || sleep 5
done

apt-get install -y ca-certificates curl gnupg

# Instalação limpa pelo repositório oficial Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

systemctl enable --now docker
usermod -aG docker ubuntu
EOF

  tags = {
    Name = "EC2-privada-Terraform"
  }
}

data "aws_key_pair" "terraform-key" {
  key_name = "terraform-teste"
}