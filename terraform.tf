terraform {
  required_providers {
    # see https://registry.terraform.io/providers/hashicorp/boundary/1.1.12
    boundary = {
      source  = "hashicorp/boundary"
      version = "1.1.12"
    }

    # see https://registry.terraform.io/providers/hashicorp/nomad/2.1.0
    nomad = {
      source  = "hashicorp/nomad"
      version = "2.1.0"
    }
  }
}
