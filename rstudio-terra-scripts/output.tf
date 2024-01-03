output instance_public_ip {
  value       = aws_instance.app_server1.associate_public_ip_address
  description = "instance public ip"
}

output instance_public_dns {
  value       = aws_instance.app_server1.public_dns
  description = "instance public ip"
}
