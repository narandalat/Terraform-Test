variable "instance_count" {
  description = "Número de instancias a crear"
  default     = 1
}

variable "instance_type" {
  description = "Tipo de instancia EC2"
  default     = "t2.micro"
}

# variables.tf (Raíz)
variable "key_name" {
  description = "Nombre de la key en AWS"
  type        = string
}