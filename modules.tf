module "vpc" {
  source = "./network"
}

module "ec2" {
  source = "./instancia"

  subnet_public_id_vpc  = module.vpc.subnet_public_id_terraform
  subnet_private_id_vpc = module.vpc.subnet_private_id_terraform
  sg_id_public_vpc      = module.vpc.security_group_public_id_terraform
  sg_id_private_vpc     = module.vpc.security_group_private_id_terraform
}