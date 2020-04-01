output "public_subnet_id" {
  value       = aws_subnet.my_public_subnet.id
  description = "The public IP of instances created"
}