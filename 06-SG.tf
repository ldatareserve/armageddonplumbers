resource "aws_security_group" "são_paulo_sg01_tg01" {
  name        = "são_paulo_sg01_tg01"
  description = "são_paulo_sg01_tg01"
  vpc_id      = aws_vpc.são_paulo_vpc.id

  ingress {
    description = "MyHomepage"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 80
    to_port     = 80
  }

  ingress {
    description = "SSH"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    to_port     = 22
  }

  ingress {
    description = "MyBox"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 3389
    to_port     = 3389
  }

  ingress {
    description = "Syslog"
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 514
    to_port     = 514
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name     = "são_paulo_sg01_tg01"
    service  = "security group 01 for São Paulo"
    owner    = "pipline-plumbers"
    location = "São Paulo"
  }
}

resource "aws_security_group" "são_paulo_sg02_lb01" {
  vpc_id = aws_vpc.são_paulo_vpc.id

  ingress {
    description = "MyHomepage"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 80
    to_port     = 80
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name     = "são_paulo_sg02_lb01"
    service  = "security group 02 for São Paulo"
    owner    = "pipline-plumbers"
    location = "São Paulo"
  }
}
