resource "aws_vpc" "main" {
  cidr_block       = var.cidr_block #"10.0.0.0/16"
  enable_dns_hostnames = var.enable_dns_hostnames #true
  enable_dns_support = var.enable_dns_support #true

    tags = merge(
        var.common_tags, # This is the default value for common_tags
        var.vpc_tags # This is the default value for vpc_tags
    )
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    var.common_tags,
    var.igw_tags # This is the default value for igw_tags
  )                                 
}

resource "aws_subnet" "public" {
  count = length(var.public_subnet_cidr) # Create two subnets, one for each availability zone
  vpc_id = aws_vpc.main.id
  cidr_block = var.public_subnet_cidr[count.index] # This will create two subnets in the VPC

  availability_zone = var.azs[count.index] # Use the availability zone from the list

  tags = merge(
    var.common_tags, {
    Name = var.public_subnet_names[count.index]
    }
   ) 
}

resource "aws_subnet" "private" {
  count = length(var.private_subnet_cidr) # Create two subnets, one for each availability zone
  vpc_id = aws_vpc.main.id
  cidr_block = var.private_subnet_cidr[count.index] # This will create two subnets in the VPC

  availability_zone = var.azs[count.index] # Use the availability zone from the list

  tags = merge(
    var.common_tags, {
    Name = var.private_subnet_names[count.index]
    }
   ) 
}

resource "aws_subnet" "database" {
  count = length(var.database_subnet_cidr) # Create two subnets, one for each availability zone
  vpc_id = aws_vpc.main.id
  cidr_block = var.database_subnet_cidr[count.index] # This will create two subnets in the VPC

  availability_zone = var.azs[count.index] # Use the availability zone from the list

  tags = merge(
    var.common_tags, {
    Name = var.database_subnet_names[count.index]
    }
   ) 
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  tags = merge(
    var.common_tags,
    var.public_route_table_tags
   )
}