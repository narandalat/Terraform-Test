# modules/ec2/variables.tf
variable "security_group_id" {
  description = "ID del security group que viene del modulo VPC"
  type        = string
}

variable "key_name" {
  description = "Nombre de la Key Pair para SSH"
  type        = string
}