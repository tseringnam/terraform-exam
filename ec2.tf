resource "aws_instance" "web" {
  ami             = "ami-053a45fff0a704a47"
  instance_type   = "t2.micro"
  associate_public_ip_address =  true
  subnet_id       = aws_subnet.ziyo_subnet_public.id
  key_name        = "my-key"
  security_groups = [aws_security_group.allow_tls.id]
  tags = {
    Name = "tf-example"
  }
}
