resource "aws_subnet" "subnet"{

    vpc_id = var.vpc-id
    for_each = var.subnet-info
    cidr_block = each.value["cidr"]
    
    availability_zone = each.value["az"]
    tags = {
        Name = each.value["name"]
    }
}

