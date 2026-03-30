output "vpc_id" {
  value = aws_vpc.main.id # Asegurate que 'main' coincida con el nombre de tu recurso vpc
}

output "web_sg_id" {
  value = aws_security_group.web_sg.id
}