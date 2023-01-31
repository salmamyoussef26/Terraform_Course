resource "aws_eip" "my-eip" {
  vpc = true
}

//nat gateway
resource "aws_nat_gateway" "my-nat-gateway" {
  allocation_id = aws_eip.my-eip.id
  subnet_id     = aws_subnet.my-subnets[0].id

  tags = {
    Name = var.nat-gateway-name
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.my-gw]
}

// route table for the private subnet 
// route: 10.0.0.0/24  => nat gateway
resource "aws_route_table" "route-table-for-private-subnet" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.my-nat-gateway.id
  }

  tags = {
    Name = var.rt-private-name 
  }
}

//route_association with private subnet => index 1
resource "aws_route_table_association" "rt-private-subnet-association" {
  subnet_id      = aws_subnet.my-subnets[1].id
  route_table_id = aws_route_table.route-table-for-private-subnet.id
}

//security group


