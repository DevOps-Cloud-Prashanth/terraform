output "public_ip" {
  description = "Public Ip of INstance"
  value = aws_instance.name.public_ip
}
output "instance_private_ip" {
  description = "Public Ip of INstance"
  value = aws_instance.name.private_ip
}
output "availability_zone" {
  description = "Availability Zone"
  value = aws_instance.name.availability_zone
}

output "Name_Of_instance"{
value = aws_instance.name.tags["Name"]
}
  
