resource "aws_subnet" "ziyo_subnet_public" {
  vpc_id            = aws_vpc.ziyo_vpc.id
  cidr_block        = var.public_subnet_cidr_block
  availability_zone = "us-east-1a"

  tags = var.subnet_tag_public
}

resource "aws_subnet" "ziyo_subnet_public_2" {
  vpc_id            = aws_vpc.ziyo_vpc.id
  cidr_block        = "10.10.3.0/24"
  availability_zone = "us-east-1b"
  tags              = var.subnet_tag_public
}


resource "aws_subnet" "ziyo_subnet_private" {
  vpc_id     = aws_vpc.ziyo_vpc.id
  cidr_block = var.private_subnet_cidr_block

  tags = var.subnet_tag_private
}