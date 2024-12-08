resource "aws_lb" "são_paulo_lb" {
  name               = "sao-paulo-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.são_paulo_sg02_lb01.id]
  subnets = [
    aws_subnet.public_sa_east_1a.id,
    aws_subnet.public_sa_east_1b.id,
    aws_subnet.public_sa_east_1c.id
  ]

  tags = {
    name     = "são_paulo_lb"
    service  = "load balancer for São Paulo"
    owner    = "pipline-plumbers"
    location = "São Paulo"
  }
}

resource "aws_lb_listener" "são_paulo_lb_listener" {
  load_balancer_arn = aws_lb.são_paulo_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.são_paulo_tg.arn
  }
}

output "lb_dns_name" {
  value       = aws_lb.são_paulo_lb.dns_name
  description = "The DNS name of the São Paulo Load Balancer."

}