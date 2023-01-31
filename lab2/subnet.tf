resource "aws_subnet" "my-subnets" {
  vpc_id     = aws_vpc.my-vpc.id
  cidr_block = var.subnet-cidrs[count.index]
  count = length(var.subnet-cidrs)
  
  tags = {
    "Name" = "${var.subnet-names[count.index]}"
  }
}




