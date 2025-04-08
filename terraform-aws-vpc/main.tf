# Create the main VPC
resource "aws_vpc" "main" {
  cidr_block             = var.cidr_block                # VPC CIDR block (e.g., "10.0.0.0/16")
  enable_dns_hostnames   = var.enable_dns_hostnames      # Enable DNS hostnames
  enable_dns_support     = var.enable_dns_support        # Enable DNS resolution

  tags = merge(
    var.common_tags,                                     # Shared/common tags
    var.vpc_tags                                          # VPC-specific tags
  )
}

# Create an Internet Gateway for public internet access
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    var.common_tags,
    var.igw_tags                                          # IGW-specific tags
  )
}

# Create public subnets across availability zones
resource "aws_subnet" "public" {
  count             = length(var.public_subnet_cidr)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnet_cidr[count.index]
  availability_zone = var.azs[count.index]

  tags = merge(
    var.common_tags,
    { Name = var.public_subnet_names[count.index] }
  )
}

# Create private subnets across availability zones
resource "aws_subnet" "private" {
  count             = length(var.private_subnet_cidr)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidr[count.index]
  availability_zone = var.azs[count.index]

  tags = merge(
    var.common_tags,
    { Name = var.private_subnet_names[count.index] }
  )
}

# Create database subnets across availability zones
resource "aws_subnet" "database" {
  count             = length(var.database_subnet_cidr)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.database_subnet_cidr[count.index]
  availability_zone = var.azs[count.index]

  tags = merge(
    var.common_tags,
    { Name = var.database_subnet_names[count.index] }
  )
}

# Create route table for public subnets
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    var.common_tags,
    var.public_route_table_tags
  )
}

# Add default route to public route table via Internet Gateway
resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
  depends_on             = [aws_route_table.public]
}

# Associate public subnets with the public route table
resource "aws_route_table_association" "public" {
  count          = length(var.public_subnet_cidr)
  subnet_id      = element(aws_subnet.public[*].id, count.index)
  route_table_id = aws_route_table.public.id
}

# Create route table for private subnets
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    var.common_tags,
    var.private_route_table_tags
  )
}

# Associate private subnets with the private route table
resource "aws_route_table_association" "private" {
  count          = length(var.private_subnet_cidr)
  subnet_id      = element(aws_subnet.private[*].id, count.index)
  route_table_id = aws_route_table.private.id
}

# Create route table for database subnets
resource "aws_route_table" "database" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    var.common_tags,
    var.database_route_table_tags
  )
}

# Associate database subnets with the database route table
resource "aws_route_table_association" "database" {
  count          = length(var.database_subnet_cidr)
  subnet_id      = element(aws_subnet.database[*].id, count.index)
  route_table_id = aws_route_table.database.id
}
