resource "aws_subnet" "ziyo_subnet_public" {
  vpc_id     = aws_vpc.ziyo_vpc.id
  cidr_block = "10.10.1.0/24"

  tags = {
    Terraform = "True"
    Name      = "public"
  }
}

resource "aws_subnet" "ziyo_subnet_private" {
  vpc_id     = aws_vpc.ziyo_vpc.id
  cidr_block = "10.10.2.0/24"

  tags = {
    Terraform = "True"
    Name      = "Private"
  }
}