/*
data "aws_route53_zone" "são_paulo_r53" {
  name         = "example.com"  # The domain name you want to look up
  private_zone = false
}


resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.são_paulo_r53.zone_id
  name    = "example.com"
  type    = "A"

  alias {
    name                   = aws_lb.são_paulo_lb.dns_name
    zone_id                = aws_lb.são_paulo_lb.zone_id
    evaluate_target_health = true
  }
}
*/