resource "aws_route_table" "PublicRoute" {
  vpc_id = "${aws_vpc.DemoVPC.id}"

  route {
    cidr_block = "${var.route_table_cidr_public}"
    gateway_id = "${aws_internet_gateway.terraform-igw.id}"
  }
  tags = {
    Name = "Public RT"
  }
}

resource "aws_route_table" "PrivateRoute" {
  vpc_id = "${aws_vpc.DemoVPC.id}"
  route {
    cidr_block = "${var.route_table_cidr_private}"
    gateway_id = "${aws_nat_gateway.terraformNAT.id}"
  }
  tags = {
    Name = "Private RT"
  }
}


resource "aws_route_table_association" "public" {
  count          = "${length(var.subnet_cidr_public)}"
  subnet_id      = "${element(aws_subnet.publicSubnet.*.id, count.index)}"
  route_table_id = "${aws_route_table.PublicRoute.id}"
}

resource "aws_route_table_association" "private" {
  count          = "${length(var.subnet_cidr_private)}" 
  subnet_id      = "${element(aws_subnet.privateSubnet.*.id, count.index)}"
  route_table_id = "${aws_route_table.PrivateRoute.id}"
}
