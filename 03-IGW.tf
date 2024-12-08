resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.são_paulo_vpc.id

  tags = {
    name     = "igw"
    service  = "internet gateway for São Paulo"
    owner    = "pipline-plumbers"
    location = "São Paulo"
  }
}