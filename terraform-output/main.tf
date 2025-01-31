provider "aws"{
    region = "us-east-1"
}

resource "aws_vpc" "staging_vpc"{
    cidr_block = var.cidr_block_vpc
    tags = {
      Name = "${local.environment}${var.vpc_name}"
    }
}

resource "aws_subnet" "staging_subnet" {
    cidr_block = var.cidr_block_subnet 
    vpc_id = aws_vpc.staging_vpc.id
    map_public_ip_on_launch = var.public_id_subnet
    tags = {
      Name = "${local.environment}${var.subnet_name}"
    }
}

resource "aws_instance" "staging_ec2"{
    instance_type = local.instance_type
    ami = var.ami_ubuntu
    subnet_id = aws_subnet.staging_subnet.id
    user_data = file("${local.user_data}")
    
    tags = {
      Name = "${local.environment}${var.instance_name}"
    }
}