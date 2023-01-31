output "sg-public-ec2-id"{
    value = aws_security_group.sg-public-ec2.id
}

output "sg-public-LB"{
    value = aws_security_group.sg-public-LB.id
}

output "sg-private-LB"{
    value = aws_security_group.sg-private-LB.id
}

output "sg-private-ec2-id"{
    value = aws_security_group.sg-private-ec2.id
}