provider "aws" {
    region = "us-east-1"
}

# Variable for Instance Type
variable "instance_type_config" {
    type        = string
    description = "This sets the instance type to t2.micro"
    default     = "t2.micro"
}

# Variable for Instance Count
variable "instance_count" {
    type    = number
    default = 1
}

# Variable for Monitoring
variable "monitoring" {
    description = "Enable or disable monitoring"
    default     = false
    type        = bool
}

# Variable for Availability Zones
variable "availability_zone" {
    type        = list(string)
    description = "Availability zones"
    default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

# Variable for AMI IDs
variable "instance_ami" {
    type = map(string)
    default = {
        us-east-1 = "ami-12345677"
        us-west-1 = "ami-123423421"
    }
    description = "Various AMI IDs for different regions"
}

# Object Variable for EC2 Configuration
variable "ec2_configuration" {
    type = object({
        name               = string
        ami                = map(string)
        availability_zone  = list(string)
        instance_type      = string
        instance_count     = number
        monitoring         = bool
    })
    default = {
        name              = "terraform_instance"
        ami               = {
            us-east-1 = "ami-0c614dee691cbbf37"
            us-west-1 = "ami-0c614dee691cbbf37"
        }
        availability_zone = ["us-east-1a", "us-east-1b", "us-east-1c"]
        instance_type     = "t2.micro"
        instance_count    = 1
        monitoring        = false
    }
}

# AWS Instance Resource
resource "aws_instance" "my_instance" {
    count             = var.ec2_configuration.instance_count
    instance_type     = var.ec2_configuration.instance_type
    ami               = var.ec2_configuration.ami["us-east-1"]
    monitoring        = var.ec2_configuration.monitoring
    availability_zone = var.ec2_configuration.availability_zone[0]

    tags = {
        Name = var.ec2_configuration.name
    }
}
