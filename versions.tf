terraform {

  required_version = ">=1.7.2, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.35.0"
    }
  } 
}
