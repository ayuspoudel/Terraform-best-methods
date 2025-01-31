provider "aws"{
    region = "us-east-1"
}

resource "aws_vpc" "staging-vpc"{
    cidr_block = var.cidr_block_vpc
    tags = {
        Name = "${local.staging_env}-vpc"
    }
}

resource "aws_subnet" "staging_subnet"{
    vpc_id = aws_vpc.staging-vpc.id
    cidr_block = var.cidr_block_subnet
    tags = {
      Name = "${local.staging_env}-subnet"
    }
}

resource "aws_instance" "staging_instance"{
    ami = var.ami_ubuntu
    subnet_id = aws_subnet.staging_subnet.id
    instance_type = var.instance_type
    tags = {
      Name = "${local.staging_env}-instance"
    }
}



