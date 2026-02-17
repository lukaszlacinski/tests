resource "aws_route53_record" "app" {
  count   = var.route53_zone_id != null && var.app_domain_name != null ? 1 : 0
  zone_id = var.route53_zone_id
  name    = var.app_domain_name
  type    = "A"

  alias {
    name                   = aws_lb.app.dns_name
    zone_id                = aws_lb.app.zone_id
    evaluate_target_health = true
  }
}
