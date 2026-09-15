# see https://registry.terraform.io/providers/hashicorp/boundary/latest/docs
provider "boundary" {
  addr = local.boundary_addr

  auth_method_id         = var.boundary_auth_method_id
  auth_method_login_name = var.boundary_auth_method_login_name
  auth_method_password   = var.boundary_auth_method_password

  scope_id = var.boundary_scope_id
}

# see https://registry.terraform.io/providers/hashicorp/nomad/latest/docs
provider "nomad" {
  address   = var.nomad_addr
  region    = var.nomad_region
  secret_id = var.nomad_secret_id
}
