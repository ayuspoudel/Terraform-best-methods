variable "cidr_block_vpc"{
    default = "10.0.0.0/16"
    type = string
}

variable "cidr_block_subnet"{
    default = "10.0.1.0/20"
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