provider "aws" {
  region = "us-east-1"
}
locals {
  proj_name = "provisoner"
}

//create a vpc
resource "aws_vpc" "provisioner_vpc" {
  cidr_block = var.cidr_block_vpc

  tags = {
    Name = "${local.proj_name}-vpc"
  }
}

resource "aws_subnet" "provisioner-subnet" {
  cidr_block              = var.cidr_block_subnet
  vpc_id                  = aws_vpc.provisioner_vpc.id
  map_public_ip_on_launch = true
  tags = {
    Name = "${local.proj_name}-public-subnet"
  }
}
//create igw
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.provisioner_vpc.id
  tags = {
    Name = "${local.proj_name}-igw"
  }
}

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.provisioner_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "${local.proj_name}-routetable"

  }
}

#associating route table with subnet
resource "aws_route_table_association" "name" {
  subnet_id      = aws_subnet.provisioner-subnet.id
  route_table_id = aws_route_table.route_table.id

}

//attach igw to vpc


resource "aws_security_group" "provisioner-sg" {
  vpc_id = aws_vpc.provisioner_vpc.id
  name   = "${local.proj_name}-security-group"

  #allow ssh access
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] #from anywhere
  }
  #allow http/https access
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] #from anywhere
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] #from anywhere
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

//generating key-pair
resource "aws_key_pair" "generated_key" {
  key_name   = "${local.proj_name}-key-pair"
  public_key = "${var.key_pair_path}" # Path to my local SSH public key
}
output "key-pair-path" {
  value = aws_key_pair.generated_key.public_key
}

resource "aws_instance" "ec2_terraform" {
  ami             = var.aws_ubuntu_ami_id
  instance_type   = var.instance_type_basic
  key_name        = aws_key_pair.generated_key.key_name
  security_groups = [aws_security_group.provisioner-sg.id]
  subnet_id       = aws_subnet.provisioner-subnet.id
  tags = {
    Name = "${local.proj_name}-ec2-instance"
  }
}
output "instance-public-ip" {
  value = aws_instance.ec2_terraform.public_ip
}