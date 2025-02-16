resource "aws_vpc" "ziyo_vpc" {
  cidr_block       = "10.10.0.0/16"
  instance_tenancy = "default"

  tags = {
    Terrafrom = "true"
    Name      = "Ziyo_Vpc"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.ziyo_vpc.id

  tags = {
    Terraform = "True"
    Name      = "ziyo_Ig"
  }
}


resource "aws_route_table" "ziyo_rt" {
  vpc_id = aws_vpc.ziyo_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id

  }

  tags = {
    Name = "Ziyo_rt"
  }
}


resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.ziyo_subnet_public.id
  route_table_id = aws_route_table.ziyo_rt.id
}
