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