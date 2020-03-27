# PROJECT DESCRIPTION

This repo contains all the module created via terraform in my trainning with deploying insfra on AWS.


## 1- EC2 VPC IG SSH

![AWSGRAPH1](EC2_VPC_IG_SSH.png)


VPC with a private subnet with an EC2 instance with internet gateway.
EC2 expose port 80 for http protocol and 22 for SSH.

## 2- How to use

### requirements
- aws account
- terraform install
- generate a ssh key 

### configuration of EC2
public_network module can be configure to launche n EC2 instances. For each instance you can specify ami and instance type with the instances_list variable.
### use & destroy

- `terraform init`
- `terraform validate`
- `terraform plan`
- `terraform apply`
- `terraform destroy` 