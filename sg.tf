// Security Group


resource "aws_security_group" "security_groups" {
  for_each = local.security_groups

  name        = each.value.tags.Name
  description = "Security group for ${each.key} SG"
  vpc_id      = each.value.vpc_id

  dynamic "ingress" {
    //This code will be executed for all the "ingress" items in the local var
    for_each = each.value.sg_policies.ingress
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  dynamic "egress" {
    //This code will be executed for all the "sg" items in the local var
    for_each = each.value.sg_policies.egress

    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }

  tags = each.value.tags
}

// You might be wondering how we refer to these now...
// Using this:
// aws_security_group.security_groups["external"] or aws_security_group.security_groups["internal"] 
// Keep in mind that aws_security_group.security_groups["external"].id is a Terraform construct and "external" does not mpa to any property or attribute of the AWS security group itself