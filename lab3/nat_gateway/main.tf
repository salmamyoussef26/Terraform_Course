resource "aws_eip" "my-eip" {
  vpc = true
}

resource "aws_nat_gateway" "my-nat-gateway"{
  allocation_id = aws_eip.my-eip.id
  //for_aach
  subnet_id = var.subnet-id

  tags = {
    Name = var.nat-name
  }
  depends_on = [var.net-id]
}