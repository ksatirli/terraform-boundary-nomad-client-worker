# see https://registry.terraform.io/providers/hashicorp/boundary/latest/docs/resources/account_password
resource "boundary_account_password" "main" {
  auth_method_id = var.boundary_auth_method_id
  description    = var.boundary_account_description
  login_name     = var.boundary_account_name
  name           = var.boundary_account_name
  password       = var.boundary_account_password
}

# see https://registry.terraform.io/providers/hashicorp/boundary/latest/docs/resources/user
resource "boundary_user" "main" {
  scope_id = var.boundary_scope_id

  account_ids = [
    boundary_account_password.main.id
  ]

  description = boundary_account_password.main.description
  name        = boundary_account_password.main.name
}

# see https://registry.terraform.io/providers/hashicorp/boundary/latest/docs/resources/role
resource "boundary_role" "main" {
  description   = var.boundary_role_description
  name          = var.boundary_role_name
  grant_strings = var.boundary_role_grant_strings
  scope_id      = var.boundary_scope_id
}

# see https://registry.terraform.io/providers/hashicorp/nomad/latest/docs/resources/variable
resource "nomad_variable" "main" {
  path = var.nomad_variable_path

  items = {
    "boundary_auth_method_id" : var.boundary_auth_method_id,
    "boundary_password" : boundary_account_password.main.password,
    "boundary_scope_id" : boundary_user.main.scope_id,
    "boundary_username" : boundary_user.main.name,
    "hcp_boundary_cluster_id" : var.hcp_boundary_cluster_id,
  }
}
