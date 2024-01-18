output "boundary_account_password" {
  description = "Exported Values of `boundary_account_password`."
  value       = module.simple.boundary_account_password
  sensitive   = true
}

output "boundary_user" {
  description = "Exported Values of `boundary_user`."
  value       = module.simple.boundary_user
}

output "boundary_role" {
  description = "Exported Values of `boundary_role`."
  value       = module.simple.boundary_role
}

output "nomad_variable" {
  description = "Exported Values of `nomad_variable`."
  value       = module.simple.nomad_variable
  sensitive   = true
}
