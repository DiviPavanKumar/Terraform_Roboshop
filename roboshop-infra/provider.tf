terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.94.1"
    }
  }

backend "s3" {
    bucket         = "remote-state-file-practice"
    key            = "VPC_Roboshop"
    region         = "us-east-1"
    encrypt = true
    use_lockfile = true
  }
}

provider "aws" {
    region = "us-east-1"
#     default_tags {
#         tags = {
#             Environment = "Development"
#             Project     = "Terraform_Roboshop"
#             Owner       = "AWS-Terraform"
#             CreatedBy   = "Pavan Kumar Divi"
#         }
#     }
}