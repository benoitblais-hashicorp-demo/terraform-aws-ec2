output "vpc_id" {
  description = "The ID of the test VPC"
  value       = aws_vpc.this.id
}

output "subnet_id" {
  description = "The ID of the test subnet"
  value       = aws_subnet.this.id
}

output "security_group_id" {
  description = "The ID of the test security group"
  value       = aws_security_group.this.id
}
