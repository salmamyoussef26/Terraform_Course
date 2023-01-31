resource "aws_vpc" "my-vpc" {
  cidr_block = var.vpc-cidr

  tags = {
    "Name" = var.vpc-name
  }
}