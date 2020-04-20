//
// Create Organization Root
//
module "organizations" {
  source          = "./modules/organizations" 
}

//
// Create OU's SCP's and Accounts
//
module "ou_subdivision" {
  source          = "./modules/ou_subdivision"
  root_ou       = module.organizations.organizations_root_id
}
