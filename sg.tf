resource "aws_security_group" "allow_tls" {
  name        = var.sg_name
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.ziyo_vpc.id

  tags = var.s3_tag
}

# resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
#   security_group_id = aws_security_group.allow_tls.id
#   cidr_ipv4         = aws_vpc.ziyo_vpc.cidr_block

#   from_port   = 0
#   ip_protocol = "-1"
#   to_port     = 0
# }

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = var.sg_ingerss_cidr_block

  from_port   = var.sg_ingress_from_port
  ip_protocol = var.sg_ingres_protocol
  to_port     = var.sg_ingress_to_port
}


resource "aws_vpc_security_group_ingress_rule" "allow_postgres" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = aws_vpc.ziyo_vpc.cidr_block

  from_port   = 5431
  ip_protocol = "tcp"
  to_port     = 5432
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = var.sg_engress_cidr_block
  ip_protocol       = var.sg_egerss_ip_protocol # semantically equivalent to all ports
}
