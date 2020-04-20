# Specify the provider and region details
provider "aws" {
  region  = "us-gov-east-1"
  assume_role {
  role_arn 	   = "arn:aws-us-gov:iam::${var.gov_master_acct_id}:role/${var.gov_master_acct_role}"
  session_name = "terraform-govcloud-session"
 }
}

