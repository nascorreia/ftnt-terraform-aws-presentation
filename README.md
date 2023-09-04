# fgt-terraform-aws-presentation
A step-by-step guide to deploy and configure a FGT and all its cloud infrastructure on AWS

In this branch several routing resources are created:

1. public and private subnet cidrs have been declared as a var of type map (get an idea of different var types available and how to use them)
2. Added an interpolation example in the internet gateway tags local var
3. Created route table association resources to tie the subnets to the routing tables
4. Created an Internet Gateway
5. Created an AWS Route setting the default gateway to the Internet Gateway 

## Applying the code on this branch should show this plan:

```
❯ tf apply
aws_vpc.myvpc: Refreshing state... [id=vpc-05f622f1074fb278b]
aws_subnet.private: Refreshing state... [id=subnet-061f401f0c6a9329c]
aws_subnet.public: Refreshing state... [id=subnet-0d70ff1cd914fdbd1]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_internet_gateway.igw will be created
  + resource "aws_internet_gateway" "igw" {
      + arn      = (known after apply)
      + id       = (known after apply)
      + owner_id = (known after apply)
      + tags     = {
          + "Name" = "IGW for VPC vpc-05f622f1074fb278b"
        }
      + tags_all = {
          + "Name" = "IGW for VPC vpc-05f622f1074fb278b"
        }
      + vpc_id   = "vpc-05f622f1074fb278b"
    }

  # aws_route.default_gateway will be created
  + resource "aws_route" "default_gateway" {
      + destination_cidr_block = "0.0.0.0/0"
      + gateway_id             = (known after apply)
      + id                     = (known after apply)
      + instance_id            = (known after apply)
      + instance_owner_id      = (known after apply)
      + network_interface_id   = (known after apply)
      + origin                 = (known after apply)
      + route_table_id         = (known after apply)
      + state                  = (known after apply)
    }

  # aws_route_table.rt_external will be created
  + resource "aws_route_table" "rt_external" {
      + arn              = (known after apply)
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = (known after apply)
      + tags             = {
          + "Name" = "External Route Table"
        }
      + tags_all         = {
          + "Name" = "External Route Table"
        }
      + vpc_id           = "vpc-05f622f1074fb278b"
    }

  # aws_route_table.rt_internal will be created
  + resource "aws_route_table" "rt_internal" {
      + arn              = (known after apply)
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = (known after apply)
      + tags             = {
          + "Name" = "Internal Route Table"
        }
      + tags_all         = {
          + "Name" = "Internal Route Table"
        }
      + vpc_id           = "vpc-05f622f1074fb278b"
    }

  # aws_route_table_association.private_subnet_association will be created
  + resource "aws_route_table_association" "private_subnet_association" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = "subnet-061f401f0c6a9329c"
    }

  # aws_route_table_association.public_subnet_association will be created
  + resource "aws_route_table_association" "public_subnet_association" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = "subnet-0d70ff1cd914fdbd1"
    }

Plan: 6 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_internet_gateway.igw: Creating...
aws_route_table.rt_internal: Creating...
aws_route_table.rt_external: Creating...
aws_internet_gateway.igw: Creation complete after 1s [id=igw-0b9ad55edb810fc48]
aws_route_table.rt_external: Creation complete after 1s [id=rtb-02d354b74eb7e7f34]
aws_route_table_association.public_subnet_association: Creating...
aws_route.default_gateway: Creating...
aws_route_table.rt_internal: Creation complete after 1s [id=rtb-00d6ceedcc7f92c11]
aws_route_table_association.private_subnet_association: Creating...
aws_route_table_association.public_subnet_association: Creation complete after 0s [id=rtbassoc-0274d7cd139c8fbf3]
aws_route_table_association.private_subnet_association: Creation complete after 0s [id=rtbassoc-094a29d555eeb3990]
aws_route.default_gateway: Creation complete after 0s [id=r-rtb-02d354b74eb7e7f341080289494]

Apply complete! Resources: 6 added, 0 changed, 0 destroyed.
```

## Analyze the state file:
```
   ❯ tf state list
  aws_internet_gateway.igw
  aws_route.default_gateway
  aws_route_table.rt_external
  aws_route_table.rt_internal
  aws_route_table_association.private_subnet_association
  aws_route_table_association.public_subnet_association
  aws_subnet.private
  aws_subnet.public
  aws_vpc.myvpc
```
