resource "aws_internet_gateway" "my-gw" {
  vpc_id = aws_vpc.my-vpc.id

  tags = {
    "Name" = var.internet-gateway-name
  }
}

//route: 0.0.0.0/0 => net gateway
resource "aws_route_table" "route-table-for-public-subnet" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    cidr_block = var.rt-public-cidr
    gateway_id = aws_internet_gateway.my-gw.id
  }

  tags = {
    Name = var.rt-public-name
  }
}

//route_association with public subnet => index 0
resource "aws_route_table_association" "rt-public-subnet-association" {
  subnet_id      = aws_subnet.my-subnets[0].id
  route_table_id = aws_route_table.route-table-for-public-subnet.id
}


