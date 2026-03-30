# 1. Buscamos la imagen oficial de Ubuntu 24.04
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # ID oficial de Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }
}

# 2. Buscamos tu llave física en AWS
data "aws_key_pair" "key" {
  key_name = var.key_name 
}

# 3. Creamos la instancia
resource "aws_instance" "public_instance" {
  ami           = data.aws_ami.ubuntu.id 
  instance_type = "t2.micro"
  key_name      = data.aws_key_pair.key.key_name
  user_data     = file("${path.module}/scripts/userdata.sh")
  vpc_security_group_ids = [var.security_group_id]
  tags = {
    Name = "svc.miprueba.com.ar"
  }
}
# ... (lo que ya tenés: resource "aws_instance" "public_instance") ...

# La IP Elástica (EIP)
resource "aws_eip" "static_ip" {
  instance = aws_instance.public_instance.id
  domain   = "vpc"
}