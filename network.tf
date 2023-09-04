// Create AWS VPC
resource "aws_vpc" "myvpc" {
  cidr_block = var.vpc_cidr
  tags       = local.vpc_tags
}

resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = var.subnets.public
  availability_zone = var.az
  tags              = local.subnet_public_tags
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = var.subnets.private
  availability_zone = var.az
  tags              = local.subnet_private_tags
}
