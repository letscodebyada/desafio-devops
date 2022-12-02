module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.18.1"

  name = "ada-challenge"
  cidr = "10.10.0.0/24"

  azs                        = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets            = ["10.10.0.0/27", "10.10.0.32/27", "10.10.0.64/27"]
  public_subnets             = ["10.10.0.96/27", "10.10.0.128/27", "10.10.0.160/27"]
  database_subnets           = ["10.10.0.192/27", "10.10.0.224/27"]
  database_subnet_group_name = "rds-subnet-group"

  public_subnet_tags = {
    subnet_type = "public"
  }

  private_subnet_tags = {
    subnet_type = "private"
  }

  database_subnet_tags = { 
    subnet_type = "database" 
  }

  enable_nat_gateway     = true
  one_nat_gateway_per_az = true
  enable_dns_hostnames   = true
  enable_dns_support     = true
  enable_dhcp_options    = true

  dhcp_options_domain_name = "ec2.internal"
  dhcp_options_ntp_servers = ["200.160.7.186", "201.49.148.135", "200.186.125.195", "200.20.186.76"]

  tags = { vpc_type = "default-vpc" }

}

output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnets
}
output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.vpc.public_subnets
}
output "database_subnets" {
  description = "List of IDs of Database subnets"
  value       = module.vpc.database_subnets
}