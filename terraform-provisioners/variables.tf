variable "cidr_block_vpc"{
    default = "10.0.0.0/16"
    type = string
}

variable "cidr_block_subnet"{
    default = "10.0.0.0/20"
    type = string
}

variable "instance_type_basic"{
    default = "t2.micro"
    type = string
}


variable "key_pair_path"{
    type = string
    description = "This specifies where to download keypair generated"
    default = "~/.ssh/id_rsa.pub"  
}

variable "aws_ubuntu_ami_id" {
    default = "ami-0c614dee691cbbf37"
    description = "AMI ID for ubuntu image"
    type = string
}