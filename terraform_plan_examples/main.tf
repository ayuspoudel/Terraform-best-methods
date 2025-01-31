provider "aws"{
    region = "us-east-1"
}

resource "aws_instance" "my_instance"{
    instance_type = var.instance_type
    ami = var.ami_ubuntu
    count = var.number_of_instances
    tags = {
        Name = var.instance_name
    }
}