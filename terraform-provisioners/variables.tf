variable "cidr_block_vpc" {
  default = "10.0.0.0/16"
  type    = string
}

variable "cidr_block_subnet" {
  default = "10.0.0.0/20"
  type    = string
}

variable "instance_type_basic" {
  default = "t2.micro"
  type    = string
}


variable "key_pair_value" {
  type        = string
  description = "This specifies where to download keypair generated"
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC5aHzxutIjoC1SvovMW5HQIsswk4+yRKmkoSQYw5UmVmWjZ0S3cm9gV+QQInvXY+JdRyy5j/yzpkH+ZaraF3/XfHKhiVLy3ZF7rYgw7lzj0kcbOVUWtZLQSWfJXdL74H6pNHXAwjnLQqXHAPDjN39zW9sRYfYIPgRGy5HEmhIVT5uowU75UUrK/WxIU32LBurRhAIXnVZp4IjLCeDml8uX6zMkwnQTxfFcm6JAeSPSGewrUU+ilvMgtjyrek++YaLDc4tiBraMAzGuUM12taRmJm3y707SsjqI/ApwfbkjY1KC5Cp2L+EPc18PujMskuAxvkpxtkXP+f2yzJn7PpRT ayushpoudel@Ayushs-MBP.lan
"
}
variable "key_pair_name" {
  type        = string
  description = "This specifies where to download keypair generated"
  default     = "aws_key_provisioner"
}
variable "aws_ubuntu_ami_id" {
  default     = "ami-0c614dee691cbbf37"
  description = "AMI ID for ubuntu image"
  type        = string
}