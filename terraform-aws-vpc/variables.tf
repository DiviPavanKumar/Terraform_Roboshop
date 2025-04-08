# CIDR block for the main VPC (e.g., "10.0.0.0/16")
variable "cidr_block" {
  # default = "10.0.0.0/16"
  description = "CIDR block for the VPC"
  type        = string
}

# Enable DNS hostnames in the VPC (recommended for EC2 name resolution)
variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

# Enable DNS support (resolves internal hostnames to IPs)
variable "enable_dns_support" {
  description = "Enable DNS support in the VPC"
  type        = bool
  default     = true
}

# Common tags to apply to all resources
variable "common_tags" {
  description = "Tags common to all resources"
  type        = map(string)
  default     = {}
}

# Additional tags specific to the VPC
variable "vpc_tags" {
  description = "Custom tags for the VPC"
  type        = map(string)
  default     = {}
}

# Additional tags specific to the Internet Gateway
variable "igw_tags" {
  description = "Custom tags for the Internet Gateway"
  type        = map(string)
  default     = {}
}

# List of CIDR blocks for the public subnets
variable "public_subnet_cidr" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
}

# Names for the public subnets
variable "public_subnet_names" {
  description = "List of names for public subnets"
  type        = list(string)
}

# List of availability zones to use
variable "azs" {
  description = "Availability Zones for subnets"
  type        = list(string)
  default     = []
}

# List of CIDR blocks for private subnets
variable "private_subnet_cidr" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
}

# Names for the private subnets
variable "private_subnet_names" {
  description = "List of names for private subnets"
  type        = list(string)
}

# List of CIDR blocks for database subnets
variable "database_subnet_cidr" {
  description = "List of CIDR blocks for database subnets"
  type        = list(string)
}

# Names for the database subnets
variable "database_subnet_names" {
  description = "List of names for database subnets"
  type        = list(string)
}

# Tags for the public route table
variable "public_route_table_tags" {
  description = "Custom tags for the public route table"
  type        = map(string)
  default     = {}
}

# Tags for the private route table
variable "private_route_table_tags" {
  description = "Custom tags for the private route table"
  type        = map(string)
  default     = {}
}

# Tags for the database route table
variable "database_route_table_tags" {
  description = "Custom tags for the database route table"
  type        = map(string)
  default     = {}
}
