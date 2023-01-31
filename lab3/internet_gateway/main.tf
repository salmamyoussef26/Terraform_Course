resource "aws_internet_gateway" "my-net-gw" {
  vpc_id = var.vpc-id

  tags = {
    Name = var.internet-gateway-name
  }
}