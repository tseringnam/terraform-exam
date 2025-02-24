resource "aws_instance" "web" {
  ami                         = var.ec2_ami_id    #"ami-053a45fff0a704a47" 
  instance_type               = var.instance_type #"t2.micro"
  associate_public_ip_address = var.associate_public_ip_address
  subnet_id                   = aws_subnet.ziyo_subnet_public.id
  key_name                    = aws_key_pair.my_key.key_name
  secondary_private_ips       = var.secondary_private_ips
  security_groups             = [aws_security_group.allow_tls.id]
  iam_instance_profile        = aws_iam_instance_profile.test_profile.id

  tags = var.ec2_tags
}


//key-pair 

#generate a new private-public key pair 
resource "tls_private_key" "my_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

#store the public key in aws as an ec2 key pair 
resource "aws_key_pair" "my_key" {
  key_name   = "delete-key"
  public_key = tls_private_key.my_key.public_key_openssh
}

# store the privte key in ssm 
resource "aws_ssm_parameter" "private_key" {
  name        = "test_ssh_key"
  description = "Private Key for EC2 access"
  type        = "SecureString"  # Encrypted in SSM
  value       = tls_private_key.my_key.private_key_pem
}


output "key_name" {
  value = aws_key_pair.my_key.key_name
}

output "ssh_key"{
    value = tls_private_key.my_key.private_key_pem
    sensitive = true
}
output "ssm_parameter_name" {
  value = aws_ssm_parameter.private_key.name
}