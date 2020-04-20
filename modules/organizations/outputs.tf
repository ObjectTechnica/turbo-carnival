output "organizations_root_id" {
  value  = aws_organizations_organization.org.roots.0.id
}

output "aws_organizations_id" {
  value = aws_organizations_organization.org.id
}
