resource "aws_lb" "app" {
  name               = var.lb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb.id]
  subnets            = var.subnets
}

resource "aws_lb_target_group" "app" {
  name     = var.tg_name
  port     = 8080
  protocol = "HTTP"
  target_type = "ip"
  vpc_id   = var.vpc_id
  health_check {
    path = "/health"
  }
}

resource "aws_lb_listener" "app" {
  load_balancer_arn = aws_lb.app.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app.arn
  }
}
