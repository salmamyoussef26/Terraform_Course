output "public-ip-for-public-ec2"{
    value = aws_instance.public-ec2.public_ip
}