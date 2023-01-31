output "public-ec2-ids"{
    value = tomap({
    for k, inst in aws_instance.public_ec2s : k => inst.id
  })
}

output "public-ip-ec2"{
    value = tomap({
    for k, inst in aws_instance.public_ec2s : k => inst.public_ip
  })
}

# output "private-ec2-ids"{
#     value = tomap({
#     for k, inst in aws_instance.private_ec2s : k => inst.id
#   })
# }