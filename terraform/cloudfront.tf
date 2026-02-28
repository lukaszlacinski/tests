resource "aws_cloudfront_distribution" "app" {
  enabled             = true
  is_ipv6_enabled     = true
  comment             = "${local.name_prefix}-cloudfront"
  default_root_object = ""

  origin {
    domain_name = aws_lb.app.dns_name
    origin_id   = "${local.name_prefix}-alb"

    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["TLSv1.2"]
    }
  }

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "${local.name_prefix}-alb"

    viewer_protocol_policy = "redirect-to-https"
    compress               = true

    forwarded_values {
      query_string = true
      headers      = ["Host"]
      cookies {
        forward = "all"
      }
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  aliases = var.app_domain_name != null ? [var.app_domain_name] : []

  viewer_certificate {
    acm_certificate_arn            = var.app_domain_name != null ? var.acm_certificate_arn : null
    ssl_support_method             = var.app_domain_name != null ? "sni-only" : null
    minimum_protocol_version       = "TLSv1.2_2021"
    cloudfront_default_certificate = var.app_domain_name == null
  }
}
