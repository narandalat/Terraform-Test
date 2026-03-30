variable "instance_count" {
  description = "Número de instancias a crear"
  default     = 1
}

variable "instance_type" {
  description = "Tipo de instancia EC2"
  default     = "t2.micro"
}