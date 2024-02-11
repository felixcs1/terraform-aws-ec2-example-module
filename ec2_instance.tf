locals {
  ami = "ami-0780837dd83465d73"
}

resource "aws_instance" "app_server" {
    
    ami           = local.ami
    instance_type = var.aws_instance_type

    key_name               = aws_key_pair.gen_key_pair.key_name
    vpc_security_group_ids = [aws_security_group.renamed_security_group.id]
}



# Automatically generated key 'gen_tls_pk':
resource "tls_private_key" "gen_tls_pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Automatically generated key_pair 'gen_key_pair':
resource "aws_key_pair" "gen_key_pair" {
  key_name   = var.key_pair_name
  public_key = tls_private_key.gen_tls_pk.public_key_openssh
}

# Saves a local file
resource "local_file" "gen_key_pair" {
  content  = tls_private_key.gen_tls_pk.private_key_pem
  filename = var.key_file
}

resource "aws_security_group" "renamed_security_group" {
  name  = "my_module_sec_group"

  # Enable ssh external server connection:
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  dynamic "egress" {
    for_each = var.egress_ports
    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}
