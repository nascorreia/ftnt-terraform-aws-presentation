# fgt-terraform-aws-presentation
A step-by-step guide to deploy and configure a FGT and all its cloud infrastructure on AWS

The following steps will create this simple infrastructure:

![](https://github.com/nascorreia/ftnt-terraform-aws-presentation/blob/267475f7ba3dd54582d1244be5eb825f4f83c403/AWS-Terraform-Presentation.drawio.png)

## Follow the following branch path:

1. create_vpc - Create the VPC resources
2. create_subnets - Create the public and private subnets
3. create_routing - Create routing resources
4. create_instances - Creation of FGT instance and all necessary resources
5. create_outputs - Create the output.tf file and print some outputs
6. create_s3 - Create an S3 bucket to hold the remote state
7. create_remote_backend - Initialize the remote backend. The local state is (optionally) copied to the remote backend. The state now can be used in other configurations
8. configure_fortios_provider - Create the FortiOS provider config and remote state
9. create_firewall_policy - Create a firewall policy
