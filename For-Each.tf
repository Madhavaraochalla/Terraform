resource "aws_instance" "vm" {
  for_each = {
    "vm1" = { instype = "t2.micro", zone = "us-east-2a" }
    "vm2" = { instype = "t2.small", zone = "us-east-2b" }
    "vm3" = { instype = "t3.micro", zone = "us-east-2c" }


   }
  ami                = "ami-019f9b3318b7155c5"
  instance_type      = each.value.instype
  availability_zone  = each.value.zone
  tags = {
    Name = each.key
  }
}
output "instance_ip_addr" {
 value = aws_instance.vm.*.public_ip
}

resource "aws_instance" "vm" {
  for_each = {
    "vm1" = { instype = "t2.micro" }
    "vm2" = { instype = "t2.small" }
    "vm3" = { instype = "t3.micro" }


   }
  ami                = "ami-019f9b3318b7155c5"
  instance_type      = each.value.
  availability_zone  = us-east-2
  tags = {
    Name = each.key
  }
}
