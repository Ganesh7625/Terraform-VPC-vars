resource "aws_eip" "ElaticIP"{
  depends_on = [aws_internet_gateway.terraform-igw]
  tags = {
    Name = "TerraformElasticIP"
  }
}

resource "aws_nat_gateway" "terraformNAT" {
  allocation_id = aws_eip.ElaticIP.id
  subnet_id = "${element(aws_subnet.publicSubnet.*.id, 0)}"
  tags = {
    Name = "Terraform NAT"
  }
}