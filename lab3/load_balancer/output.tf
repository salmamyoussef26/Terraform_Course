output "public-LB-arn"{
    value = tomap({
    for k, inst in aws_lb.public_load_balancer : k => inst.arn
  })
}