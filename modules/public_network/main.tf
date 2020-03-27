resource "aws_subnet" "my_public_subnet" {
  vpc_id = var.vpc_id
  cidr_block = cidrsubnet(var.vpc_cidr, var.public_subnet_newbits, var.public_subnet_netnum)
}

resource "aws_internet_gateway" "my_internet_gw" {
  vpc_id = var.vpc_id
}

resource "aws_key_pair" "my_SSH_key" {
  key_name   = "examplekey"
  public_key = file(var.filepath_public_SSH_key)
}


resource "aws_route_table" "my_public_route_table" {
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_internet_gw.id
  }
  
}

resource "aws_route_table_association" "my_route_table_association" {
  route_table_id = aws_route_table.my_public_route_table.id
  subnet_id = aws_subnet.my_public_subnet.id
}

resource "aws_instance" "my_public_EC2" {
  for_each = var.instances_list
  key_name      = aws_key_pair.my_SSH_key.key_name
  ami           = each.value["ami"]
  instance_type = each.value["instance_type"]
  associate_public_ip_address = true
  subnet_id = aws_subnet.my_public_subnet.id
  vpc_security_group_ids = [aws_security_group.my_allow_http.id]

    connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file(file_private_SSH_key)
    host        = self.public_ip
  }
}

resource "aws_security_group" "my_allow_http" {
  name= "allowHttps"
  description = "Allow http and ssh inbound traffic"
  vpc_id      = var.vpc_id
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
