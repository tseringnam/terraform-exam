resource "aws_instance" "web" {
  ami                         = var.ec2_ami_id    #"ami-053a45fff0a704a47" 
  instance_type               = var.instance_type #"t2.micro"
  associate_public_ip_address = var.associate_public_ip_address
  subnet_id                   = aws_subnet.ziyo_subnet_public.id
  key_name                    = var.key_name #"my-key"
  secondary_private_ips       = var.secondary_private_ips
  security_groups             = [aws_security_group.allow_tls.id]
  iam_instance_profile        = aws_iam_instance_profile.test_profile.id

  tags = var.ec2_tags
}
