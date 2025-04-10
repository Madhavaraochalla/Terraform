resource "aws_vpc" "myvpc1" {
  cidr_block       = "10.0.0.0/24"

  tags = {
    Name = "myvpc1"
  }
}
resource "aws_internet_gateway" "myigw1" {
  vpc_id = aws_vpc.myvpc1.id

  tags = {
    Name = "myigw"
  }
}
resource "aws_internet_gateway_attachment" "myigwvpc" {
  internet_gateway_id = aws_internet_gateway.myigw1.id
  vpc_id              = aws_vpc.myvpc1.id
}
resource "aws_subnet" "mysn1" {
  vpc_id     = aws_vpc.myvpc1.id
  cidr_block = "10.0.0.0/25"

  tags = {
    Name = "mysn1terra"
  }
}
resource "aws_subnet" "mysn2" {
  vpc_id     = aws_vpc.myvpc1.id
  cidr_block = "10.0.0.128/25"

  tags = {
    Name = "mysn2terra"
  }
}
resource "aws_eip" "lb" {
  vpc = "true"
}
resource "aws_nat_gateway" "mynat1" {
  allocation_id = aws_eip.lb.id
  subnet_id     = aws_subnet.mysn1.id

  tags = {
    Name = "terraNAT"
  }
}
resource "aws_route_table" "myrt1" {
  vpc_id = aws_vpc.myvpc1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myigw1.id
  }

}
resource "aws_route_table" "myrt2" {
  vpc_id = aws_vpc.myvpc1.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.mynat1.id
  }
}

resource "aws_route_table_association" "myrt1sn1" {
  subnet_id      = aws_subnet.mysn1.id
  route_table_id = aws_route_table.myrt1.id
}

resource "aws_route_table_association" "myrt1sn2" {
  subnet_id      = aws_subnet.mysn2.id
  route_table_id = aws_route_table.myrt2.id
}
resource "aws_security_group" "mysg1" {
  name        = "allow ssh"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.myvpc1.id
  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
   }
  tags = {
    Name = "mysg1terra"
  }
}


resource "aws_instance" "myec2" {
  ami           = "ami-019f9b3318b7155c5"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.mysn1.id
  key_name = "kops"
  vpc_security_group_ids = aws_security_group.mysg1.id
  tags = {
    Name = "myterraec2"
  }
}
resource "aws_eip" "lb1" {
  instance = aws_instance.myec2.id
  vpc = "true"
}
resource "aws_ebs_volume" "myvol1" {
  availability_zone = "us-east-2a"
  size              = 7

  tags = {
    Name = "terravol"
  }
}
resource "aws_volume_attachment" "myec2vol1" {
device_name = "/dev/sdh" 
volume_id = aws_ebs_volume.myvol1.id
instance_id = aws_instance.myec2.id

}

