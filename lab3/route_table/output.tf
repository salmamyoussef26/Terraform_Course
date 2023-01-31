output "rt-id"{
    value = tomap({
    for k, inst in aws_route_table.route_table : k => inst.id
  })
}