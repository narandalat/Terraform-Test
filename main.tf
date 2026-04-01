resource "null_resource" "example" {
  triggers = {
    always_run = "${timestamp()}"
  }
}

module "network" {
  source = "./modules/vpc"
  # acá pasás las variables que necesite tu VPC
}

module "database" {
  source = "./modules/rds"
  vpc_id = module.network.vpc_id # Así conectás un módulo con otro
}

module "compute" {
  source             = "./modules/ec2"
  security_group_id  = module.network.web_sg_id # Esto conecta el sg.tf con la instancia
  key_name          = var.key_name             # La variable que ya tenés en Terraform Cloud
  subnet_id         = module.network.public_subnet_id
}
  # ... otras variables