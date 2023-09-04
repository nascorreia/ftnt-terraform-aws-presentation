# fgt-terraform-aws-presentation
A step-by-step guide to deploy and configure a FGT and all its cloud infrastructure on AWS

## Applying the code on this branch should show this plan:

```
❯ tf apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_vpc.myvpc will be created
  + resource "aws_vpc" "myvpc" {
      + arn                                  = (known after apply)
      + cidr_block                           = "192.168.0.0/16"
      + default_network_acl_id               = (known after apply)
      + default_route_table_id               = (known after apply)
      + default_security_group_id            = (known after apply)
      + dhcp_options_id                      = (known after apply)
      + enable_dns_hostnames                 = (known after apply)
      + enable_dns_support                   = true
      + enable_network_address_usage_metrics = (known after apply)
      + id                                   = (known after apply)
      + instance_tenancy                     = "default"
      + ipv6_association_id                  = (known after apply)
      + ipv6_cidr_block                      = (known after apply)
      + ipv6_cidr_block_network_border_group = (known after apply)
      + main_route_table_id                  = (known after apply)
      + owner_id                             = (known after apply)
      + tags                                 = {
          + "Name" = "Demo VPC"
        }
      + tags_all                             = {
          + "Name" = "Demo VPC"
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.
...
```

## Analyze the state file:
```
   ❯ tf state list
      aws_vpc.myvpc 
   
   ❯ tf state show aws_vpc.myvpc
      # aws_vpc.myvpc:
      resource "aws_vpc" "myvpc" {
          arn                                  = "arn:aws:ec2:eu-west-1:304287243432:vpc/vpc-0113f79777704a869"
          assign_generated_ipv6_cidr_block     = false
          cidr_block                           = "192.168.0.0/16"
          default_network_acl_id               = "acl-02a6b7ffdc8fcae54"
          default_route_table_id               = "rtb-024001455a11becec"
          default_security_group_id            = "sg-097c02b6554e4e2df"
          dhcp_options_id                      = "dopt-0642e3697376d60a3"
          enable_dns_hostnames                 = false
          enable_dns_support                   = true
          enable_network_address_usage_metrics = false
          id                                   = "vpc-0113f79777704a869"
          instance_tenancy                     = "default"
          ipv6_netmask_length                  = 0
          main_route_table_id                  = "rtb-024001455a11becec"
          owner_id                             = "304287243432"
          tags                                 = {
              "Name" = "Demo VPC"
          }
          tags_all                             = {
              "Name" = "Demo VPC"
          }
      }
```
