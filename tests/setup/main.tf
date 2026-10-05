resource "aws_vpc" "this" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "test-ec2-vpc"
  }
}

resource "aws_subnet" "this" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ca-central-1a"

  tags = {
    Name = "test-ec2-subnet"
  }
}

resource "aws_security_group" "this" {
  name        = "test-ec2-sg"
  description = "Security group for test EC2 instance"
  vpc_id      = aws_vpc.this.id
}
