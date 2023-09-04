locals {
  #Tags
  vpc_tags = {
    Name = "Demo VPC"
  }

  rt_external_tags = {
    Name = "External Route Table"
  }

  rt_internal_tags = {
    Name = "Internal Route Table"
  }

  subnet_public_tags = {
    Name = "Public Subnet"
  }

  subnet_private_tags = {
    Name = "Private Subnet"
  }

  igw_tags = {
    Name = "IGW for VPC ${aws_vpc.myvpc.id}"
  }
}