resource "aws_route_table" "tfrt" {
  vpc_id       = "${aws_vpc.tfvpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.tfigw.id}"
  }
  tags         = {
    Name = "mytfrt"
  }
}

resource "aws_route_table_association" "tfrt-assoc" {
  subnet_id      = "${aws_subnet.tfsub.id}"
  route_table_id = "${aws_route_table.tfrt.id}"
}