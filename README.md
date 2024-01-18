# Boundary: Nomad Client-based Boundary Workers

> This Terraform Module provisions Boundary Account and Role resources for usage with
> Nomad Clients that orchestrate deployments of Boundary Worker and Targets.

## Table of Contents

<!-- TOC -->
* [Boundary: Nomad Client-based Boundary Workers](#boundary-nomad-client-based-boundary-workers)
  * [Table of Contents](#table-of-contents)
  * [Requirements](#requirements)
  * [Usage](#usage)
    * [Inputs](#inputs)
    * [Outputs](#outputs)
  * [Notes](#notes)
    * [Boundary Grant Strings](#boundary-grant-strings)
    * [Nomad Variable Path](#nomad-variable-path)
  * [Author Information](#author-information)
  * [License](#license)
<!-- TOC -->

## Requirements

* HashiCorp HCP Boundary `0.14.0` or newer
* HashiCorp Nomad `1.5.0` or newer
* HashiCorp Terraform `1.5.0` or newer.

## Usage

> **Warning**
> Interacting with sensitive data from Terraform causes any secrets that you read and write to be persisted in Terraform's state file and in any generated plan files.

For examples, see the [./examples](https://github.com/ksatirli/terraform-vault-kv-v2/tree/main/examples/) directory.

<!-- BEGIN_TF_DOCS -->
### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| boundary_account_password | Account Password of the Boundary User for Nomad Clients. | `string` | n/a | yes |
| boundary_auth_method_id | Auth Method Id of the Boundary Controller. | `string` | n/a | yes |
| boundary_auth_method_login_name | Auth Method Login Name of the Boundary Controller. | `string` | n/a | yes |
| boundary_auth_method_password | Auth Method Password of the Boundary Controller. | `string` | n/a | yes |
| hcp_boundary_cluster_id | ID of the HCP Boundary Controller. | `string` | n/a | yes |
| nomad_variable_path | Path of the Nomad Variable. | `string` | n/a | yes |
| boundary_account_description | Account Description of the Boundary User for Nomad Clients. | `string` | `"Terraform-managed User for Nomad Clients designed to self-register as Boundary Workers."` | no |
| boundary_account_name | Account Name of the Boundary User for Nomad Clients. | `string` | `"nomad-client-worker"` | no |
| boundary_role_description | Description of the Boundary Role for Nomad Clients. | `string` | `"Terraform-managed Role for Nomad Clients designed to self-register as Boundary Workers."` | no |
| boundary_role_grant_strings | List of Grants of the Boundary Role for Nomad Clients. | `list(string)` | <pre>[<br>  "type=worker;actions=create:controller-led",<br>  "type=worker;id=*;actions=read",<br>  "type=worker;id=*;actions=update",<br>  "type=worker;id=*;actions=delete"<br>]</pre> | no |
| boundary_role_name | Name of the Boundary Role for Nomad Clients. | `string` | `"nomad_client_worker_registration_lifecycle"` | no |
| boundary_scope_id | Scope ID for the Default Auth Method of the Boundary Controller. | `string` | `"global"` | no |

### Outputs

| Name | Description |
|------|-------------|
| boundary_account_password | Exported Values of `boundary_account_password.main`. |
| boundary_role | Exported Values of `boundary_role.main`. |
| boundary_user | Exported Values of `boundary_user.main`. |
| nomad_variable | Exported Values of `nomad_variable.main`. |
<!-- END_TF_DOCS -->

## Notes

### Boundary Grant Strings

The `boundary_role_grant_strings` Terraform Variable defines the list of Grant strings that will be used to create the Boundary Role.

For more information, see the documentation on [Permissions in Boundary](https://developer.hashicorp.com/boundary/docs/concepts/security/permissions).

### Nomad Variable Path

The `nomad_variable_path` Terraform Variable defines the location of a [Nomad Variable](https://developer.hashicorp.com/nomad/docs/concepts/variables) that will be rendered with a Boundary Controller address and account credentials.

The format of the variable conforms to a format that may be used with the [Boundary Worker Nomad Pack](https://github.com/workloads/nomad-pack-registry/tree/main/packs/boundary_worker), available via the [Workloads Nomad Pack Registry](https://github.com/workloads/nomad-pack-registry/).

The path of the Nomad Variable enables fine-grained scoping and should be as specific as possible, allowing only the relevant task(s) to read the contents of the Variable.

See the documentation on providing [Variable access to Tasks](https://developer.hashicorp.com/nomad/docs/concepts/variables#task-access-to-variables) for more information.

## Author Information

This module is maintained by the contributors listed on [GitHub](https://github.com/ksatirli/terraform-boundary-nomad-client-worker/graphs/contributors).

## License

Licensed under the Apache License, Version 2.0 (the "License").

You may obtain a copy of the License at [apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an _"AS IS"_ basis, without WARRANTIES or conditions of any kind, either express or implied.

See the License for the specific language governing permissions and limitations under the License.
