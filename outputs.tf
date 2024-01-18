output "boundary_account_password" {
  description = "Exported Values of `boundary_account_password.main`."
  value       = boundary_account_password.main
  sensitive   = true
}

output "boundary_user" {
  description = "Exported Values of `boundary_user.main`."
  value       = boundary_user.main
}

output "boundary_role" {
  description = "Exported Values of `boundary_role.main`."
  value       = boundary_role.main
}

output "nomad_variable" {
  description = "Exported Values of `nomad_variable.main`."
  value       = nomad_variable.main
  sensitive   = true
}
