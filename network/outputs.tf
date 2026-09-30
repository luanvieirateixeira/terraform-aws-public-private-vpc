output "subnet_public_id_terraform" {
  description = "ID da Subnet"
  value       = aws_subnet.subnet_public_1a.id
}

output "subnet_private_id_terraform" {
  description = "ID da Subnet"
  value       = aws_subnet.subnet_private_1a.id
}

output "security_group_public_id_terraform" {
  description = "ID do Security Group"
  value       = aws_security_group.security_group_terraform_public.id
}

output "security_group_private_id_terraform" {
  description = "ID do Security Group"
  value       = aws_security_group.security_group_terraform_private.id
}