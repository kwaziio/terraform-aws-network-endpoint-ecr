# Terraform AWS VPC Endpoint Module for ECR by KWAZI

Terraform Module for Creating a Standardized VPC Endpoint for ECR

## Getting Started

> NOTE: This section assumes that you have Terraform experience, have already created an AWS account, and have already configured programmatic access to that account via access token, Single-Sign On (SSO), or AWS Identity and Access Management (IAM) role. If you need help, [checkout our website](https://www.kwazi.io).

The simplest way to get started is to create a `main.tf` file with the minimum configuration options. You can use the following as a template:

```HCL
##################################
# Example Terraform Module Usage #
##################################

module "terraform_aws_network_endpoint_ecr" {
  source = "../../"

  endpoint_subnet_ids = ["REPLACE_WITH_SUBNET_IDS"]
  network_id          = "REPLACE_WITH_VPC_ID"
}
```

In the example above, you should replace the following templated values:

Placeholder | Description
--- | ---
`REPLACE_WITH_SUBNET_IDS` | Replace this w/ a List of Subnet IDs
`REPLACE_WITH_VPC_ID` | Replace this w/ the ID of the Targeted VPC

> TIP: Check [our example](examples/complete/main.tf) for a working example of provisioning the AWS VPC mentioned above.

## Need Help?

Working in a strict environment? Struggling to make design decisions you feel comfortable with? Want help from an expert that you can rely on -- one who won't abandon you when the job is finished?

Check us out at [https://www.kwazi.io](https://www.kwazi.io).

## Major Created Resources

The following table lists resources that this module may create in AWS, accompanied by conditions for when they will or will not be created:

Resource Name | Creation Condition
--- | ---
VPC Interface Endpoint | Always

## Usage Examples

The following examples are provided as guidance:

* [examples/complete](examples/complete/main.tf)
