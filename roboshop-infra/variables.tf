# VPC CIDR block
variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

# Common tags applied to all resources
variable "common_tags" {
  description = "Common tags applied to all AWS resources"
  type        = map(string)
  default     = {
    Environment = "Development"
    Terraform   = "true"
    Project     = "Terraform_Roboshop"
    Owner       = "AWS-Terraform"
    CreatedBy   = "Pavan Kumar Divi"
  }
}

# Tags specific to the VPC resource
variable "vpc_tags" {
  description = "Custom tags for the VPC"
  type        = map(string)
  default     = {
    Name = "VPC_Roboshop"
  }
}

# Tags for the Internet Gateway
variable "igw_tags" {
  description = "Custom tags for the Internet Gateway"
  type        = map(string)
  default     = {
    Name = "IGW_Roboshop"
  }
}

# Public subnet CIDR blocks
variable "public_subnet_cidr" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

# Availability zones for subnet distribution
variable "azs" {
  description = "List of Availability Zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

# Names for public subnets
variable "public_subnet_names" {
  description = "Names for each public subnet"
  type        = list(string)
  default     = ["roboshop-public-1a", "roboshop-public-1b"]
}

# Private subnet CIDR blocks
variable "private_subnet_cidr" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.0.11.0/24", "10.0.12.0/24"]
}

# Names for private subnets
variable "private_subnet_names" {
  description = "Names for each private subnet"
  type        = list(string)
  default     = ["roboshop-private-1a", "roboshop-private-1b"]
}

# Database subnet CIDR blocks
variable "database_subnet_cidr" {
  description = "List of CIDR blocks for database subnets"
  type        = list(string)
  default     = ["10.0.21.0/24", "10.0.22.0/24"]
}

# Names for database subnets
variable "database_subnet_names" {
  description = "Names for each database subnet"
  type        = list(string)
  default     = ["roboshop-database-1a", "roboshop-database-1b"]
}

# Tags for the public route table
variable "public_route_table_tags" {
  description = "Custom tags for the public route table"
  type        = map(string)
  default     = {
    Name = "Roboshop_Public"
  }
}

# Tags for the private route table
variable "private_route_table_tags" {
  description = "Custom tags for the private route table"
  type        = map(string)
  default     = {
    Name = "Roboshop_Private"
  }
}

# Tags for the database route table
variable "database_route_table_tags" {
  description = "Custom tags for the database route table"
  type        = map(string)
  default     = {
    Name = "Roboshop_Database"
  }
}
