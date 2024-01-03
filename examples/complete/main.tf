###########################
# Terraform Configuration #
###########################

terraform {
  required_version = ">= 1.6.1"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.21"
    }
  }
}

##############################
# AWS Provider Configuration #
##############################

provider "aws" {
  // DO NOT HARDCODE CREDENTIALS (Use Environment Variables)
}

###################################
# Required Prerequisite Resources #
###################################

module "network" {
  source = "kwaziio/network/aws"

  network_enable_nat         = true
  network_primary_cidr_block = "10.0.0.0/16"
  network_tags_name          = "example-network"
  network_trusted_ipv4_cidrs = ["0.0.0.0/0"]

  subnets_private = [
    {
      cidr = "10.0.0.0/19",
      name = "private-a",
      zone = "a",
    },
    {
      cidr = "10.0.32.0/19",
      name = "private-b",
      zone = "b",
    },
    {
      cidr = "10.0.64.0/19",
      name = "private-c",
      zone = "c",
    },
  ]

  subnets_public = [
    {
      cidr = "10.0.192.0/20",
      name = "public-a",
      zone = "a",
    },
    {
      cidr = "10.0.208.0/20",
      name = "public-b",
      zone = "b",
    },
    {
      cidr = "10.0.224.0/20",
      name = "public-c",
      zone = "c",
    },
  ]
}

module "firewall_vpc_endpoint" {
  source  = "kwaziio/firewall-vpc-endpoint/aws"

  firewall_allowed_ipv4_ingress_cidrs = module.network.subnets_private.*.cidr_block
  network_id                          = module.network.network_id
}

##################################
# Example Terraform Module Usage #
##################################

module "terraform_aws_network_endpoint_ecr" {
  source = "../../"

  endpoint_firewall_ids = [module.firewall_vpc_endpoint.id]
  endpoint_prefix       = "${module.network.network_name}-"
  endpoint_subnet_ids   = module.network.subnets_private.*.id
  network_id            = module.network.network_id
}
