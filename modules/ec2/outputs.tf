output "elastic_ip_address" {
  value       = aws_eip.static_ip.public_ip
  description = "La IP Elástica asignada a la instancia"
}