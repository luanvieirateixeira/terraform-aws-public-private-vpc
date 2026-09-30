variable "subnet_public_id_vpc" {
  description = "ID da subnet publica da VPC"
  type        = string
}

variable "subnet_private_id_vpc" {
  description = "ID da subnet privada da VPC"
  type        = string
}

variable "sg_id_public_vpc" {
  description = "ID do Security Group publico"
  type        = string
}

variable "sg_id_private_vpc" {
  description = "ID do Security Group privado"
  type        = string
}
