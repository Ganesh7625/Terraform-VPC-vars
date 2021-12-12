resource "aws_vpc" "DemoVPC" {
  cidr_block = "${var.vpc_cidr}"
  instance_tenancy = "default"
  
  tags = { 
    Name = "Terraform-VPC"
  }
}