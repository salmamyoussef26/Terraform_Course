resource "aws_route_table" "route_table_tf" {
  vpc_id = "vpc-097ef18d99b03a966"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "igw-0c54f8036fb82821d"
  }

#   route {
#     ipv6_cidr_block        = "::/0"
#     egress_only_gateway_id = aws_egress_only_internet_gateway.example.id
#   }

  tags = {
    Name = "my_rout_table"
  }
}

resource "aws_route_table_association" "rt_asspciation" {
  subnet_id      = "subnet-0ce64dc89d0c60d14"
  route_table_id = "rtb-0332c292b815ac73d"
}