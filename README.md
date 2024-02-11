Demo module for tf registry, for learning, not for actual use

Example use
```
terraform {
  
}

provider "aws" {
  region  = "eu-west-2"
  profile = "personal"
}

module "aws_server" {
  source            = "./terraform-aws-module-example"
  aws_instance_type = "t2.micro"
  msg               = "HELLO WORLD"
  key_pair_name = "instance_key_pair"
  egress_ports = [22, 80]
}


output "ec2_public_dns" {
  value = module.aws_server.instance_public_dns
}
```