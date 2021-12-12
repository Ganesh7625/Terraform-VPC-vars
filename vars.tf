variable "region" {
    default = "ap-south-1"
}

# variable "azs" {
#   type = list
#   default = ["ap-south-1a", "ap-south-1b", "ap-south-c"]
# }

data "aws_availability_zones" "azs" {}

variable "vpc_cidr" {
    default = "10.0.0.0/16"
}

variable "subnet_cidr_public" {
  type = list
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "subnet_cidr_private" {
  type = list
  default = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

variable "route_table_cidr_public" {
  default = "0.0.0.0/0"
}

variable "route_table_cidr_private" {
  default = "0.0.0.0/0"
}
