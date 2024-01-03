####################################################################
# AWS Virtual Private Cloud (VPC) [Network] Endpoint Configuration #
####################################################################

variable "endpoint_auto_accept" {
  default     = true
  description = "'true' if this VPC Endpoint Should be Automatically Approved"
  type        = bool
}

variable "endpoint_dns_record_ip_type" {
  default     = "ipv4"
  description = "Type of IP Address to Assocate w/ DNS Record for this Endpoint"
  type        = string
}

variable "endpoint_firewall_ids" {
  default     = []
  description = "List of AWS VPC [Network] Security Group [Firewall] IDs to Associate w/ Endpoint"
  type        = list(string)
}

variable "endpoint_ip_address_type" {
  default     = "ipv4"
  description = "IP Address Type to Assign to VPC Endpoint Interface"
  type        = string
}

variable "endpoint_name" {
  default     = "ecr-dkr"
  description = "Name Tag to Assign to the Created VPC Endpoint"
  type        = string
}

variable "endpoint_prefix" {
  default     = null
  description = "Prefix to Append to VPC Endpoint Name"
  type        = string
}

variable "endpoint_subnet_ids" {
  description = "List of AWS VPC [Network] Subnet IDs to Associate w/ Endpoint"
  type        = list(string)
}

###########################################################
# AWS Virtual Private Cloud (VPC) [Network] Configuration #
###########################################################

variable "network_id" {
  description = "Dynamically-Assigned Identifier (ID) for this Network"
  type        = string
}

##################################
# Created Resource Configuration #
##################################

variable "resource_tags" {
  default     = {}
  description = "Map of AWS Resource Tags to Assign to All Created Resources"
  type        = map(string)
}
