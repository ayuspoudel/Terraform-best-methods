variable "cidr_block_vpc"{
    type = string
    description = ""
    default = "10.5.0.0/16"
}

variable "cidr_block_subnet"{
    type = string
    description = ""
    default = "10.5.0.0/20"
}

variable "ami_ubuntu"{
    type = string
    default = "ami-0c614dee691cbbf37"
}

variable "instance_type"{
    type = string
    default = "t2.micro"
}

variable "instance_name" {
    type = string
    default = "staging instance"
}
