# fgt-terraform-aws-presentation
A step-by-step guide to deploy and configure a FGT and all its cloud infrastructure on AWS

In this branch we just take a small step and create 2 subnets. 
The idea is to get a good notion about the changes, analyze the state and see the differences in AWS Console

## Applying the code on this branch should show this plan:

```

❯ tf plan
aws_vpc.myvpc: Refreshing state... [id=vpc-05f622f1074fb278b]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_subnet.private will be created
  + resource "aws_subnet" "private" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "eu-west-1a"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "192.168.2.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Name" = "Private Subnet"
        }
      + tags_all                                       = {
          + "Name" = "Private Subnet"
        }
      + vpc_id                                         = "vpc-05f622f1074fb278b"
    }

  # aws_subnet.public will be created
  + resource "aws_subnet" "public" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "eu-west-1a"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "192.168.1.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Name" = "Public Subnet"
        }
      + tags_all                                       = {
          + "Name" = "Public Subnet"
        }
      + vpc_id                                         = "vpc-05f622f1074fb278b"
    }

Plan: 2 to add, 0 to change, 0 to destroy.
```

## Analyze the state file:
```
   ❯ tf state list
  aws_subnet.private
  aws_subnet.public
  aws_vpc.myvpc 
   
```
