output "fgt-arn" {
  value = aws_instance.fgt.arn
}

output "fgt-instance-id" {
  value = aws_instance.fgt.id
}

output "public_ip" {
  value = aws_instance.fgt.public_ip
}

output "ami" {
  value = aws_instance.fgt.ami
}

output "az" {
  value = aws_instance.fgt.availability_zone
}

output "public_interface_ip" {
  value = aws_network_interface.public_intf.private_ip
}

output "private_interface_ip" {
  value = aws_network_interface.private_intf.private_ip
}