// Create AWS VPC
resource "aws_vpc" "myvpc" {
  cidr_block = var.vpc_cidr
  tags       = local.vpc
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.myvpc.id

  tags = local.tags.igw_tags
}

resource "aws_route_table" "rt_external" {
  vpc_id = aws_vpc.myvpc.id

  tags = local.tags.rt_external_tags
}

resource "aws_route" "default_gateway" {
  destination_cidr_block = "0.0.0.0/0"
  route_table_id         = aws_route_table.rt_external.id
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table" "rt_internal" {
  vpc_id = aws_vpc.myvpc.id

  tags = local.tags.rt_internal_tags
}

resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = var.subnets.public
  availability_zone = var.az
  tags              = local.tags.subnet_public_tags
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = var.subnets.private
  availability_zone = var.az
  tags              = local.tags.subnet_private_tags
}

resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.rt_external.id
}

resource "aws_route_table_association" "private_subnet_association" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.rt_internal.id
}