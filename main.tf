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