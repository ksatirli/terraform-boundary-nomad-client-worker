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

variable "boundary_account_description" {
  type        = string
  description = "Account Description of the Boundary User for Nomad Clients."
  default     = "Terraform-managed User for Nomad Clients designed to self-register as Boundary Workers."
}

variable "boundary_account_name" {
  type        = string
  description = "Account Name of the Boundary User for Nomad Clients."
  default     = "nomad-client-worker"
}

variable "boundary_account_password" {
  type        = string
  description = "Account Password of the Boundary User for Nomad Clients."
  sensitive   = true
}

variable "boundary_role_description" {
  type        = string
  description = "Description of the Boundary Role for Nomad Clients."
  default     = "Terraform-managed Role for Nomad Clients designed to self-register as Boundary Workers."
}

variable "boundary_role_grant_strings" {
  type        = list(string)
  description = "List of Grants of the Boundary Role for Nomad Clients."

  # see https://developer.hashicorp.com/boundary/docs/concepts/security/permissions/resource-table
  default = [
    # enable creation of Boundary Workers (with Controller-led Registration)
    "type=worker;actions=create:controller-led",

    # enable Read, Update, Delete for all Boundary Workers
    "type=worker;id=*;actions=read",
    "type=worker;id=*;actions=update",
    "type=worker;id=*;actions=delete",
  ]
}

variable "boundary_role_name" {
  type        = string
  description = "Name of the Boundary Role for Nomad Clients."
  default     = "nomad_client_worker_registration_lifecycle"
}

variable "boundary_scope_id" {
  type        = string
  description = "Scope ID for the Default Auth Method of the Boundary Controller."

  # Workers must be created in the `global` Scope.
  default = "global"
}

variable "hcp_boundary_cluster_id" {
  type        = string
  description = "ID of the HCP Boundary Controller."
}

variable "nomad_variable_path" {
  type        = string
  description = "Path of the Nomad Variable."
}
