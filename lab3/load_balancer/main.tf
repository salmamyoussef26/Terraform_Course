resource "aws_lb" "public_load_balancer" {
  
  for_each = var.public-LB-info
  name               = each.value["name"]
  internal           = each.value["internal"]
  load_balancer_type = each.value["LB-type"]
  security_groups    = [each.value["sg-LB"]]
  subnets            = each.value["subnet-id"]

  tags = {
    Environment = "dev"
  }
}

//private
resource "aws_lb" "private_load_balancer" {
  for_each = var.private-LB-info
  name               = each.value["name"]
  internal           = each.value["internal"]
  load_balancer_type = each.value["LB-type"]
  security_groups    =[each.value["sg-LB"]]
  subnets            = each.value["subnet-id"] 

  tags = {
    Environment = "dev"
  }
}