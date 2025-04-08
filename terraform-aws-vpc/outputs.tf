# Output the full list of public subnet resources (useful for referencing attributes like AZs, CIDRs, etc.)
output "public_subnets" {
  description = "Full list of public subnet resources"
  value       = aws_subnet.public
}
