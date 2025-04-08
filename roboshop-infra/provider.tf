terraform {
  # Specify the required providers and their versions
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.94.1"  # Locking provider version for stability
    }
  }

  # Remote backend configuration using AWS S3 for storing Terraform state
  backend "s3" {
    bucket         = "remote-state-file-practice"  # S3 bucket name to store state
    key            = "VPC_Roboshop"                # Unique key (file path) for the state file
    region         = "us-east-1"                   # Region where the S3 bucket is hosted
    encrypt        = true                          # Enable encryption at rest
    use_lockfile   = true                          # Prevent concurrent operations (recommended)
  }
}

# Configure the AWS provider with the default region
provider "aws" {
  region = "us-east-1"
}
