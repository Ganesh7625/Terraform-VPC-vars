resource "aws_internet_gateway" "terraform-igw" {
  vpc_id = "${aws_vpc.DemoVPC.id}"
  
  tags = { 
    Name = "terrsform-igw"
    }
}