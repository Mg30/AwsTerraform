output "all_public_ip" {
  value       = values(aws_instance.my_public_EC2)[*].public_ip
  description = "The public IP of instances created"
}