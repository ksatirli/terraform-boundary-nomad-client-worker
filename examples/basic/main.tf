module "simple" {
  source = "../.."

  boundary_account_password       = var.boundary_account_password
  boundary_auth_method_id         = var.boundary_auth_method_id
  boundary_auth_method_login_name = var.boundary_auth_method_login_name
  boundary_auth_method_password   = var.boundary_auth_method_password

  hcp_boundary_cluster_id         = var.hcp_boundary_cluster_id

  nomad_variable_path = var.nomad_variable_path
}
