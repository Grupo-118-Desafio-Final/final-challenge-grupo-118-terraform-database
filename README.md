# Introduction
Repository to create the MongoDB and SQL Server for the Kubernetes API usage.

## Create Token on HCP platform

After create the token, you need to consume the value via environment variable

```bash
export TF_TOKEN_app_terraform_io="your-terraform-cloud-token"
```

# Backend configuration

```tf
terraform {
  # Configure the backend to use Terraform Cloud
  backend "remote" {
    organization = "<organization_name>"

    workspaces {
      name = "<organization_name>"
    }
  }
}
```

# Provider configuration
```tf
provider "mongodbatlas" {
  public_key  = var.mongodb_atlas_public_key
  private_key = var.mongodb_atlas_private_key
}

terraform {
  required_providers {
    mongodbatlas = {
      source  = "mongodb/mongodbatlas"
      version = "~> 1.17"
    }
  }
}
```