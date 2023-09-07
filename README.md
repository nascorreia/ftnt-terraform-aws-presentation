# fgt-terraform-aws-presentation
A step-by-step guide to deploy and configure a FGT and all its cloud infrastructure on AWS
This will go hand-in-hand with:

- `Remote state backend repo` : https://github.com/nascorreia/ftnt-terraform-aws-presentation-infra-backend
- `FortiOS configuration` : https://github.com/nascorreia/ftnt-terraform-aws-presentation-fortios

----

The following steps will create this simple infrastructure:

![](https://github.com/nascorreia/ftnt-terraform-aws-presentation-infra/blob/main/AWS-Terraform-Presentation.drawio.png)

## Follow the following branch path:

1. Branch create_vpc - Create the VPC resources
2. Branch create_subnets - Create the public and private subnets
3. Branch create_routing - Create routing resources
4. Branch create_instances - Creation of FGT instance and all necessary resources
5. Branch create_outputs - Create the output.tf file and print some outputs
6. On repo ftnt-terraform-aws-presentation-infra-backend - Create the S3 bucket for remote state
7. Branch create_remote_backend - Initialize the remote backend. The local state is (optionally) copied to the remote backend. The state now can be used in other configurations
8. On repo ftnt-terraform-aws-presentation-fortios - Configure FortiOS 
