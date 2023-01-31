resource "aws_internet_gateway" "gw_tf" {
  vpc_id = "vpc-097ef18d99b03a966"

  tags = {
    Name = "my_internet_gateway"
  }
}