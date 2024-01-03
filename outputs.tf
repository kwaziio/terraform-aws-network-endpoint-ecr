######################################################################################
# Provides Information About VPC [Network] Endpoint Resources Created by this Module #
######################################################################################

output "arn" {
  description = "Amazon Resource Name (ARN) of the VPC Endpoint"
  value       = aws_vpc_endpoint.ecr_dkr.arn
}

output "id" {
  description = "Unique ID Assigned to the VPC Endpoint"
  value       = aws_vpc_endpoint.ecr_dkr.id
}

output "network_id" {
  description = "VPC ID of the VPC Associated w/ this VPC Endpoint"
  value       = aws_vpc_endpoint.ecr_dkr.vpc_id
}
