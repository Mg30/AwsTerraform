resource "aws_subnet" "my_public_subnet" {
  vpc_id     = var.vpc_id
  cidr_block = cidrsubnet(var.vpc_cidr, var.public_subnet_newbits, var.public_subnet_netnum)
}

resource "aws_internet_gateway" "my_internet_gw" {
  vpc_id = var.vpc_id
}

resource "aws_route_table" "my_public_route_table" {
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_internet_gw.id
  }

}

resource "aws_route_table_association" "my_route_table_association" {
  route_table_id = aws_route_table.my_public_route_table.id
  subnet_id      = aws_subnet.my_public_subnet.id
}
