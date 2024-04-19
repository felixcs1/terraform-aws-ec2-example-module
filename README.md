Demo module for tf registry, for learning, not for actual use

Example use
```
terraform {
  
}

provider "aws" {
  region  = "eu-west-2"
}

module "aws_server" {
  source        = "felixcs1/ec2-example-module/aws"
  version       = "0.0.3"
  instance_name = "my_instance"
  ami           = "ami-0780837dd83465d73"
  instance_type = "t2.micro"
}

output "ssh_command" {
  value = "chmod 400 ec2_key.pem && ssh -i ec2_key.pem ec2-user@${module.aws_server.instance_public_dns}"
}
```

### Release a new version

```
git tag x.x.x
git push origin x.x.x
```

Then go to tf registry and release new version.