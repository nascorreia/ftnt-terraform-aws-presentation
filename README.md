# fgt-terraform-aws-presentation
A step-by-step guide to deploy and configure a FGT and all its cloud infrastructure on AWS

In this branch the FGT instance and all the necessary resources are created:
   1 - EC2 config
   2 - Security Groups
   3 - Interfaces and attachments
   4 - SSH keypair
   5 - Bootstrap templated config file
## Applying the code on this branch should show this plan:

```

```

## Analyze the state file:
```
❯ tf state list
aws_eip.public_ip
aws_instance.fgt
aws_internet_gateway.igw
aws_key_pair.ncorreia_key
aws_network_interface.private_intf
aws_network_interface.public_intf
aws_network_interface_sg_attachment.private_intf_attachment
aws_network_interface_sg_attachment.public_intf_attachment
aws_route.default_gateway
aws_route_table.rt_external
aws_route_table.rt_internal
aws_route_table_association.private_subnet_association
aws_route_table_association.public_subnet_association
aws_security_group.security_groups["allow_all"]
aws_security_group.security_groups["external"]
aws_subnet.private
aws_subnet.public
aws_vpc.myvpc
```
