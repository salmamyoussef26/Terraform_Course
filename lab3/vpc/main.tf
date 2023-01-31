resource "aws_vpc" "my-vpc" {
  cidr_block = var.vpc-cidr

  tags = {
    Name = "my-vpc-01"
  }
}

# resource "aws_subnet" "subnet"{
#     vpc_id = aws_vpc.my-vpc.id

#     for_each = var.subnet-info
#     cidr_block = each.value["cidr"]
    
#     availability_zone = each.value["az"]
#     tags = {
#         Name = each.value["name"]
#     }
# }