resource "aws_vpc" "my-vpc" {
  cidr_block = "10.0.0.0/24"
  tags = {
    Name = "my-vpc"
  }
}
resource "aws_subnet" "my-subnet" {
  vpc_id = aws_vpc.my-vpc.id
  availability_zone = "us-east-2c"
  cidr_block = "10.0.0.0/25"
  tags = {
    Name="my-subnet"
  }
}
resource "aws_internet_gateway" "my-gateway" {
  vpc_id = aws_vpc.my-vpc.id
  tags = {
    Name="my-gateway"
  }
}
resource "aws_route_table" "my-rout-table" {
  vpc_id = aws_vpc.my-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "aws_internet_gateway.my-gateway.id"
  }
  tags = {
    Name="my-rout-table"
  }
}
resource "aws_security_group" "my-security" {
  name = "my-security"
  vpc_id = aws_vpc.my-vpc.id
  ingress {
    from_port = 0
    protocol  = "-1"
    to_port   = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    protocol  = "-1"
    to_port   = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name="my-security"
  }
}
resource "aws_route_table_association" "my-route-association" {
  route_table_id = "aws_route_table.my-rout-table.id"
  subnet_id = "aws_subnet.my-subnet.id"
}
resource "aws_instance" "my-instance" {
  ami = "ami-019f9b3318b7155c5"
  instance_type = "t2.micro"
  availability_zone = "us-east-2c"
  subnet_id = "aws_subnet.my-subnet.id"
  vpc_security_group_ids = [aws_security_group.my-security.id]
  associate_public_ip_address = true
  key_name = "kops"
  tags = {
    Name="my-instance"
  }
}
resource"aws_instance" "inst-1"{
    ami = ""
    instance_type  = "t3.micro"
    key_name = "kops"
    tags = {
        name="inst-1"
    }
}