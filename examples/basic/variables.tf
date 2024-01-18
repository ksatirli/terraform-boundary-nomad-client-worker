variable "boundary_auth_method_id" {
  type        = string
  description = "Auth Method Id of the Boundary Controller."
}

variable "boundary_auth_method_login_name" {
  type        = string
  description = "Auth Method Login Name of the Boundary Controller."
}

variable "boundary_auth_method_password" {
  type        = string
  description = "Auth Method Password of the Boundary Controller."
  sensitive   = true
}

variable "boundary_account_password" {
  type        = string
  description = "Account Password of the Boundary User for Nomad Clients."
  sensitive   = true
}

variable "hcp_boundary_cluster_id" {
  type        = string
  description = "ID of the HCP Boundary Controller."
}

variable "nomad_variable_path" {
  type        = string
  description = "Path of the Nomad Variable."

  # This path allows for scoping of variables and should be as specific as possible.
  # see https://developer.hashicorp.com/nomad/docs/concepts/variables#task-access-to-variables
  default = "nomad/jobs/boundary_worker"
}
