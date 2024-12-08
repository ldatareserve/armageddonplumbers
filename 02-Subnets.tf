resource "aws_subnet" "public_sa_east_1a" {
  vpc_id                  = aws_vpc.são_paulo_vpc.id
  cidr_block              = "10.103.1.0/24"
  availability_zone       = "sa-east-1a"
  map_public_ip_on_launch = true

  tags = {
    name     = "public_sa_east_1a"
    service  = "public_sa_east_1a for São Paulo"
    owner    = "pipline-plumbers"
    location = "São Paulo"
  }
}

resource "aws_subnet" "public_sa_east_1b" {
  vpc_id                  = aws_vpc.são_paulo_vpc.id
  cidr_block              = "10.103.2.0/24"
  availability_zone       = "sa-east-1b"
  map_public_ip_on_launch = true

  tags = {
    name     = "public_sa_east_1b"
    service  = "public_sa_east_1b for São Paulo"
    owner    = "pipline-plumbers"
    location = "São Paulo"
  }
}

resource "aws_subnet" "public_sa_east_1c" {
  vpc_id                  = aws_vpc.são_paulo_vpc.id
  cidr_block              = "10.103.3.0/24"
  availability_zone       = "sa-east-1c"
  map_public_ip_on_launch = true

  tags = {
    name     = "public_sa_east_1c"
    service  = "public_sa_east_1c for São Paulo"
    owner    = "pipline-plumbers"
    location = "São Paulo"
  }
}

resource "aws_subnet" "private_sa_east_1a" {
  vpc_id                  = aws_vpc.são_paulo_vpc.id
  cidr_block              = "10.103.11.0/24"
  availability_zone       = "sa-east-1a"
  map_public_ip_on_launch = true

  tags = {
    name     = "private_sa_east_1a"
    service  = "private_sa_east_1a for São Paulo"
    owner    = "pipline-plumbers"
    location = "São Paulo"
  }
}

resource "aws_subnet" "private_sa_east_1b" {
  vpc_id                  = aws_vpc.são_paulo_vpc.id
  cidr_block              = "10.103.12.0/24"
  availability_zone       = "sa-east-1b"
  map_public_ip_on_launch = true

  tags = {
    name     = "private_sa_east_1b"
    service  = "private_sa_east_1b for São Paulo"
    owner    = "pipline-plumbers"
    location = "São Paulo"
  }
}

resource "aws_subnet" "private_sa_east_1c" {
  vpc_id                  = aws_vpc.são_paulo_vpc.id
  cidr_block              = "10.103.13.0/24"
  availability_zone       = "sa-east-1c"
  map_public_ip_on_launch = true

  tags = {
    name     = "private_sa_east_1c"
    service  = "private_sa_east_1c for São Paulo"
    owner    = "pipline-plumbers"
    location = "São Paulo"
  }
} 