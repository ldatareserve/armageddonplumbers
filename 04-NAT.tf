resource "aws_eip" "nat" {
  domain = aws_vpc.são_paulo_vpc.id
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_sa_east_1a.id

  depends_on = [aws_internet_gateway.igw]

  tags = {
    name     = "nat"
    service  = "nat gateway for São Paulo"
    owner    = "pipline-plumbers"
    location = "São Paulo"
  }


}