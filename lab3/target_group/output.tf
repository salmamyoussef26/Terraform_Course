output "tg-arn"{
    value = tomap({
    for k, inst in aws_lb_target_group.tg : k => inst.arn
  })
}
