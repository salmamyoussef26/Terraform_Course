output "subnet_ids" {
  value = tomap({
    for k, inst in aws_subnet.subnet : k => inst.id
  })
}