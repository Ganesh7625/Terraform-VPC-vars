resource "aws_subnet" "publicSubnet" {
  count = "${length(data.aws_availability_zones.azs.names)}"
  availability_zone = "${element(data.aws_availability_zones.azs.names, count.index)}"
  vpc_id = "${aws_vpc.DemoVPC.id}"
  cidr_block = "${element(var.subnet_cidr_public, count.index)}"
  
  tags = {
    Name = "PublicSubnet-${count.index+1}"
  }
}

resource "aws_subnet" "privateSubnet" {
  count = "${length(data.aws_availability_zones.azs.names)}"
  availability_zone = "${element(data.aws_availability_zones.azs.names, count.index)}"
  vpc_id = "${aws_vpc.DemoVPC.id}"
  cidr_block = "${element(var.subnet_cidr_private, count.index)}"
  
  tags = {
    Name = "PrivateSubnet-${count.index+1}"
  }
}