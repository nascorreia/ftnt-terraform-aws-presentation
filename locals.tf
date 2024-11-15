locals {
  #Tags

  vpc = {
    Name = "Demo VPC"
  }
  tags = {
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

    fortigate = {
      Name = "FortiGate Instance"
    }
    fortigate_interfaces = {
      public  = { Name = "FGT Public Interface" }
      private = { Name = "FGT Private Interface" }
    }
  }

  security_groups = {
    external = {
      tags = {
        Name = "External SG"
      }
      vpc_id = aws_vpc.myvpc.id
      sg_policies = {
        ingress = [
          {
            from_port   = "22"
            to_port     = "22"
            protocol    = "6"
            cidr_blocks = ["0.0.0.0/0"]
          },
          {
            from_port   = "8443"
            to_port     = "8443"
            protocol    = "6"
            cidr_blocks = ["0.0.0.0/0"]
          }
        ]

        egress = [
          {
            direction   = "egress"
            from_port   = "0"
            to_port     = "0"
            protocol    = "all"
            cidr_blocks = ["0.0.0.0/0"]
          }
        ]
      }
    }
    allow_all = {
      tags = {
        Name = "Allow all SG"
      }
      vpc_id = aws_vpc.myvpc.id
      sg_policies = {
        ingress = [
          {
            from_port   = "0"
            to_port     = "0"
            protocol    = "all"
            cidr_blocks = ["0.0.0.0/0"]
          },
        ]

        egress = [
          {
            direction   = "egress"
            from_port   = "0"
            to_port     = "0"
            protocol    = "all"
            cidr_blocks = ["0.0.0.0/0"]
          },
        ]
      }
    }
  }

}
