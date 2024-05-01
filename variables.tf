
variable "vpc_name" {
  type = string
}

variable "instance_name" {
  type = string
}

variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "key_pair_name" {
  type    = string
  default = "ec2_key"
}

variable "key_file" {
  type    = string
  default = "ec2_key.pem"
}
