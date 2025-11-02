resource "aws_acm_certificate" "lzb-cert" {
  domain_name       = "wallawalla.co.za"
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "cert_validation" {
  name    = tolist(aws_acm_certificate.lzb-cert.domain_validation_options)[0].resource_record_name
  type    = tolist(aws_acm_certificate.lzb-cert.domain_validation_options)[0].resource_record_type
  zone_id = var.zone_id
  records = [tolist(aws_acm_certificate.lzb-cert.domain_validation_options)[0].resource_record_value]
  ttl     = 60
}

resource "aws_acm_certificate_validation" "lzb-certificate" {
  certificate_arn         = aws_acm_certificate.lzb-cert.arn
  validation_record_fqdns = [aws_route53_record.cert_validation.fqdn]
}