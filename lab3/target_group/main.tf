resource "aws_lb_target_group" "tg" {
  for_each = var.tg-info
  name     = each.value["name"]
  port     = each.value["port"]
  protocol = each.value["protocol"]
  vpc_id   = each.value["vpc-id"]
}

resource "aws_lb_target_group_attachment" "registered-targets" {
  for_each = var.tg-attachment
  target_group_arn = each.value["tg-arn"]
  target_id        = each.value["ec2-id"]
  port             = each.value["port"]
}

resource "aws_lb_listener" "public-listener" {
  
  for_each = var.public-listener-info
  load_balancer_arn = each.value["LB_arn"]
  port              = each.value["port"]
  protocol          = each.value["protocol"]

  default_action {
    type             = each.value["type"]
    target_group_arn = each.value["tg-arn"]
  }
}
//private listener