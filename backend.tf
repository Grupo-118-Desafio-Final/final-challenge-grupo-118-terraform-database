terraform {
  # Configure the backend to use Terraform Cloud
  backend "remote" {
    organization = "Grupo-118-Desafio-Final"

    workspaces {
      name = "final-challenge-grupo-118-terraform-db"
    }
  }
}