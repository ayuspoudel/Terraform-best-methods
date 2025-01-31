variable "instance_type"{
    description = "This variables specifies the instance type eg t2.micro"
    type = string
}

variable "ami_ubuntu"{
    description = "This variable specifies the AMI id for starting instance"
    type = string
}

variable "instance_name"{
    description = "This sets the name of the instance"
    type = string
}

variable "number_of_instances"{
    description = "This sets the number of instances to be launched"
    type = string
}