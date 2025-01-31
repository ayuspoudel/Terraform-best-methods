/*
    There are three types of loops in TF:
        1. Count
        2. for_each
        3. for
*/

provider "aws" {
    region = "us-east-1"
}

# Creating IAM users using count
resource "aws_iam_user" "user_aws" {
    count = length(var.usernames)
    name  = var.usernames[count.index] # Iterating over usernames list
}

variable "usernames" {
    type    = list(string)
    default = ["ayush", "ankeeta", "ashutosh"]
}

variable "user_phone_info" {
    type = map(string)
    default = {
        "ayush"     = "+16562247227"
        "ankeeta"   = "+977984059783"
        "ashutosh"  = "+9779841993875"
    }
}

# Corrected locals block
locals {
    phone_numbers = values(var.user_phone_info) # Extracting only values (list of phone numbers)
    user_names    = keys(var.user_phone_info)  # Extracting keys (list of usernames)
}

# Corrected output block using for_each
output "user_names_phone_num" {
    value = { for user, phone in var.user_phone_info : user => phone } # Iterating over the map to create key-value pairs
}
