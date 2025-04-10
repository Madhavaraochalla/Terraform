

variable "ami" {
type = string
default = "ami-019f9b3318b7155c5"

}

variable "inst" {
type = string
default = "t2.micro"

}

variable "subent" {
type = list
default = [ "subnet-08107f14984331d0a", "subnet-0e7ae1f819143a821", "subnet-0bdc35d3bd1c53f58" ]

}


variable "sg" {
type = list
default = ["sg-00cd73ddfa32b77e1"]
}

variable "ec2_count" {
default = "3"
}