resource "aws_route53_record" "app" {
  count   = var.route53_zone_id != null && local.domain_name != null ? 1 : 0
  zone_id = var.route53_zone_id
  name    = local.domain_name
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.app.domain_name
    zone_id                = "Z2FDTNDATAQYW2"
    evaluate_target_health = true
  }
}
