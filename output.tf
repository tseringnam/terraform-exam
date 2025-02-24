output "vpc_arn" {
  ###value = aws_vpc.ziyo_vpc.arn
  # value = aws_security_group.allow_tls.id
  value = aws_internet_gateway.gw.id
}

output "s3_region" {
  value = aws_s3_bucket.ziyotek_bucket.region

}