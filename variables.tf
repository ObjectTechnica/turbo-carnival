 variable "gov_master_acct_id" {
   description = "The 12-digit account id for the AWS GOVCLOUD Master account"
   default     = "" 
 }

variable "gov_master_acct_role" {
   description = "The preffered role for terraform to make changes to the AWS GOVCLOUD Master account"
   default     = "" 
 }