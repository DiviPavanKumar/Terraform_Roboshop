module "this" {
  source = "../terraform-aws-vpc"  # Path to the reusable VPC module

  # Core VPC Configuration
  cidr_block       = var.cidr_block           # Main CIDR block for the VPC
  common_tags      = var.common_tags          # Tags applied to all resources
  vpc_tags         = var.vpc_tags             # Additional VPC-specific tags
  igw_tags         = var.igw_tags             # Tags for Internet Gateway

  # Public Subnet Configuration
  public_subnet_cidr  = var.public_subnet_cidr    # List of CIDR blocks for public subnets
  public_subnet_names = var.public_subnet_names   # Names for each public subnet
  azs                 = var.azs                   # Availability Zones to distribute subnets across

  # Private Subnet Configuration
  private_subnet_cidr  = var.private_subnet_cidr   # List of CIDR blocks for private subnets
  private_subnet_names = var.private_subnet_names  # Names for each private subnet

  # Database Subnet Configuration
  database_subnet_cidr  = var.database_subnet_cidr   # List of CIDR blocks for database subnets
  database_subnet_names = var.database_subnet_names  # Names for each database subnet

  # Route Table Tags
  public_route_table_tags   = var.public_route_table_tags    # Tags for public route table
  private_route_table_tags  = var.private_route_table_tags   # Tags for private route table
  database_route_table_tags = var.database_route_table_tags  # Tags for database route table
}
