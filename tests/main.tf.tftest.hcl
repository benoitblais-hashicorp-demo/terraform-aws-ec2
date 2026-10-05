mock_provider "aws" {
  mock_resource "aws_vpc" {
    defaults = {
      id = "vpc-12345678"
    }
  }

  mock_resource "aws_subnet" {
    defaults = {
      id = "subnet-12345678"
    }
  }

  mock_resource "aws_security_group" {
    defaults = {
      id = "sg-12345678"
    }
  }

  mock_resource "aws_instance" {
    defaults = {
      id                           = "i-0123456789abcdef0"
      arn                          = "arn:aws:ec2:ca-central-1:123456789012:instance/i-0123456789abcdef0"
      ami                          = "ami-12345678"
      instance_type                = "t3.micro"
      availability_zone            = "ca-central-1a"
      subnet_id                    = "subnet-12345678"
      vpc_security_group_ids       = ["sg-12345678"]
      associate_public_ip_address  = true
      public_ip                    = "198.51.100.1"
      private_ip                   = "10.0.1.50"
      instance_state               = "running"
      primary_network_interface_id = "eni-0123456789abcdef0"
    }
  }

  mock_resource "aws_secretsmanager_secret" {
    defaults = {
      id  = "arn:aws:secretsmanager:ca-central-1:123456789012:secret:demo/linux/test-web-instance-123456"
      arn = "arn:aws:secretsmanager:ca-central-1:123456789012:secret:demo/linux/test-web-instance-123456"
    }
  }

  mock_resource "aws_secretsmanager_secret_version" {
    defaults = {
      id = "arn:aws:secretsmanager:ca-central-1:123456789012:secret:demo/linux/test-web-instance-123456|version-1"
    }
  }
}

mock_provider "random" {
  mock_resource "random_password" {
    defaults = {
      result = "mocked-random-linuxadmin-pw"
    }
  }
}

run "setup_networking" {
  command = apply

  module {
    source = "./tests/setup"
  }
}

run "apply_ec2_instance" {
  command = apply

  variables {
    aws_region                   = "ca-central-1"
    name                         = "test-web-instance"
    ami                          = "ami-12345678"
    instance_type                = "t3.micro"
    subnet_id                    = run.setup_networking.subnet_id
    vpc_security_group_ids       = [run.setup_networking.security_group_id]
    associate_public_ip_address  = true
    create_os_credentials_secret = true
    tags = {
      Environment = "test"
      Terraform   = "true"
    }
  }

  assert {
    condition     = output.id == "i-0123456789abcdef0"
    error_message = "Expected instance id output to match mocked id"
  }

  assert {
    condition     = output.public_ip == "198.51.100.1"
    error_message = "Expected public_ip output to match mocked public IP"
  }

  assert {
    condition     = output.os_credentials_secret_arn != null
    error_message = "Expected os_credentials_secret_arn output to be populated"
  }
}
