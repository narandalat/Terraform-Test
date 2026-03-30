data "aws_key_pair" "key" {
  key_name = var.key_name # Usamos una variable para que sea flexible
}

resource "aws_instance" "public_instance" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"
  key_name      = data.aws_key_pair.key.key_name
  user_data = file("${path.module}/scripts/userdata.sh")
  # ... resto de la config
}

# modules/ec2/main.tf

# ... (lo que ya tenés: resource "aws_instance" "public_instance") ...

# La IP Elástica (EIP)
resource "aws_eip" "static_ip" {
  instance = aws_instance.public_instance.id
  domain   = "vpc"
}

module "compute" {
  source             = "./modules/ec2"
  security_group_id  = module.network.web_sg_id # Esto conecta el sg.tf con la instancia
  # ... otras variables
}