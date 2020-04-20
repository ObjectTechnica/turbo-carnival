output "organization_unit_managed" {
  value  = aws_organizations_organizational_unit.managed.id
}

output "organization_unit_customer" {
  value  = aws_organizations_organizational_unit.customer.id
}
