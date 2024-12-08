resource "aws_lb_target_group" "são_paulo_tg" {
  name        = "pipeline-plumbers-target-group"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.são_paulo_vpc.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    name     = "são_paulo_tg"
    service  = "target group for São Paulo"
    owner    = "pipline-plumbers"
    location = "São Paulo"
  }
}