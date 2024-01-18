# Example: `basic`

This is a _basic_ example of the `terraform-boundary-nomad-client-worker` module.

<!-- BEGIN_TF_DOCS -->
### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| boundary_account_password | Account Password of the Boundary User for Nomad Clients. | `string` | n/a | yes |
| boundary_auth_method_id | Auth Method Id of the Boundary Controller. | `string` | n/a | yes |
| boundary_auth_method_login_name | Auth Method Login Name of the Boundary Controller. | `string` | n/a | yes |
| boundary_auth_method_password | Auth Method Password of the Boundary Controller. | `string` | n/a | yes |
| hcp_boundary_cluster_id | ID of the HCP Boundary Controller. | `string` | n/a | yes |
| nomad_variable_path | Path of the Nomad Variable. | `string` | `"nomad/jobs/boundary_worker"` | no |

### Outputs

| Name | Description |
|------|-------------|
| boundary_account_password | Exported Values of `boundary_account_password`. |
| boundary_role | Exported Values of `boundary_role`. |
| boundary_user | Exported Values of `boundary_user`. |
| nomad_variable | Exported Values of `nomad_variable`. |
<!-- END_TF_DOCS -->
