resource "aws_subnet" "tfsub" {
  vpc_id                  = "${aws_vpc.tfvpc.id}"
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = "true" 
  availability_zone       = "us-east-1a"
  tags                    = {
    Name = "mytfsub"
  }
}