#####################################################################
# Retrieves AWS Service Information for AWS ECR Docker Registry API #
#####################################################################

data "aws_vpc_endpoint_service" "ecr_dkr" {
  service      = "ecr.dkr"
  service_type = "Interface"
}

##################################################################
# Creates VPC Interface Endpoint for AWS ECR Docker Registry API #
##################################################################

resource "aws_vpc_endpoint" "ecr_dkr" {
  auto_accept         = var.endpoint_auto_accept
  ip_address_type     = var.endpoint_ip_address_type
  private_dns_enabled = true
  security_group_ids  = var.endpoint_firewall_ids
  service_name        = data.aws_vpc_endpoint_service.ecr_dkr.service_name
  subnet_ids          = var.endpoint_subnet_ids
  vpc_endpoint_type   = "Interface"
  vpc_id              = var.network_id

  dns_options {
    dns_record_ip_type = var.endpoint_dns_record_ip_type
  }

  tags = merge({
    Name = "${var.endpoint_prefix}${var.endpoint_name}"
  }, var.resource_tags)
}
