provider "aws" {
  region = "us-west-2"
}

resource "aws_key_pair" "new_key" {
  key_name   = var.key_name
  public_key = file("C:/Users/Krutika/.ssh/id_rsa.pub")
}

resource "aws_instance" "app_server" {
  ami 		= var.ami
  instance_type = var.instance_type
  key_name 	= var.key_name
  user_data 	= file("${path.module}/../scripts/user_data.sh")

  vpc_security_group_ids =[aws_security_group.allow_http.id]

  tags = {
    name = "AppInstance"
  }
}


resource "aws_security_group" "allow_http" {
  name = "allow_http"
  
  ingress {
    from_port	= 80
    to_port 	= 80
    protocol 	= "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port 	= 22
    to_port 	= 22
    protocol 	= "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port 	= 0
    to_port 	= 0
    protocol 	= -1 
    cidr_blocks = ["0.0.0.0/0"]
  }
}