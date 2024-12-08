resource "aws_vpc" "japan_vpc" {
  cidr_block           = "10.100.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
}

resource "aws_subnet" "japan_subnet_1" {
  vpc_id                  = aws_vpc.japan_vpc.id
  cidr_block              = "10.100.1.0/24"
  availability_zone       = "ap-east-1a"
  map_public_ip_on_launch = true
  tags = {
    name     = "japan_subnet_1"
    service  = "subnet 1 for Japan"
    owner    = "pipline-plumbers"
    location = "Japan"
  }
}

resource "aws_subnet" "japan_subnet_2" {
  vpc_id                  = aws_vpc.japan_vpc.id
  cidr_block              = "10.100.2.0/24"
  availability_zone       = "ap-east-1b"
  map_public_ip_on_launch = true
  tags = {
    name     = "japan_subnet_2"
    service  = "subnet 2 for Japan"
    owner    = "pipline-plumbers"
    location = "Japan"
  }
}

resource "aws_subnet" "japan_subnet_3" {
  vpc_id                  = aws_vpc.japan_vpc.id
  cidr_block              = "10.100.3.0/24"
  availability_zone       = "ap-east-1c"
  map_public_ip_on_launch = true
  tags = {
    name     = "japan_subnet_3"
    service  = "subnet 3 for Japan"
    owner    = "pipline-plumbers"
    location = "Japan"
  }
}

resource "aws_vpc_peering_connection" "são_paulo_to_japan" {
  vpc_id      = aws_vpc.são_paulo_vpc.id
  peer_vpc_id = aws_vpc.japan_vpc.id
  auto_accept = false

  tags = {
    name     = "são_paulo_to_japan"
    service  = "vpc peering connection for São Paulo to Japan"
    owner    = "pipline-plumbers"
    location = "São Paulo"
  }
}

resource "aws_vpc_peering_connection_accepter" "accept_são_paulo_to_japan" {
  vpc_peering_connection_id = aws_vpc_peering_connection.são_paulo_to_japan.id
  auto_accept               = true
}