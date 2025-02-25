resource "aws_vpc" "ziyo_vpc" {
  cidr_block       = "10.10.0.0/16"
  instance_tenancy = "default"

  tags = var.vpc_tag
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.ziyo_vpc.id
  tags   = var.vpc_tag
}


resource "aws_route_table" "ziyo_rt" {
  vpc_id = aws_vpc.ziyo_vpc.id
  route {
    cidr_block = var.route_table_cidr_block
    gateway_id = aws_internet_gateway.gw.id

  }

  tags = var.rt_tag
}



resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.ziyo_subnet_public.id
  route_table_id = aws_route_table.ziyo_rt.id
}


resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.ziyo_subnet_public_2.id
  route_table_id = aws_route_table.ziyo_rt.id
}
