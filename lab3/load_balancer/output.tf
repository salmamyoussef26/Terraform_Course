output "public-LB-arn"{
    value = tomap({
    for k, inst in aws_lb.public_load_balancer : k => inst.arn
  })
}

output "private-LB-arn"{
    value = tomap({
    for k, inst in aws_lb.private_load_balancer : k => inst.arn
  })
}

output "private-LB-dns"{
    value = tomap({
    for k, inst in aws_lb.private_load_balancer : k => inst.dns_name
  })
}