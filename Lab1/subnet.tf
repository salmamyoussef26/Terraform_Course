resource "aws_subnet" "public_subnet_tf" {
  vpc_id     = "vpc-097ef18d99b03a966"
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "my-public-subnet"
  }
}