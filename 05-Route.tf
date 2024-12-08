resource "aws_route_table" "public" {
  vpc_id = aws_vpc.são_paulo_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    name     = "pipeline-plumbers-public-rt"
    service  = "public route table for São Paulo"
    owner    = "pipline-plumbers"
    location = "São Paulo"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.são_paulo_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    name     = "pipeline-plumbers-private-rt"
    service  = "private route table for São Paulo"
    owner    = "pipline-plumbers"
    location = "São Paulo"
  }
}

resource "aws_route_table_association" "public_us_east_1a" {
  route_table_id = aws_route_table.public.id
  subnet_id      = aws_subnet.public_sa_east_1a.id
}

resource "aws_route_table_association" "public_us_east_1b" {
  route_table_id = aws_route_table.public.id
  subnet_id      = aws_subnet.public_sa_east_1b.id
}

resource "aws_route_table_association" "public_us_east_1c" {
  route_table_id = aws_route_table.public.id
  subnet_id      = aws_subnet.public_sa_east_1c.id
}

resource "aws_route_table_association" "private_us_east_1a" {
  route_table_id = aws_route_table.private.id
  subnet_id      = aws_subnet.private_sa_east_1a.id
}

resource "aws_route_table_association" "private_us_east_1b" {
  route_table_id = aws_route_table.private.id
  subnet_id      = aws_subnet.private_sa_east_1b.id
}

resource "aws_route_table_association" "private_us_east_1c" {
  route_table_id = aws_route_table.private.id
  subnet_id      = aws_subnet.private_sa_east_1c.id
}