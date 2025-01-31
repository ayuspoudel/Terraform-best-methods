variable "cidr_block_vpc"{
    type = string
    description = "CIDR Block for VPC"
}

variable "cidr_block_subnet"{
    type = string
    description = "CIDR Block for VPC"
}


variable "instance_name"{
    type = string
    description = "Instance name derived from locals and terraform.tfvars"
}

variable "subnet_name"{
    type = string
    description = "VPC name derived from locals and terraform.tfvars"
}

variable "vpc_name"{
    type = string
    description = "VPC name derived from locals and terraform.tfvars"
}

variable "ami_ubuntu"{
    type = string
    description = "AMI ID from AWS to run basic ubuntu image"
}

variable "public_id_subnet"{
    type = bool
    description = "decides whether services within the subnet will have public id or not"
}