resource "aws_vpc" "default" {
  cidr_block           = var.cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
}

resource "aws_internet_gateway" "default" {
  vpc_id = aws_vpc.default.id
}

resource "aws_route_table" "default" {
  vpc_id = aws_vpc.default.id
}

resource "aws_route" "default" {
  route_table_id         = aws_route_table.default.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.default.id
}

resource "aws_subnet" "sbn1" {
  vpc_id            = aws_vpc.default.id
  cidr_block        = var.subnet_cidr_blocks[0]
  availability_zone = var.availability_zones[0]
  map_public_ip_on_launch = true
}

resource "aws_subnet" "sbn2" {
  vpc_id                  = aws_vpc.default.id
  cidr_block              = var.subnet_cidr_blocks[1]
  availability_zone       = var.availability_zones[1]
  map_public_ip_on_launch = true
}

resource "aws_route_table_association" "rta1" {
  subnet_id      = aws_subnet.sbn1.id
  route_table_id = aws_route_table.default.id
}

resource "aws_route_table_association" "rta2" {
  subnet_id      = aws_subnet.sbn2.id
  route_table_id = aws_route_table.default.id
}