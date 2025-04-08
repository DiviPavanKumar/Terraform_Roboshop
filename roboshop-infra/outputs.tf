# Output the complete public subnet information from the module
output "public_subnet_info" {
  description = "Full details of the public subnets created by the module"
  value       = module.this.public_subnets
}
