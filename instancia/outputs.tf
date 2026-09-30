output "ip_adress_instance" {
  description = "Output para informar o IP Publico"
  value       = aws_instance.EC2-Terraform-public.public_ip
}