resource "aws_vpc" "são_paulo_vpc" {
  cidr_block = "10.103.0.0/16"

  tags = {
    name     = "são_paulo_VPC"
    service  = "application for São Paulo"
    owner    = "pipline-plumbers"
    location = "São Paulo"
  }
}