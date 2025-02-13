output "instance_public_ip" {
  description = "The public IP address of the instance"
  value       = aws_instance.mock-instance.public_ip
}

output "instance_id" {
    description = "The ID of the EC2 instance"
    value = aws_instance.mock-instance.id
  
}
