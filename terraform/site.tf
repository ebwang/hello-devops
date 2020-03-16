# Create a new instance of the latest Debian Stretch on an
# t2.micro node with an AWS Tag naming it "EC2-Nome-Instancia"
provider "aws" {
  access_key =  "${var.accessKey}"
  secret_key =  "${var.secretKey}"
  region = "us-west-2"
}

data "aws_ami" "debian" {
  most_recent = true

  filter {
    name   = "name"
    values = ["debian-stretch-hvm-x86_64-gp2-2018-11-10-63975"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["379101102735"] 
}


resource "aws_network_interface" "eth9" {
  subnet_id   = "${aws_subnet.My_VPC_Subnet.id}"
  private_ips = ["10.0.1.5"]

  tags {
    Name = "primary_network_interface"
  }
}


resource "aws_instance" "web" {
  ami           = "${data.aws_ami.debian.id}"
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = "${aws_network_interface.eth9.id}"
    device_index         = 0
  }

  tags {
    Name = "EC2-Nome-Instancia"
  }
}


