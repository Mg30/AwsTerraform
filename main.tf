provider "aws" {
  region = "us-east-1"
}
module "EC2VPCIG" {
  source = "./modules/EC2VPCIG"
  vpc_cidr = "10.10.0.0/16"
  publicSubnetNewbits = 4
  publicSubnetNetnum = 2
  filePathPublicInstancePublicSSHKey = "./ssh_key.pub"
  filePathPublicInstancePrivateSSHKey = "./ssh_key"
  instanceType = "t2.micro"
  ami = "ami-0fc61db8544a617ed"
}

output "public_ip" {
  value = module.EC2VPCIG.public_ip
}
