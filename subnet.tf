resource "aws_subnet" "ziyo_subnet_public" {
  vpc_id     = aws_vpc.ziyo_vpc.id
  cidr_block = var.public_subnet_cidr_block

  tags = var.subnet_tag_public
}

resource "aws_subnet" "ziyo_subnet_private" {
  vpc_id     = aws_vpc.ziyo_vpc.id
  cidr_block = var.private_subnet_cidr_block

  tags = var.subnet_tag_private
}