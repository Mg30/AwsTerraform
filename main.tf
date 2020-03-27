provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "my_vpc" {
  cidr_block = "10.10.0.0/16"
  }

module "public_network" {
  vpc_cidr = "10.10.0.0/16"
  source = "./modules/public_network"
  vpc_id = aws_vpc.my_vpc.id
  public_subnet_newbits = 4
  public_subnet_netnum = 2
  filepath_public_SSH_key = "./ssh_key.pub"
  file_private_SSH_key = "./ssh_key"
  instances_list = {
    i1= {
    instance_type = "t2.micro"
    ami = "ami-0fc61db8544a617ed"
  },
  i2 = {
    instance_type = "t2.micro"
    ami = "ami-0fc61db8544a617ed"
  }}
}

output "all_public_ip" {
  value = module.public_network.all_public_ip
}
