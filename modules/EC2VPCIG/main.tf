/* Create a VPC with a subnet with a EC2 instance in it, with internet acces thanks to
InternetGateWAY and throught ssh */

resource "aws_vpc" "MyVpc" {
  cidr_block = var.vpc_cidr
  }

resource "aws_subnet" "MyPublicSubnet" {
  vpc_id = aws_vpc.MyVpc.id
  cidr_block = cidrsubnet(var.vpc_cidr, var.publicSubnetNewbits, var.publicSubnetNetnum)
}


resource "aws_internet_gateway" "MyInternetGw" {
  vpc_id = aws_vpc.MyVpc.id
}


resource "aws_key_pair" "MySSHKey" {
  key_name   = "examplekey"
  public_key = file(var.filePathPublicInstancePublicSSHKey)
}


resource "aws_route_table" "MyPublicRouteTable" {
  vpc_id = aws_vpc.MyVpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.MyInternetGw.id
  }
  
}


resource "aws_route_table_association" "MyRouteTableAssociation" {
  route_table_id = aws_route_table.MyPublicRouteTable.id
  subnet_id = aws_subnet.MyPublicSubnet.id
}

resource "aws_instance" "MyPublicEC2" {
  key_name      = aws_key_pair.MySSHKey.key_name
  ami           = "ami-0fc61db8544a617ed"
  instance_type = "t2.micro"
  associate_public_ip_address = true
  subnet_id = aws_subnet.MyPublicSubnet.id
  vpc_security_group_ids = [aws_security_group.MyAllowHttp.id]

    connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file(filePathPublicInstancePrivateSSHKey)
    host        = self.public_ip
  }
}

resource "aws_security_group" "MyAllowHttp" {
  name= "allowHttps"
  description = "Allow http and ssh inbound traffic"
  vpc_id      = aws_vpc.MyVpc.id
    ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
    ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}
  
}
