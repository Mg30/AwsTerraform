output "public_ip" {
  value       = aws_instance.MyPublicEC2.public_ip
  description = "The public IP of the instance"
}