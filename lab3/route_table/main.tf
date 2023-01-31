resource "aws_route_table" "route_table" {
  for_each = var.rt-info
  vpc_id = each.value["vpc_id"]


  route {
    cidr_block = each.value["cidr"]
    gateway_id = each.value["gateway_id"]
  }

  tags = {
    Name = each.value["tag"]
  }
}

resource "aws_route_table_association" "rt_association" {
  for_each = var.rt-association
  subnet_id      = each.value["subnet_id"]
  route_table_id = each.value["rt_id"]
}