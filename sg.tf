resource "aws_security_group" "instances" {
  name        = "SG-Instancias"
  description = "Permissao de trafego nas instancias"
  vpc_id      = aws_vpc.default.id

  ingress {
    description = "http-access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups  = [aws_security_group.alb.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "alb" {
  name        = "SG-ALB"
  description = "Permissao de trafego no ALB"
  vpc_id      = aws_vpc.default.id

  ingress {
    description = "http-access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}