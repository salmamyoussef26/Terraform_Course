output "vpc-cidr-output"{
    value = aws_vpc.my-vpc.cidr_block
}

output "vpc-id-output"{
    value = aws_vpc.my-vpc.id
}