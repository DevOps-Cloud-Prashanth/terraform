#####################################
# Outputs
#####################################

# VPC ID
output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}

# Public Subnet IDs
output "public_subnet_ids" {
  description = "IDs of all public subnets"
  value       = [
    aws_subnet.public_1.id,
    aws_subnet.public_2.id
  ]
}

# Private Subnet IDs
output "private_subnet_ids" {
  description = "IDs of all private subnets"
  value       = [
    aws_subnet.private_1.id,
    aws_subnet.private_2.id
  ]
}

# Example: Public Instance IPs
output "public_instance_public_ip" {
  description = "Public IP of the EC2 instance in public subnet"
  value       = aws_instance.public_instance.public_ip
}

output "public_instance_private_ip" {
  description = "Private IP of the EC2 instance in public subnet"
  value       = aws_instance.public_instance.private_ip
}

# Example: Private Instance IPs
output "private_instance_private_ip" {
  description = "Private IP of the EC2 instance in private subnet"
  value       = aws_instance.private_instance.private_ip
}
