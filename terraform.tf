terraform {
  required_providers {
    // I got trouble with Azure provider :(
    // I was not able to solve the issue with registering Azure provider, so I decided to use AWS provider
    // So I would appreciate if you could reviews my code with AWS provider
    aws = {
      source  = "hashicorp/aws"
      version = "5.88.0"
    }
  }
}
